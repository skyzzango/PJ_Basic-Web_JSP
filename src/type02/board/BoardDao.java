package type02.board;

import type02.util.CommonDao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDao extends CommonDao {

	private BoardDao() {
	}

	public static BoardDao getInstance() {
		return LazyHolder.INSTANCE;
	}

	public int getBoardCnt() {
		int cnt = 0;
		String sql = "select count(*) as totalCount from POST";
		try (ResultSet rs = openConnection().executeQuery(sql)) {
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (Exception e) {
			System.err.println("PostDao function(getBoardCnt) Something Problem!!");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return cnt;
	}

	public List<BoardDto> getBoardList(int pageNum) {
		int num = pageNum * 10;
		String sql = "select B.* " +
				"from (select /*+index_desc(A IDX)*/ ROWNUM as RNUM, A.* " +
				"from (select * " +
				"from POST order by IDX desc) A " +
				"where ROWNUM <= " + num + ") B " +
				"where B.RNUM >= " + (num - 9);

		ArrayList<BoardDto> boardList = new ArrayList<>();
		try (ResultSet rs = openConnection().executeQuery(sql)) {
			while (rs.next()) {
				BoardDto board = new BoardDto();
				board.setIdx(rs.getInt("idx"));
				board.setTitle(rs.getString("title"));
				board.setWriter(rs.getString("writer"));
				board.setReg_date(rs.getString("reg_date"));
				board.setCount(rs.getInt("count"));
				board.setContent(rs.getString("content"));
				boardList.add(board);
			}
			closeConnection();
		} catch (SQLException e) {
			System.err.println("PostDao function(getBoardList) Something Problem!!");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return boardList;
	}

	public int insertBoard(String title, String writer, String content) {
		int result = -1;
		String sql = "insert into POST (IDX, TITLE, WRITER, CONTENT) " +
				"values (POST_SEQ.nextval, ?, ?, ?)";
		try (PreparedStatement pstmt = getConnection("oracle").prepareStatement(sql)) {
			pstmt.setString(1, title);
			pstmt.setString(2, writer);
			pstmt.setString(3, content);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("BoardDao function(insertBoard) Something Problem!!");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return result;
	}

	public int deleteBoard(String idx) {
		int result = 0;
		String sql = "DELETE FROM post WHERE idx = " + idx;
		try (ResultSet rs = getConnection("oracle").prepareStatement(sql).executeQuery()) {
			if (rs.next()) {
				result = 1;
			}
		} catch (SQLException e) {
			System.err.println("BoardDao function(deleteBoard) Something Problem!!");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return result;
	}

	public int updateBoard(String idx, String title, String content) {
		int result = 0;
		String sql = "update POST set TITLE = ?, CONTENT = ? where IDX = ?";
		try (PreparedStatement pstmt = getConnection("oracle").prepareStatement(sql)) {
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, idx);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("BoardDao function(updateBoard) Something Problem!!");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return result;
	}

	public BoardDto getBoard(String idx) {
		String sql1 = "update POST set COUNT = COUNT + 1 where IDX = " + idx;
		String sql = "select * from POST where IDX = " + idx;
		BoardDto board = new BoardDto();
		try (
				PreparedStatement pstmt1 = getConnection("oracle").prepareStatement(sql1);
				ResultSet rs = getConnection("oracle").prepareStatement(sql).executeQuery()
		) {
			pstmt1.executeUpdate();
			while (rs.next()) {
				board.setIdx(rs.getInt("idx"));
				board.setTitle(rs.getString("title"));
				board.setWriter(rs.getString("writer"));
				board.setReg_date(rs.getString("reg_date"));
				board.setCount(rs.getInt("count"));
				board.setContent(rs.getString("content"));
			}
		} catch (SQLException e) {
			System.err.println("BoardDao function(getBoard) Something Problem!!");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return board;
	}

	private PreparedStatement setPreparedStatement(PreparedStatement pstmt, Object status) throws SQLException {
		if (status instanceof String) {
			pstmt.setString(1, (String) status);
		} else {
			pstmt.setInt(1, (int) status);
		}
		return pstmt;
	}

	private static class LazyHolder {
		static final BoardDao INSTANCE = new BoardDao();
	}

}
