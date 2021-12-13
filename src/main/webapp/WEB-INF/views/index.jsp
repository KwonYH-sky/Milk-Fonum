<%@page import="com.milk.myweb.vo.UserVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
request.setCharacterEncoding("UTF-8");
session = request.getSession(true);
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>안녕하세요.</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="/resources/assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style type="text/css">
a {
	text-decoration-line: none;
}

</style>
</head>
<body>

	<!-- Responsive navbar-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="index">Milk Forum</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active" href="#">Home</a></li>
					<c:choose>
						<c:when test="${empty loginInfo}">
							<li class="nav-item"><a class="nav-link" href="loginForm">Login</a></li>
							<li class="nav-item"><a class="nav-link" href="registerForm">Register</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
						</c:otherwise>
					</c:choose>
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="board/list">Board</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Page header with logo and tagline-->
	<header class="py-5 bg-light border-bottom mb-4">
		<div class="container">
			<div class="text-center my-5">
				<h1 class="fw-bolder">Welcome to Forum!</h1>
				<p class="lead mb-0">커뮤니티 사이트 입니다.</p>
			</div>
		</div>
	</header>
	<!-- Page content-->
	<div class="container">
		<div class="row">
			<!-- Blog entries-->
			<div class="col-lg-8">
				<!-- Featured blog post-->
				<div class="card mb-4">
					<div class="card-body">
						<div class="small text-muted"></div>
						<h2 class="card-title">게시판</h2>
						<p class="card-text">자유롭게 이용 가능한 자유게시판 입니다.!</p>
						<a class="btn btn-primary" href="board/list">Go to Board →</a>
					</div>
				</div>
				<!-- Nested row for non-featured blog posts-->
				<div class="row">
					<div class="col-lg-6">
						<!-- Blog post-->
						<div class="card mb-4">
							<div class="card-body">

								<h2 class="card-title h4">베스트</h2>
								<p class="card-text">Lorem ipsum dolor sit amet, consectetur
									adipisicing elit. Reiciendis aliquid atque, nulla.</p>
								<a class="btn btn-primary" href="#!">Read more →</a>
							</div>
						</div>
						<!-- Blog post-->
						<div class="card mb-4">
							<div class="card-body">

								<h2 class="card-title h4">반려동물</h2>
								<p class="card-text">Lorem ipsum dolor sit amet, consectetur
									adipisicing elit. Reiciendis aliquid atque, nulla.</p>
								<a class="btn btn-primary" href="#!">Read more →</a>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<!-- Blog post-->
						<div class="card mb-4">
							<div class="card-body">

								<h2 class="card-title h4">음식/요리</h2>
								<p class="card-text">Lorem ipsum dolor sit amet, consectetur
									adipisicing elit. Reiciendis aliquid atque, nulla.</p>
								<a class="btn btn-primary" href="#!">Read more →</a>
							</div>
						</div>
						<!-- Blog post-->
						<div class="card mb-4">
							<div class="card-body">
								<h2 class="card-title h4">취미/흥미</h2>
								<p class="card-text">Lorem ipsum dolor sit amet, consectetur
									adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex
									quis soluta, a laboriosam.</p>
								<a class="btn btn-primary" href="#!">Read more →</a>
							</div>
						</div>
					</div>
				</div>

			</div>
			<!-- Side widgets-->
			<div class="col-lg-4">
				<!-- Categories widget-->
				<div class="card mb-4">
					<div class="card-header">Using Tool/Skill</div>
					<div class="card-body">
						<div class="row">
							<div class="col-sm-6">
								<ul class="list-unstyled mb-0">
									<li><a href="#!">Java</a></li>
									<li><a href="#!">Spring</a></li>
									<li><a href="#!">MyBatis</a></li>
								</ul>
							</div>
							<div class="col-sm-6">
								<ul class="list-unstyled mb-0">
									<li><a href="#!">JavaScript</a></li>
									<li><a href="#!">Bootstrap</a></li>
									<li><a href="#!">MySQL</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- Side widget-->
				<div class="card mb-4">
					<div class="card-header">Side Widget</div>
					<div class="card-body">You can put anything you want inside
						of these side widgets. They are easy to use, and feature the
						Bootstrap 5 card component!</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2021</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
</body>
</html>
