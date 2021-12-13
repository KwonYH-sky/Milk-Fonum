<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>로그인</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩3 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 커스텀 CSS -->
<style type="text/css">
body {
	width: 100%;
	margin: 0 auto;
}

.row {
	margin: 0;
}

.navbar-default {
	border: none;
	background-color: #FFFFFF;
}

#loginWrap {
	padding-top: 20px;
	margin: 0 auto;
	width: 50%;
	height: 220px;
	margin-top: 120px;
	margin-bottom: 220px;
}

#loginWrap .input-group {
	margin-bottom: 10px;
}

#loginWrap .btn {
	margin-bottom: 10px;
}

#naverLogin {
	color: #FFFFFF;
	background-color: #2DB400;
}

#loginOption a {
	color: #000000;
}

#sideAds {
	padding-left: 0;
}

.well {
	height: 200px;
}

.bar {
	margin: 0 4px;
}

/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	border-radius: 0;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 450px;
}

/* Set gray background color and 100% height */
.sidenav {
	padding-top: 20px;
	background-color: #FFFFFF;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
</style>
<!-- 로그인 유효성 검사 JS -->
<script type="text/javascript" src="resources/js/loginValidation.js"></script>
</head>

<body>
	<!-- 최상단 네비 -->
	<div class="container-fluid">
		<nav class="navbar navbar-default">
			<ul class="nav navbar-nav navbar-right">
				<li style="font-size: 16px"><a href="index">메인으로</a></li>
			</ul>
		</nav>
	</div>

	<div class="container-fluid text-center">
		<div id="loginWrap" class="row">

			<!-- 로그인 폼-->
			<!-- ajax로 form 제출시 action 경로 생략 -->
			<form id="login" method="post">
				<!-- 아이디 -->
				<div id="idInputGroup" class="input-group">
					<span class="input-group-addon"> <i
						class="glyphicon glyphicon-user"></i>
					</span> <input id="u_id" type="text" class="form-control" name="u_id"
						placeholder="4자리 이상 영문 아이디를 입력하세요">
				</div>
				<!-- 비밀번호 -->
				<div id="pwInputGroup" class="input-group">
					<span class="input-group-addon"> <i
						class="glyphicon glyphicon-lock"></i>
					</span> <input id="u_pwd" type="password" class="form-control"
						name="u_pwd" placeholder="8자리 이상 비밀번호를 입력하세요">
				</div>
				<button onclick="validateLogin();return false;"
					class="btn btn-primary btn-block">로그인</button>
			</form>

			<!-- 로그인 옵션 -->
			<div id="loginOption">
				<a href="#">아이디 찾기</a> <span class="bar">|</span> <a href="#">비밀번호
					찾기</a> <span class="bar">|</span> <a href="registerForm">회원가입</a>
			</div>

		</div>
	</div>

	<jsp:include page="include/footer.jsp" />
</body>

</html>