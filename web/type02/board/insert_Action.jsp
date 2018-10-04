<%@ page import="type02.board.BoardDao" %>
<%@ page import="java.util.regex.Pattern" %><%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-10-04
  Time: 오후 7:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">
<head>
	<%@include file="/view/partials/head.jsp" %>
	<title>게시판 - 게시글 등록</title>
</head>

<body>

<%@include file="/view/partials/nav.jsp" %>
<%
	String writer = request.getParameter("writer");
	String title = request.getParameter("title")
			.replaceAll("&", "&amp;").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
			.replaceAll("\"", "&quot;").replaceAll("\'", "&#x27;").replaceAll("\\\\", "&#x5c;");
	String content = request.getParameter("content")
			.replaceAll("&", "&amp;").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
			.replaceAll("\"", "&quot;").replaceAll("\'", "&#x27;").replaceAll("\\\\", "&#x5c;");
%>
<%
	if (!Pattern.matches("^[_0-9a-zA-Z-]+@[0-9a-zA-Z-]+(.[_0-9a-zA-Z-]+)*$", writer)) {
		out.print("<script>");
		out.println("alert('이메일 형식이 아닙니다.')");
		out.println("history.back()");
		out.print("</script>");
	}
%>
<%
	int result = BoardDao.getInstance().insertBoard(title, writer, content);
	out.print("<script>");
	if (result == -1) out.println("alert('게시글 등록 실패!!')");
	else out.println("alert('게시글 등록 완료!!')");
	out.println("location.href='index.jsp';");
	out.print("</script>");
%>

<div class="container">

	<div class="starter-template">
		<h1>게시글 등록</h1><br>


	</div>


</div><!-- /.container -->


<%@include file="/view/partials/script.jsp" %>

</body>
</html>
