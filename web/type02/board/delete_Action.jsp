<%@ page import="type02.board.BoardDao" %>
<%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-10-04
  Time: 오후 7:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">
<head>
	<%@include file="/view/partials/head.jsp" %>
	<title>게시판 - 게시글 삭제</title>
</head>

<body>

<%@include file="/view/partials/nav.jsp" %>
<%
	String idx = request.getParameter("idx");
	int result = BoardDao.getInstance().deleteBoard(idx);
	if (result == 0) {
		out.println("<script>alert('게시글 삭제 실패!!')</script>");
	} else {
		out.println("<script>alert('게시글 삭제 성공!!')</script>");
	}
	out.println("<script>location.href='redirect_Action.jsp'</script>");
%>

<div class="container">

	<div class="starter-template">
		<h1>게시글 삭제</h1><br>


	</div>


</div><!-- /.container -->


<%@include file="/view/partials/script.jsp" %>

</body>
</html>
