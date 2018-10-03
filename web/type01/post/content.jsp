<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-10-03
  Time: 오후 11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">
<head>
	<%@include file="/view/partials/head.jsp" %>
	<title>게시판 - 게시글 조회</title>
</head>

<body>

<%@include file="/view/partials/nav.jsp" %>
<%
	String idx = request.getParameter("idx");

	try {
		String driverName = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";

		Class.forName(driverName);
		String sql = "select * from POST where IDX = " + idx;

		try (
				Connection conn = DriverManager.getConnection(url, "iu", "iu1004");
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
		) {
			if (rs.next()) {
				request.setAttribute("idx", rs.getInt("idx"));
				request.setAttribute("title", rs.getString("title"));
				request.setAttribute("writer", rs.getString("writer"));
				request.setAttribute("reg_date", rs.getString("reg_date"));
				request.setAttribute("count", rs.getInt("count"));
				request.setAttribute("content", rs.getString("content"));
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
%>

<div class="container">

	<div class="starter-template">
		<h1>게시글 조회</h1><br>
		<table class="table">
			<tr>
				<th colspan="2">번호</th>
				<td colspan="1">${idx}</td>
				<th colspan="2">조회수</th>
				<td colspan="1">${count}</td>
			</tr>
			<tr>
				<th colspan="2">작성자</th>
				<td colspan="1">${writer}</td>
				<th colspan="2">날짜</th>
				<td colspan="1">${reg_date}</td>
			</tr>
			<tr>
				<th colspan="2">제목</th>
				<td colspan="6">${title}</td>
			</tr>
			<tr style="height: 10rem">
				<th colspan="2">내용</th>
				<td colspan="6">${content}</td>
			</tr>
		</table>
		<a class="btn btn-primary" href="index.jsp" role="button">목록</a>
	</div>

</div><!-- /.container -->


<%@include file="/view/partials/script.jsp" %>

</body>
</html>