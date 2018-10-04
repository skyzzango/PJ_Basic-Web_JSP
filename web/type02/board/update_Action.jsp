<%@ page import="type02.board.BoardDao" %><%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-10-04
  Time: 오후 8:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">
<head>
	<%@include file="/view/partials/head.jsp" %>
	<title>게시판 - 게시글 업데이트</title>
</head>

<body>

<%@include file="/view/partials/nav.jsp" %>
<%
	String idx = request.getParameter("idx");
	String title = request.getParameter("title")
			.replaceAll("&", "&amp;").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
			.replaceAll("\"", "&quot;").replaceAll("\'", "&#x27;").replaceAll("\\\\", "&#x5c;");
	String content = request.getParameter("content")
			.replaceAll("&", "&amp;").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
			.replaceAll("\"", "&quot;").replaceAll("\'", "&#x27;").replaceAll("\\\\", "&#x5c;");
%>
<%
	int result = BoardDao.getInstance().updateBoard(idx, title, content);
	out.print("<script>");
	if (result == 0) out.println("alert('게시글 수정 실패!!')");
	else out.println("alert('게시글 수정 완료!!')");
	out.println("location.href='content.jsp?idx=" + idx + "'");
	out.print("</script>");
%>

<div class="container">

	<div class="starter-template">
		<h1>게시글 업데이트</h1><br>


	</div>


</div><!-- /.container -->


<%@include file="/view/partials/script.jsp" %>

</body>
</html>
