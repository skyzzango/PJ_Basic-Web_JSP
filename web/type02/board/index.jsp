<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="type02.board.BoardDao" %>
<%@ page import="type02.board.BoardDto" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-10-04
  Time: 오후 5:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">
<head>
	<%@include file="/view/partials/head.jsp" %>
	<title>게시판 - 게시글 리스트</title>

	<style>
		#myBtn {
			display: none;
			position: fixed;
			bottom: 20px;
			right: 30px;
			z-index: 99;
			font-size: 18px;
			border: none;
			outline: none;
			background-color: red;
			color: white;
			cursor: pointer;
			padding: 15px;
			border-radius: 4px;
		}

		#myBtn:hover {
			background-color: #555;
		}
	</style>
</head>

<body>

<%@include file="/view/partials/nav.jsp" %>
<%
	int pageNum = 1;
	int pageSize = 10;
	int blockSize = 5;
	int totalCount = BoardDao.getInstance().getBoardCnt();

	if (totalCount == 0) totalCount = 1;
	int totalPage = totalCount / pageSize;
	if (totalCount % pageSize > 0) totalPage++;

	if (request.getParameter("pageNum") != null) {
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
		if (pageNum < 1) pageNum = 1;
		else if (pageNum > totalPage) pageNum = totalPage;
	}

	int startPage = ((pageNum - 1) / blockSize) * blockSize + 1;
	int endPage = startPage + blockSize - 1;
	if (endPage > totalPage) endPage = totalPage;

	List<BoardDto> boardList = BoardDao.getInstance().getBoardList(pageNum);
	request.setAttribute("boardList", boardList);
	request.setAttribute("totalCount", totalCount);
	request.setAttribute("pageSize", pageSize);
	request.setAttribute("pageNum", pageNum);
	request.setAttribute("totalPage", totalPage);
	request.setAttribute("startPage", startPage);
	request.setAttribute("endPage", endPage);
%>

<div class="container">

	<div class="starter-template">
		<h1>게시글 리스트</h1><br>
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
			<c:forEach items="${boardList}" var="post">
				<tr>
					<td scope='row'>${post.idx}</td>
					<td><a href="content.jsp?idx=${post.idx}">${post.title}</a></td>
					<td>${post.writer}</td>
					<td>${post.reg_date}</td>
					<td>${post.count}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>

		<c:choose>
			<c:when test="${pageNum > 1}">
				<a href="?pageNum=${pageNum - 1}" class="btn btn-success btn-arraw-left">이전</a>
			</c:when>
			<c:otherwise>
				<a href="?pageNum=${pageNum - 1}" class="btn btn-success btn-arraw-left disabled">이전</a>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${pageNum < totalPage}">
				<a href="?pageNum=${pageNum + 1}" class="btn btn-success btn-arraw-left">다음</a>
			</c:when>
			<c:otherwise>
				<a href="?pageNum=${pageNum + 1}" class="btn btn-success btn-arraw-left disabled">다음</a>
			</c:otherwise>
		</c:choose>

		<a class="btn btn-primary btn-arraw-right" href="write_Form.jsp" role="button">글쓰기</a>

		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<c:choose>
					<c:when test="${pageNum > 1}">
						<li class="page-item">
							<a class="page-link" href="index.jsp?pageNum=1">First</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="index.jsp?pageNum=${pageNum - 1}" tabindex="-1">Previous</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled">
							<a class="page-link" href="index.jsp?pageNum=1">First</a>
						</li>
						<li class="page-item disabled">
							<a class="page-link" href="index.jsp?pageNum=${pageNum - 1}"
							   tabindex="-1">Previous</a>
						</li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
					<c:choose>
						<c:when test="${i == pageNum}">
							<li class="page-item active">
								<a class="page-link" href="index.jsp?pageNum=${i}">${i}</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
								<a class="page-link" href="index.jsp?pageNum=${i}">${i}</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${pageNum < totalPage}">
						<li class="page-item">
							<a class="page-link" href="index.jsp?pageNum=${pageNum + 1}">Next</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="index.jsp?pageNum=${totalPage}">Last</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled">
							<a class="page-link" href="index.jsp?pageNum=${pageNum + 1}">Next</a>
						</li>
						<li class="page-item disabled">
							<a class="page-link" href="index.jsp?pageNum=${totalPage}">Last</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>


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
