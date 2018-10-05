<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-20
  Time: 오전 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
	<a class="navbar-brand" href="#">Logo</a>
	<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
	        data-target="#navb">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navb">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active">
				<a class="nav-link" href="${pageContext.request.contextPath}/">Home <span
						class="sr-only">(current)</span></a>
			</li>
			<li class="nav-item">
				<a class="nav-link disabled" href="#">Link</a>
			</li>
			<li class="nav-item">
				<a class="nav-link disabled" href="#">Disabled</a>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" data-toggle="dropdown"
				   aria-haspopup="true" aria-expanded="false">Dropdown</a>
				<div class="dropdown-menu" aria-labelledby="dropdown01">
					<a class="dropdown-item" href="<c:url value="/type01/post/"/>">Type1 - 게시판</a>
					<a class="dropdown-item" href="<c:url value="/type02/board/"/>">Type2 - 게시판</a>
					<a class="dropdown-item" href="#">Something</a>
				</div>
			</li>
		</ul>

		<div class="btn-inline my-2 my-lg-0">
			<% if (session.getAttribute("userId") == null) { %>
			<button class="btn btn-primary mr-sm-2" onclick="document.getElementById('id01').style.display='block'">
				Sign In
			</button>
			<% } else { %>
			<button class="btn btn-outline-primary mr-sm-2" onclick="location.href='/user/logoutProc.jsp'">
				Sign Out
			</button>
			<% } %>
			<button class="btn btn-primary mr-sm-3" onclick="document.getElementById('id02').style.display='block'">
				Sign Up
			</button>
		</div>

		<form class="form-inline my-2 my-lg-0" action="<c:url value="/type02/board/search.jsp"/>" method="get">
			<input class="form-control mr-sm-2" name="search" type="search" placeholder="Search" required>
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</form>

	</div>
</nav>
