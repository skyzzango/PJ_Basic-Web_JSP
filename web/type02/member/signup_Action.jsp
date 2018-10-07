<%@ page import="type02.member.MemberDao" %><%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-10-07
  Time: 오후 2:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">
<head>
	<%@include file="/view/partials/head.jsp" %>
	<title>회원 - 회원등록</title>
</head>

<body>

<%@include file="/view/partials/nav.jsp" %>
<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String password_re = request.getParameter("password_re");
	String name = request.getParameter("name");
	if (!password.equals(password_re)) {
		out.println("<script>");
		out.println("alert('비밀번호가 일치 하지 않습니다.')");
		out.println("history.back()");
		out.println("</script>");
	} else {
		int result = MemberDao.getInstance().register(email, password, name);
		out.println("<script>");
		if (result == 1) {
			System.out.println("유저 가입: " + email);
			out.println("alert('회원가입 완료!!')");
			out.println("location.href = '/'");
		} else if (result == -1) {
			out.println("alert('이미 존재하는 아이디 입니다.')");
			out.println("location.href = 'signup.jsp'");
		}
		out.println("</script>");
	}
%>

<div class="container">

	<div class="starter-template">
		<h1>회원등록</h1>

	</div>

</div><!-- /.container -->


<%@include file="/view/partials/script.jsp" %>

</body>
</html>