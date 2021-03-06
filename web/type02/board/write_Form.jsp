<%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-10-04
  Time: 오후 7:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">
<head>
	<%@include file="/view/partials/head.jsp" %>
	<title>게시판 - 게시글 작성</title>
</head>

<body>

<%@include file="/view/partials/nav.jsp" %>
<c:import url="/view/partials/loginCheck.jsp"/>

<div class="container">

	<div class="starter-template">
		<h1>게시글 작성</h1><br>
		<form action="insert_Action.jsp" method="post">
			<div class="form-group">
				<label for="writer">작성자</label>
				<input type="email" class="form-control" name="writer" id="writer" value="${sessionScope.member.email}"
				       readonly>
			</div>
			<div class="form-group">
				<label for="title">제목</label>
				<input type="text" class="form-control" name="title" id="title" placeholder="" required>
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<textarea class="form-control" name="content" id="content" rows="5" required></textarea>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>

	</div>


</div><!-- /.container -->


<%@include file="/view/partials/script.jsp" %>

</body>
</html>
