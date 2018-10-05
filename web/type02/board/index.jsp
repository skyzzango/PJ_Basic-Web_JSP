<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="type02.board.BoardDao" %><%--
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
<% request.setAttribute("boardDao", BoardDao.getInstance()); %>
<c:choose>
	<c:when test="${empty param.pageNum}">
		<fmt:parseNumber var="pageNum" value="1" integerOnly="true"/>
	</c:when>
	<c:otherwise>
		<fmt:parseNumber var="pageNum" value="${param.pageNum}" integerOnly="true"/>
	</c:otherwise>
</c:choose>
<fmt:parseNumber var="pageSize" value="10" integerOnly="true"/>
<fmt:parseNumber var="blockSize" value="5" integerOnly="true"/>
<fmt:parseNumber var="totalCount" value="${boardDao.boardCnt}" integerOnly="true"/>
<c:if test="${totalCount == 0}">
	<fmt:parseNumber var="totalCount" value="1" integerOnly="true"/>
</c:if>
<fmt:parseNumber var="totalPage" value="${totalCount / pageSize}" integerOnly="true"/>
<c:if test="${totalCount % pageSize > 0}">
	<fmt:parseNumber var="totalPage" value="${totalPage + 1}" integerOnly="true"/>
</c:if>
<c:choose>
	<c:when test="${pageNum < 1}">
		<fmt:parseNumber var="pageNum" value="1" integerOnly="true"/>
	</c:when>
	<c:when test="${pageNum > totalPage}">
		<fmt:parseNumber var="pageNum" value="${totalPage}" integerOnly="true"/>
	</c:when>
</c:choose>
<fmt:parseNumber var="tmpPage" value="${(pageNum - 1) / blockSize}" integerOnly="true"/>
<fmt:parseNumber var="startPage" value="${tmpPage * blockSize + 1}" integerOnly="true"/>
<fmt:parseNumber var="endPage" value="${startPage + blockSize}" integerOnly="true"/>

<c:out value="pageNum: ${pageNum}"/>
<c:out value="startPage: ${startPage}"/>
<c:out value="endPage: ${endPage}"/>

<c:if test="${endPage > totalPage}">
	<fmt:parseNumber var="endPage" value="${totalPage}" integerOnly="true"/>
</c:if>
<c:set var="boardList" value="${boardDao.getBoardList(pageNum)}"/>

<div class="container">

	<div class="starter-template">
		<h1>게시글 리스트</h1>

		<div style="text-align: right;margin: auto">
			총 ${totalCount}개 글 / 현재 ${pageNum} 페이지 / 총 ${totalPage} 페이지
		</div>

		<div style="text-align: center;margin: auto">
			<c:choose>
				<c:when test="${pageNum > 1}">
					<a href="?pageNum=${pageNum - 1}" class="btn btn-success btn-arraw-left">이전</a>
				</c:when>
				<c:otherwise>
					<a href="?pageNum=${pageNum - 1}" class="btn btn-success btn-arraw-left disabled">이전</a>
				</c:otherwise>
			</c:choose>

			<a class="btn btn-primary btn-arraw-right" href="write_Form.jsp" role="button">글쓰기</a>

			<c:choose>
				<c:when test="${pageNum < totalPage}">
					<a href="?pageNum=${pageNum + 1}" class="btn btn-success btn-arraw-left">다음</a>
				</c:when>
				<c:otherwise>
					<a href="?pageNum=${pageNum + 1}" class="btn btn-success btn-arraw-left disabled">다음</a>
				</c:otherwise>
			</c:choose>
		</div>
		<br>
		<div style="text-align: center;margin: auto">
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
				<c:forEach items="${boardList}" var="board">
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

		<div style="text-align: center;margin: auto">
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
