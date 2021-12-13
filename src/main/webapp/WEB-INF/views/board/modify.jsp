<%@page import="com.milk.myweb.vo.UserVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
.pull-right {
	float: right;
	margin: 15px;
}
</style>
</head>
<body>

	<!-- Responsive navbar-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="../index">Milk Forum</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" href="../index">Home</a></li>
					<c:choose>
						<c:when test="${empty loginInfo}">
							<li class="nav-item"><a class="nav-link" href="../loginForm">Login</a></li>
							<li class="nav-item"><a class="nav-link"
								href="../registerForm">Register</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link" href="../logout">Logout</a></li>
						</c:otherwise>
					</c:choose>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="list">Board</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- -->
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Main content -->
		<section class="content container-fluid">

			<form role="form" id="updateForm" method="post"
				action="${ path }/board/modify">

				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">게시글 수정</h3>
					</div>
					<div class="box-body">
						<input type="hidden" name="b_num" value="${ board.b_num }">
						<input type="hidden" name="page" value="${ searchCri.page }">
						<input type="hidden" name="perPageNum"
							value="${searchCri.perPageNum}"> <input type="hidden"
							name="searchType" value="${searchCri.searchType}"> <input
							type="hidden" name="keyword" value="${searchCri.keyword}">
						<div class="form-group">
							<label for="b_title">제목</label> <input class="form-control"
								id="b_title" name="b_title" value="${ board.b_title }">
						</div>
						<div class="form-group">
							<label for="b_content">내용</label>
							<textarea class="form-control" id="b_content" name="b_content"
								rows="30" style="resize: none;">${ board.b_content }</textarea>
						</div>
						<div class="form-group">
							<label for="b_writer">작성자</label> <input class="form-control"
								id="b_writer" name="b_writer" value="${ board.b_writer }"
								readonly="readonly">
						</div>
					</div>

					<div class="box-footer">
						<div class="pull-right">
							<button type="button" class="btn btn-primary listBtn">
								<i class="fa fa-list"></i>목록
							</button>
							<button type="button" class="btn btn-warning cancleBtn">
								<i class="fa fa-trash"></i>취소
							</button>
							<button type="submit" class="btn btn-success modBtn">
								<i class="fa fa-save"></i>저장
							</button>
						</div>
					</div>
				</div>
			</form>
		</section>
	</div>

	<!-- /.content -->
	<!-- /.content-wrapper -->

	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2021</p>
		</div>
	</footer>
	<%@ include file="../include/plugin_js.jsp"%>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script>
		$(document)
				.ready(
						function() {

							var formObj = $("form[role='form']");
							console.log(formObj);

							$(".modBtn").on("click", function() {

								formObj.submit();
							});

							$(".cancleBtn").on("click", function() {
								history.go(-1);
							});

							$(".listBtn")
									.on(
											"click",
											function() {
												self.location = "/board/list?page=${searchCri.page}"
														+ "&perPageNum=${searchCri.perPageNum}"
														+ "&searchType=${searchCri.searchType}"
														+ "&keyword=${searchCri.keyword}";
											});
						});
	</script>
</body>
</html>
