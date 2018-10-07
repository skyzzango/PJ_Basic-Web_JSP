<%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-10-07
  Time: 오후 4:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">
<head>
	<%@include file="/view/partials/head.jsp" %>
	<title>회원 - 정보수정</title>
</head>

<body>

<%@include file="/view/partials/nav.jsp" %>


<div class="container">

	<div class="starter-template">

		<div class="card" style="width: 20rem;text-align: center;margin: auto">
			<img class="card-img-top" src="<c:url value="/view/images/logo.svg"/>"
			     style="width: auto;padding-top: 1.25rem" alt="Card image cap">
			<div class="card-body">
				<h4 class="card-title">Welcome back<br>to TryCatch</h4>
				<form action="update_Action.jsp" method="post">
					<div class="form-group">
						<label for="email"></label>
						<input type="email" class="form-control" name="email" id="email"
						       value="${sessionScope.member.email}" readonly>
					</div>
					<div class="row" style="margin: 0.5rem;"></div>
					<div class="form-group">
						<input type="password" class="form-control" name="password" id="password" placeholder="비밀번호"
						       value="" required>
					</div>
					<div class="form-group">
						<input type="password" class="form-control" name="password_re" id="password_re"
						       placeholder="비밀번호 확인"
						       value="" required>
					</div>
					<div class="row" style="margin: 0.5rem;"></div>
					<div class="form-group">
						<label for="name"></label>
						<input type="text" class="form-control" name="name" id="name"
						       value="${sessionScope.member.name}" required>
					</div>
					<button type="submit" class="btn btn-info" style="width: 90%; margin: 0.5rem; padding: 0.6rem">
						정보수정
					</button>
				</form>
				<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">탈퇴</button>
			</div>
		</div>

	</div>

</div><!-- /.container -->

<!-- The Modal -->
<div class="modal fade" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">회원 탈퇴</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<form action="delete_Action.jsp" method="post">
				<div class="modal-body">
					정말 탈퇴 하시겠습니까?<br>
					탈퇴 하시려면 비밀번호 입력 후 삭제 버튼을 눌러주세요.
					<div class="form-group">
						<input type="password" class="form-control" name="password" placeholder="비밀번호">
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="submit" class="btn btn-danger">삭제</button>
					<button type="button" class="btn btn-info" data-dismiss="modal">취소</button>
				</div>
			</form>

		</div>
	</div>
</div><!-- /.Modal -->

<%@include file="/view/partials/script.jsp" %>

</body>
</html>