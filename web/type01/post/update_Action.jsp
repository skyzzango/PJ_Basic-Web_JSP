<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-10-04
  Time: 오전 1:02
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
	int result = 0;
	String idx = request.getParameter("idx");
	String title = request.getParameter("title")
			.replaceAll("&", "&amp;").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
			.replaceAll("\"", "&quot;").replaceAll("\'", "&#x27;").replaceAll("\\\\", "&#x2F;");
	String content = request.getParameter("content")
			.replaceAll("&", "&amp;").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
			.replaceAll("\"", "&quot;").replaceAll("\'", "&#x27;").replaceAll("\\\\", "&#x2F;");

	try {
		String driverName = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";

		Class.forName(driverName);
		String sql = "update POST set TITLE = ?, CONTENT = ? where IDX = ?";

		try (
				Connection conn = DriverManager.getConnection(url, "iu", "iu1004");
				PreparedStatement pstmt = conn.prepareStatement(sql);
		) {
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, Integer.parseInt(idx));
			result = pstmt.executeUpdate();
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
		out.println("<script>alert('게시글 수정 실패!!')</script>");
	} else {
		out.println("<script>alert('게시글 수정 성공!!')</script>");
	}
	out.println("<script>location.href='content.jsp?idx=" + idx + "'</script>");
%>

<div class="container">

	<div class="starter-template">
		<h1>게시글 수정</h1>


	</div>

</div><!-- /.container -->


<%@include file="/view/partials/script.jsp" %>

</body>
</html>