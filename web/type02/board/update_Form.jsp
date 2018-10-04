<%@ page import="type02.board.BoardDao" %>
<%@ page import="type02.board.BoardDto" %><%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-10-04
  Time: 오후 8:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">
<head>
	<%@include file="/view/partials/head.jsp" %>
	<title>게시판 - 게시글 수정</title>
</head>

<body>

<%@include file="/view/partials/nav.jsp" %>
<%
	String idx = request.getParameter("idx");
	BoardDto board = BoardDao.getInstance().getBoard(idx);
	if (board.getIdx() == 0) {
		out.print("<script>");
		out.println("alert('게시물이 존재 하지 않습니다.')");
		out.println("location.href='index.jsp'");
		out.print("</script>");
	}
	request.setAttribute("board", board);
%>

<div class="container">

	<div class="starter-template">
		<h1>게시글 수정</h1><br>
		<form action="update_Action.jsp" method="post">
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
					<td colspan="6">
						<input type="text" class="form-control" name="title" id="title" value="${board.title}" required
						       title="타이틀">
					</td>
				</tr>
				<tr style="height: 10rem">
					<th colspan="2">내용</th>
					<td colspan="6">
						<textarea class="form-control" name="content" id="content" rows="5" required
						          title="타이틀">${board.content}</textarea>
					</td>
				</tr>
				<tr>
					<th colspan="2"></th>
					<td colspan="6"></td>
				</tr>
			</table>
			<input type="hidden" name="idx" value="${board.idx}">
			<button type="button" class="btn btn-primary" onclick="location.href='content.jsp?idx=${board.idx}'">뒤로
			</button>
			<button type="submit" class="btn btn-info">수정</button>
			<button type="button" class="btn btn-danger" onclick="location.href='delete_Action.jsp?idx=${board.idx}'">삭제
			</button>
		</form>

	</div>


</div><!-- /.container -->


<%@include file="/view/partials/script.jsp" %>

</body>
</html>
