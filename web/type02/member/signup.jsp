<%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-10-07
  Time: 오후 12:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">
<head>
	<%@include file="/view/partials/head.jsp" %>
	<title>회원 - 회원가입</title>
</head>

<body style="background-color: #eee;">

<%@include file="/view/partials/nav.jsp" %>


<div class="container">

	<div class="starter-template">

		<div class="card" style="width: 20rem;text-align: center;margin: auto">
			<img class="card-img-top" src="<c:url value="/view/images/logo.svg"/>"
			     style="width: auto;padding-top: 1.25rem" alt="Card image cap">
			<div class="card-body">
				<h4 class="card-title">Welcome back<br>to TryCatch</h4>
				<form action="signup_Action.jsp" method="post">
					<div class="form-group">
						<label for="email"></label>
						<input type="email" class="form-control" name="email" id="email" placeholder="email@example.com"
						       value="" required>
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
						<input type="text" class="form-control" name="name" id="name" placeholder="이름"
						       value="" required>
					</div>
					<button type="submit" class="btn btn-primary" style="width: 90%; margin: 0.5rem; padding: 0.6rem">
						회원가입
					</button>
				</form>
				<div class="row">
					<div class="col-md-5">
						<hr>
					</div>
					<div class="col-md-2">
						or
					</div>
					<div class="col-md-5">
						<hr>
					</div>
				</div>
				<form action="#" method="post">
					<input type="hidden" name="next" value="/login/">
					<button class="btn-google-signup btn-google-signup-login" type="submit"
					        style="margin: 0.5rem;border: none;background: #FFF;display: block">
						<img src="<c:url value="/view/images/google-signin-button-dark.png"/>"
						     style="max-width: 80%;vertical-align: middle">
					</button>
				</form>
			</div>
		</div>
		<div class="row" style="margin: 0.5rem;"></div>
		<div class="row">
			<div style="text-align: center;margin: auto">
				이미 계정이 있으신가요?
				<a href="login.jsp">로그인</a>
			</div>
		</div>

	</div>

</div><!-- /.container -->


<%@include file="/view/partials/script.jsp" %>

</body>
</html>