<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>login page</title>

<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">

<!-- Bootstrap core CSS -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media (min-width: 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
body {
  height: 100%;
}
body {
  display: flex;
  align-items: center;
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #f5f5f5;
}

.form-signin {
  width: 100%;
  max-width: 330px;
  padding: 15px;
  margin: auto;
}

.form-signin .checkbox {
  font-weight: 400;
}

.form-signin .form-floating:focus-within {
  z-index: 2;
}

.form-signin input[type="text"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
</style>


<!-- Custom styles for this template -->

</head>
<body class="text-center">

	<main class="form-signin">
		<form role="form" method="post" action="/login">
			<!-- 나중에 수정 -->
			<!-- 로고 -->
			<a href="/main">
				<h1>로고임 ㅋ</h1>
			</a>
			<h1 class="h3 mb-3 fw-normal">Please sign in</h1>
		
			<div class="form-floating">
				<input type="text" class="form-control" id="floatingInput" placeholder="User ID" name="username">
				<label for="floatingInput">User ID</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password">
				<label for="floatingPassword">Password</label>
			</div>
			
			<div class="checkbox mb-3">
				<label>
					<input type="checkbox" name="remember-me"> Remember me
				</label>
			</div>
			<button class="w-100 btn btn-lg btn-primary" type="submit">Sign In</button>
			<p class="mt-5 mb-3 text-muted">&copy; 2017–2021</p>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		</form>
	</main>

	<!-- <script>
		$(".btn-primary").on("click",
		function(e){
			e.preventDefault();
			$("form").submit();
		});
	</script>
	<c:if test="${param.logout != null}">
		<script>
			$(document).ready(function(){
				alert("로그아웃 하였습니다.");
			});
		</script>
	</c:if> -->

</body>
</html>
