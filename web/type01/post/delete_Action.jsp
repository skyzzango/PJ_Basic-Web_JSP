<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-10-04
  Time: 오전 12:07
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
	int result = 0;
	String idx = request.getParameter("idx");

	try {
		String driverName = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";

		Class.forName(driverName);
		String sql = "DELETE FROM post WHERE idx = " + idx;

		try (
				Connection conn = DriverManager.getConnection(url, "iu", "iu1004");
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
		) {
			if (rs.next()) {
				result = 1;
			}
		} catch (SQLException e) {
			System.out.println("Oracle Database Work Something Problem.");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
	} catch (Exception e) {
		System.out.println("Oracle Database Driver Something Problem.");
		System.out.println(e.getMessage());
		e.printStackTrace();
	}
	if (result == 0) {
		out.println("<script>alert('게시글 삭제 실패!!')</script>");
	} else {
		out.println("<script>alert('게시글 삭제 성공!!')</script>");
	}
	out.println("<script>location.href='redirect_Action.jsp'</script>");
%>

<div class="container">

	<div class="starter-template">
		<h1>게시글 삭제</h1>


	</div>

</div><!-- /.container -->


<%@include file="/view/partials/script.jsp" %>

</body>
</html>