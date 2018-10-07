<%@ page import="type02.board.BoardDao" %>
<%@ page import="type02.board.BoardDto" %><%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-10-04
  Time: 오후 4:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">
<head>
	<%@include file="/view/partials/head.jsp" %>
	<title>게사판 - 게시글 조회</title>
</head>

<body>

<%@include file="/view/partials/nav.jsp" %>
<%
	String idx = request.getParameter("idx");
	BoardDto board = BoardDao.getInstance().getBoard(idx);
	if (board.getIdx() != 0) {
		board.setContent(board.getContent().replace("\n", "<br>"));
		request.setAttribute("board", board);
	} else {
		out.print("<script>");
		out.println("alert('게시물이 존재 하지 않습니다.')");
		out.println("location.href='index.jsp'");
		out.print("</script>");
	}
%>

<div class="container">

	<div class="starter-template">
		<h1>게시글 조회</h1><br>
		<table class="table">
			<tr>
				<th colspan="2">번호</th>
				<td colspan="1">${board.idx}</td>
				<th colspan="2">조회수</th>
				<td colspan="1">${board.count}</td>
			</tr>
			<tr>
				<th colspan="2">작성자</th>
				<td colspan="1">${board.writer}</td>
				<th colspan="2">날짜</th>
				<td colspan="1">${board.reg_date}</td>
			</tr>
			<tr>
				<th colspan="2">제목</th>
				<td colspan="6">${board.title}</td>
			</tr>
			<tr>
				<th colspan="2">링크</th>
				<td colspan="6">
					<a href="${board.link}">${board.link}</a>
				</td>
			</tr>
			<tr style="height: 10rem">
				<th colspan="2">내용</th>
				<td colspan="6">${board.content}</td>
			</tr>
			<tr>
				<th colspan="2"></th>
				<td colspan="6"></td>
			</tr>
		</table>
		<div style="text-align: center;margin: auto">
			<a class="btn btn-primary" href="index.jsp" role="button">목록</a>
			<c:if test="${sessionScope.member.email == board.writer}">
				<button type="button" class="btn btn-info" onclick="location.href='update_Form.jsp?idx=${board.idx}'">
					수정
				</button>
				<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">삭제</button>
			</c:if>
		</div>
	</div>

</div><!-- /.container -->

<!-- The Modal -->
<div class="modal fade" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">게시글 삭제</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				정말 삭제 하시겠습니까?
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger"
				        onclick="location.href='delete_Action.jsp?idx=${board.idx}'">삭제
				</button>
				<button type="button" class="btn btn-info" data-dismiss="modal">취소</button>
			</div>

		</div>
	</div>
</div><!-- /.Modal -->

<%@include file="/view/partials/script.jsp" %>

</body>
</html>
