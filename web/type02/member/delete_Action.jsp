<%@ page import="type02.member.MemberDao" %>
<%@ page import="type02.member.MemberDto" %><%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-10-07
  Time: 오후 4:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">
<head>
	<%@include file="/view/partials/head.jsp" %>
	<title>회원 - 회원탈퇴</title>
</head>

<body>

<%@include file="/view/partials/nav.jsp" %>
<%
	MemberDto member = (MemberDto) session.getAttribute("member");
	String password = request.getParameter("password");
	if (!member.getPassword().equals(password)) {
		out.println("<script>alert('비밀번호를 확인 하세요.')</script>");
		out.println("<script>history.back()</script>");
	} else {
		int result = MemberDao.getInstance().deleteMember(member.getEmail());
		if (result == 1) {
			session.removeAttribute("member");
			out.println("<script>alert('회원 탈퇴 성공!!')</script>");
		} else {
			out.println("<script>alert('회원 탈퇴 실패!!')</script>");
		}
		out.println("<script>location.href='/'</script>");
	}
%>

<div class="container">

	<div class="starter-template">
		<h1>회원탈퇴</h1>


	</div>

</div><!-- /.container -->


<%@include file="/view/partials/script.jsp" %>

</body>
</html>