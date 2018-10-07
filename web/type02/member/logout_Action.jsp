<%@ page import="type02.member.MemberDto" %><%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-10-07
  Time: 오후 3:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">
<head>
	<%@include file="/view/partials/head.jsp" %>
	<title>회원 - 로그아웃</title>
</head>

<body>

<%@include file="/view/partials/nav.jsp" %>
<%
	System.out.println("유저 로그아웃: " + ((MemberDto) session.getAttribute("member")).getEmail());
	session.removeAttribute("member");
	response.getWriter().println("<script>location.href = '/'</script>");
%>

<div class="container">

	<div class="starter-template">
		<h1>로그아웃</h1>


	</div>

</div><!-- /.container -->


<%@include file="/view/partials/script.jsp" %>

</body>
</html>