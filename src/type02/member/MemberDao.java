package type02.member;

import type02.util.CommonDao;

import java.io.File;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Collections;

public class MemberDao extends CommonDao {

	private MemberDao() {
	}

	public static MemberDao getInstance() {
		return LazyHolder.INSTANCE;
	}

	private boolean checkEmail(String email) {
		String sql = "select EMAIL from MEMBER where EMAIL = '" + email + "'";
		try (ResultSet rs = getConnection("oracle").prepareStatement(sql).executeQuery()) {
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			System.err.println("MemberDao function(checkEmail) Something Problem!!");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return false;
	}

	public MemberDto getMember(String email) {
		String sql = "select * from MEMBER where EMAIL = '" + email + "'";
		MemberDto member = new MemberDto();
		try (ResultSet rs = getConnection("oracle").prepareStatement(sql).executeQuery()) {
			if (rs.next()) {
				member.setEmail(rs.getString("email"));
				member.setPassword(rs.getString("password"));
				member.setName(rs.getString("name"));
				member.setPicture(rs.getString("picture"));
			}
		} catch (SQLException e) {
			System.err.println("MemberDao function(getMember) Something Problem!!");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return member;
	}

	public int login(String email, String password) {
		String sql = "select PASSWORD from MEMBER where EMAIL = '" + email + "'";
		try (ResultSet rs = getConnection("oracle").prepareStatement(sql).executeQuery()) {
			if (rs.next()) {
				if (rs.getString(1).equals(password)) {
					return 1;
				} else {
					return 0;
				}
			}
		} catch (Exception e) {
			System.err.println("MemberDao function(login) Something Problem!!");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return -1;
	}

	public int register(String email, String password, String name) {
		if (checkEmail(email)) return -1;
		String path = "";
		File[] files = new File("C:\\Users\\skyzz\\IdeaProjects\\PJ_Basic-Web_JSP\\web\\view\\images\\userImage\\cat" +
				"-power\\").listFiles();
		if (files != null) {
			Collections.shuffle(Arrays.asList(files));
			path = files[0].toString()
					.replaceAll("\\\\", "/")
					.replaceAll("C:/Users/skyzz/IdeaProjects/Study-JSP/web", "");
		}
		String sql = "insert into MEMBER (IDX, EMAIL, PASSWORD, NAME, PICTURE) " +
				"values (MEMBER_SEQ.nextval, ?, ?, ?, ?)";

		try (PreparedStatement pstmt = getConnection("oracle").prepareStatement(sql)) {
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			pstmt.setString(3, name);
			pstmt.setString(4, path);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.err.println("MemberDao function(register) Something Problem!!");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return 1;
	}

	public int updateMember(String email, String password, String name) {
		String sql = "update MEMBER set NAME = ?, PASSWORD = ?  where EMAIL = ?";
		try (PreparedStatement pstmt = getConnection("oracle").prepareStatement(sql)) {
			pstmt.setString(1, name);
			pstmt.setString(2, password);
			pstmt.setString(3, email);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("MemberDao function(updateMember) Something Problem!!");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return 0;
	}

	public int deleteMember(String email) {
		String sql = "delete from MEMBER where EMAIL = '" + email + "'";
		try (ResultSet rs = getConnection("oracle").prepareStatement(sql).executeQuery()) {
			if (rs.next()) {
				return 1;
			}
		} catch (SQLException e) {
			System.err.println("MemberDao function(deleteMember) Something Problem!!");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return 0;
	}

	private static class LazyHolder {
		static final MemberDao INSTANCE = new MemberDao();
	}

}
