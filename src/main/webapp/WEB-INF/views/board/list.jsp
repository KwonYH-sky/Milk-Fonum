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
<title>게시판 목록</title>
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
a {
	text-decoration-line: none;
}

.btn-right {
	float: right
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
	<!-- Page header with logo and tagline-->
	<header class="py-3 bg-light border-bottom mb-4">
		<div class="container">
			<div class="text-center my-1">
				<h1 class="fw-bolder">Board!</h1>
				<p class="lead mb-0">General Forum for Your story</p>
			</div>
		</div>
	</header>
	<!-- Page content-->
	<div class="container">
		<div class="row">
			<!-- Blog entries-->
			<div class="col-lg-8">
				<!-- 게시판 -->
				<div class="content-wrapper">
					<!-- Content Header (Page header) -->
					<!-- Main content -->
					<section class="content container-fluid">
						<div class="col-lg-12">
							<div class="box box-primary">
								<div class="box-header with-border">
									<h3 class="box-b_title">게시글 목록</h3>
									<div class="pull-right">
										<c:choose>
											<c:when test="${not empty loginInfo}">
												<button type="button"
													class="btn btn-success btn-flat btn-right" id="writeBtn"
													onclick="location.href='write'">
													<i class="fa fa-pencil"></i>글쓰기
												</button>
											</c:when>
										</c:choose>
									</div>
								</div>
								<div class="box-body">
									<table class="table">
										<tbody>
											<tr>
												<th style="width: 30px">#</th>
												<th>제목</th>
												<th style="width: 100px">작성자</th>
												<th style="width: 150px">작성시간</th>
												<th style="width: 60px">조회</th>
												<th style="width: 60px">추천</th>
											</tr>
											<c:forEach items="${boards}" var="board">
												<tr>
													<td>${board.b_num}</td>
													<td><a href="${path}/board/view?b_num=${board.b_num}">${board.b_title}</a></td>
													<td>${board.b_writer}</td>
													<td><fmt:formatDate value="${board.b_reg_date}"
															pattern="yyyy-MM-dd a HH:mm" /></td>
													<td><span class="bg-red">${board.b_views}</span></td>
													<td><span class="bg-red">${board.b_recommend}</span></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>

							</div>
						</div>
					</section>
					<!-- /.content -->
				</div>
				<!-- /.content-wrapper -->

				<!-- Pagination-->
				<nav aria-label="Pagination">
					<hr class="my-0" />
					<div class="box-footer">
						<div class="text-center">
							<ul class="pagination justify-content-center my-4">
								<c:if test="${pageMaker.prev}">
									<li class="page-item"><a class="page-link"
										href="${path}/board/list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
								</c:if>
								<c:forEach begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}" var="idx">
									<li
										<c:out value="${pageMaker.cri.page == idx ? 'class=page-item active' : 'class=page-item'}"/>>
										<a class="page-link"
										href="${path}/board/list${pageMaker.makeSearch(idx)}">${idx}</a>
									</li>
								</c:forEach>
								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li class="page-item"><a class="page-link"
										href="${path}/board/list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
								</c:if>
							</ul>
						</div>
					</div>
				</nav>
			</div>
			<!-- Side widgets-->
			<div class="col-lg-4">
				<!-- Search widget-->
				<div class="card mb-4">
					<div class="card-header">Search</div>
					<div class="card-body">
						<div class="input-group">
							<input class="form-control" type="text"
								placeholder="Enter search term..."
								aria-label="Enter search term..."
								aria-describedby="button-search" />
							<button class="btn btn-primary" id="button-search" type="button">Go!</button>
						</div>
					</div>
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
	<%@ include file="../include/plugin_js.jsp"%>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
</body>
</html>
