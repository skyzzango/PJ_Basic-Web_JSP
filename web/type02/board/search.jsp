<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="type02.board.BoardDao" %>
<%@ page import="type02.board.BoardDto" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-10-05
  Time: 오후 8:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">
<head>
	<%@include file="/view/partials/head.jsp" %>
	<title>게시판 - 게시글 검색 리스트</title>

</head>

<body>

<%@include file="/view/partials/nav.jsp" %>
<%
	if (request.getParameter("search") == null) {
		out.print("<script>");
		out.println("alert('정상적인 접근이 아닙니다.')");
		out.println("history.back()");
		out.print("</script>");
	} else {
		if (request.getParameter("search").trim().length() < 2) {
			out.print("<script>");
			out.println("alert('검색어를 2자 이상 입력 하세요.')");
			out.println("history.back()");
			out.print("</script>");
		}
		String str = request.getParameter("search")
				.replaceAll("&", "&amp;").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
				.replaceAll("\"", "&quot;").replaceAll("\'", "&#x27;").replaceAll("\\\\", "&#x5c;");
		List<BoardDto> searchList = BoardDao.getInstance().getSearchList(str);
		if (searchList == null || searchList.size() < 1) {
			response.getWriter().println("<script>alert('검색 결과가 없습니다.')</script>");
			response.getWriter().println("<script>history.back()</script>");
		}
		request.setAttribute("searchList", searchList);
	}
%>

<div class="container">

	<div class="starter-template">
		<h1>게시글 검색 리스트</h1><br>

		<div style="text-align: right;margin: auto">
			총 ${searchList.size()}개 검색 완료
		</div>

		<div class="row" style="text-align: center;margin: auto">
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
				<c:forEach items="${searchList}" var="board">
					<tr>
						<td scope='row'>${board.idx}</td>
						<td><a href="content.jsp?idx=${board.idx}">${board.title}</a></td>
						<td>${board.writer}</td>
						<td>${board.reg_date}</td>
						<td>${board.count}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>

	</div>


</div><!-- /.container -->


<%@include file="/view/partials/script.jsp" %>

<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>

<script>
	// When the user scrolls down 20px from the top of the document, show the button
	window.onscroll = function () {
		scrollFunction()
	};

	function scrollFunction() {
		if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
			document.getElementById("myBtn").style.display = "block";
		} else {
			document.getElementById("myBtn").style.display = "none";
		}
	}

	// When the user clicks on the button, scroll to the top of the document
	function topFunction() {
		document.body.scrollTop = 0;
		document.documentElement.scrollTop = 0;
	}
</script>

</body>
</html>
