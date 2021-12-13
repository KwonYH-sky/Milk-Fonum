<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 커스텀 header CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/header.css">
<!-- 최상단 네비 -->
<div class="container-fluid">
	<nav class="navbar navbar-default">
		<ul class="nav navbar-nav navbar-right">
			<!-- 회원가입 및 로그인 버튼 -->
			<c:choose>
				<c:when test="${loginInfo == null}">
					<li>
						<a href="registerForm">회원가입</a>
					</li>
					<li>
						<a href="loginForm">로그인</a>
					</li>
				</c:when>
				<c:otherwise>
					<li>
						<a>${loginInfo.u_id} 님</a>
					</li>
					<li>
						<a href="logout">로그아웃</a>
					</li>
				</c:otherwise>
			</c:choose>
		</ul>
	</nav>
	<nav id="searchNav" class="col-sm-9 navbar navbar-default">
		<ul class="nav navbar-nav navbar-right">
			<li>
				<form id="search" action="search" method="post" class="navbar-form">
					<div class="form-group">
						<select class="form-control" id="search_condition" name="search_condition">
							<option value="all">전체</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="writer">글쓴이</option>
							<option value="titleAndContent">제목+내용</option>
						</select>
					</div>
					<div class="form-group">
						<input id="search_content" name="search_content" type="text" class="form-control" placeholder="통합검색">
					</div>
					<button id="searchSubmit" type="button" class="btn btn-primary">검색</button>
				</form>
			</li>
		</ul>
	</nav>
</div>