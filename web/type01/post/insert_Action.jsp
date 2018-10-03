<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-10-03
  Time: 오후 10:38
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
	int result = 0;
	String title = request.getParameter("title")
			.replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content")
			.replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");

	try {
		String driverName = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";

		Class.forName(driverName);
		String sql = "insert into POST (IDX, TITLE, WRITER, CONTENT) " +
				"values (POST_SEQ.nextval, ?, ?, ?)";

		try (
				Connection conn = DriverManager.getConnection(url, "iu", "iu1004");
				PreparedStatement pstmt = conn.prepareStatement(sql);
		) {
			pstmt.setString(1, title);
			pstmt.setString(2, writer);
			pstmt.setString(3, content);
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
		out.println("<script>alert('게시글 등록 실패!!')</script>");
	} else {
		out.println("<script>alert('게시글 등록 성공!!')</script>");
	}
	out.println("<script>location.href='index.jsp'</script>");
%>

<div class="container">

	<div class="starter-template">
		<h1>게시글 등록</h1>


	</div>

</div><!-- /.container -->


<%@include file="/view/partials/script.jsp" %>

</body>
</html>