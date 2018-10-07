<%@ page import="type02.member.MemberDao" %><%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-10-07
  Time: 오후 4:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">
<head>
	<%@include file="/view/partials/head.jsp" %>
	<title>회원 - 수정등록</title>
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
		int result = MemberDao.getInstance().updateMember(email, password, name);
		out.println("<script>");
		if (result == 1) {
			session.setAttribute("member", MemberDao.getInstance().getMember(email));
			out.println("alert('정보수정 완료!!')");
			out.println("location.href = '/'");
		} else if (result == -1) {
			out.println("alert('정보수정 실패!!')");
			out.println("location.href = 'update_Form.jsp'");
		}
		out.println("</script>");
	}
%>

<div class="container">

	<div class="starter-template">
		<h1>수정등록</h1>


	</div>

</div><!-- /.container -->


<%@include file="/view/partials/script.jsp" %>

</body>
</html>