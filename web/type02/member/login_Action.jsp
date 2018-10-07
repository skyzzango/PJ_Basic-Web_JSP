<%@ page import="type02.member.MemberDao" %><%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-10-07
  Time: 오후 2:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">
<head>
	<%@include file="/view/partials/head.jsp" %>
	<title>회원 - 로그인</title>
</head>

<body>

<%@include file="/view/partials/nav.jsp" %>
<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	int result = MemberDao.getInstance().login(email, password);
	out.println("<script>");
	if (result == 1) {
		System.out.println("유저 로그인: " + email);
		session.setAttribute("member", MemberDao.getInstance().getMember(email));
		out.println("location.href = '/'");
	} else if (result == 0) {
		out.println("alert('비빌번호를 확인 하세요.')");
		out.println("history.back()");
	} else if (result == -1) {
		out.println("alert('이메일을 확인 하세요.')");
		out.println("history.back()");
	}
	out.println("</script>");
%>

<div class="container">

	<div class="starter-template">
		<h1>로그인</h1>


	</div>

</div><!-- /.container -->


<%@include file="/view/partials/script.jsp" %>

</body>
</html>