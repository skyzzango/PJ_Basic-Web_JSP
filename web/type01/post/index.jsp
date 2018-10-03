<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-10-03
  Time: 오후 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">
<head>
	<%@include file="/view/partials/head.jsp" %>
	<title>게시판 - 게시글 리스트</title>
</head>

<body>

<%@include file="/view/partials/nav.jsp" %>
<%
	try {
		String driverName = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";

		Class.forName(driverName);
		String sql = "SELECT * FROM post ORDER BY idx DESC";

		try (
				Connection conn = DriverManager.getConnection(url, "iu", "iu1004");
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
		) {
%>

<div class="container">

	<div class="starter-template">
		<h1>게시글 리스트</h1>
		<table class="table table-hover">
			<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
			</thead>
			<tbody>
			<%
				while (rs.next()) {
					out.print("<tr>");
					out.print("<td scope='row'>" + rs.getString("idx") + "</td>");
					out.print("<td><a href='content.jsp?idx=" + rs.getString("idx") + "'>" + rs.getString("title") + "</a></td>");
					out.print("<td>" + rs.getString("writer") + "</td>");
					out.print("<td>" + rs.getString("reg_date") + "</td>");
					out.print("<td>" + rs.getString("count") + "</td>");
					out.print("</tr>");
				}
			%>
			</tbody>
		</table>
		<a class="btn btn-primary" href="write_Form.jsp" role="button">글쓰기</a>
	</div>

</div><!-- /.container -->

<%
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

<%@include file="/view/partials/script.jsp" %>

</body>
</html>