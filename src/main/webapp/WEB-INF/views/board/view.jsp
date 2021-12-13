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
<style type="text/css">
.container {
	margin: 10px 0 0 0;
}

a {
	text-decoration-line: none;
}

.pull-right {
	margin: 15px;
	float: right;
}

.comment {
	float: none;
	margin-top: 65px;
}

#boardInfo {
	border-bottom: 1px solid gray;
}
</style>
</head>
<body>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
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
	<div class="container">
		<h1>자유게시판</h1>
		<div class="row">
			<div class="panel-group">
				<div class="panel panel-default">
					<!-- 작성글 헤더(글 제목, 글 정보) -->
					<div class="panel-heading">
						<h3>${board.b_title}
							<c:if test="${board.b_reply_count > 0}">
										[${board.b_reply_count}]
									</c:if>
						</h3>
						<div id="boardInfo" class="text-right">
							번호 ${board.b_num} <span class="bar">|</span> ${board.b_writer} <span
								class="bar">|</span>
							<fmt:formatDate pattern="yyyy-MM-dd" value="${board.b_reg_date}" />
							<span class="bar">|</span> 조회 ${board.b_views} <span class="bar">|</span>
							추천 ${board.b_recommend}
						</div>
					</div>

					<!-- 작성글 바디(글 내용) -->
					<div class="panel-body">
						<p>${board.b_content}</p>
						<div class="well text-center">
							<form id="recommend"
								action="recommend?page=${searchCri.page}&perPageNum=${perPageNum}"
								method="post">
								<input type="hidden" name="b_num" value="${board.b_num}">
								<c:if test="${loginInfo != null}">
									<input id="u_id" type="hidden" name="u_id"
										value="${loginInfo.u_id}">
								</c:if>
								<button id="recommendSubmit" type="button"
									class="btn btn-primary">추천 ${board.b_recommend}</button>
							</form>
						</div>
						<div class="box-footer">
							<form role="form" method="post">
								<input type="hidden" name="b_num" value="${ board.b_num }" /> <input
									type="hidden" name="page" value="${searchCri.page}"> <input
									type="hidden" name="perPageNum" value="${searchCri.perPageNum}">
								<input type="hidden" name="searchType"
									value="${searchCri.searchType}"> <input type="hidden"
									name="keyword" value="${searchCri.keyword}">
							</form>
							<div class="pull-right">
								<button type="submit" class="btn btn-primary listBtn">
									<i class="fa fa-list"></i>목록
								</button>
								<c:if test="${loginInfo.u_id eq board.b_writer}">
									<button type="submit" class="btn btn-warning modBtn">
										<i class="fa fa-edit"></i>수정
									</button>
									<button type="submit" class="btn btn-danger delBtn">
										<i class="fa fa-trash"></i>삭제
									</button>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				<!-- 작성글 푸터(댓글) -->
				<div class="box box-warning comment">
					<div class="box-header with-border">
						<a class="link-black text-lg"><i
							class="fa fa-pencil margin-r-5"></i> 댓글 쓰기</a>
					</div>
					<div class="box-body">
						<c:if test="${not empty loginInfo}">
							<form>

								<div class="form-group">

									<textarea class="form-control" id="newRe_content" rows="3"
										placeholder="댓글의 내용을 입력해주세요." style="resize: none"></textarea>
								</div>

								<div class="col-sm-2" hidden>
									<input class="form-control" id="newRe_writer" type="text"
										value="${loginInfo.u_id}" readonly="readonly">
								</div>
								<button type="button" class="replyAddBtn btn btn-default ">
									<i class="fa fa-save"></i> 댓글 저장
								</button>
							</form>
						</c:if>
						<c:if test="${empty loginInfo}">
							<a href="${path}/loginForm" class="btn btn-default btn-block"
								role="button"> <i class="fa fa-edit"></i>로그인 한 사용자만 댓글 등록이
								가능합니다.
							</a>
						</c:if>
					</div>
				</div>
				<div class="box box-success collapsed-box">
					<%--댓글 유무 / 댓글 갯수 / 댓글 펼치기, 접기--%>
					<div class="box-header with-border">
						<a class="link-black text-lg"><i
							class="fa fa-comments-o margin-r-5 replyCount"></i> </a>
						<div class="box-tools">
							<button type="button" class="btn btn-box-tool"
								data-widget="collapse">
								<i class="fa fa-plus"></i>
							</button>
						</div>
					</div>
					<%--댓글 목록--%>
					<div class="box-body repliesDiv"></div>
					<%--댓글 페이징--%>
					<div class="box-footer">
						<div class="text-center">
							<ul class="pagination pagination-sm no-margin">

							</ul>
						</div>
					</div>
				</div>
				<%--댓글 수정 modal 영역--%>
				<div class="modal fade" id="modModal">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title">수정</h4>
							</div>
							<div class="modal-body" data-re_num>
								<input type="hidden" class="re_num" />
								<%--<input type="text" id="re_content" class="form-control"/>--%>
								<textarea class="form-control" id="re_content" rows="3"
									style="resize: none"></textarea>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default pull-left"
									data-dismiss="modal">닫기</button>
								<button type="button" class="btn btn-primary modalModBtn">수정</button>
							</div>
						</div>
					</div>
				</div>

				<%--댓글 삭제 modal 영역--%>
				<div class="modal fade" id="delModal">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title">댓글 삭제</h4>
								<input type="hidden" class="re_num" />
							</div>
							<div class="modal-body" data-re_num>
								<p>댓글을 삭제하시겠습니까?</p>
								<input type="hidden" class="re_num" />
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default pull-left"
									data-dismiss="modal">아니요.</button>
								<button type="button" class="btn btn-primary modalDelBtn">네.
									삭제합니다.</button>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
		<!-- panel footer end -->
	</div>
	<!-- 오른쪽 사이드 메뉴-->
	<div class="col-sm-3 sidenav"></div>

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
	<script id="replyTemplate" type="text/x-handlebars-template">
    {{#each.}}
    <div class="post replyDiv" data-re_num={{re_num}}>
        <div class="user-block">
            <%--댓글 작성자--%>
            <span class="username">
                <%--작성자 이름--%>
                <a href="#">{{re_writer}}</a>
				{{~#eqWriter re_writer}}
				<div class="btn-group pull-right">
                	<%--댓글 삭제 버튼--%>
                		<a data-target="#delModal" class="replyDelBtn btn-box-tool btn btn-primary" data-toggle="modal" >
                    		<i class="fa fa-times"> 삭제</i>
                		</a>
                	<%--댓글 수정 버튼--%>
				        <a data-target="#modModal" class="replyModBtn btn-box-tool btn btn-primary" data-toggle="modal" >
                    		<i class="fa fa-edit"> 수정</i>
                		</a>
				</div>
				{{~/eqWriter}}
            </span>
            <%--댓글 작성일자--%>
            <span class="description">{{prettifyDate re_reg_date}}</span>
        </div>
        <%--댓글 내용--%>
        <div class="oldre_content">{{escape re_content}}</div>
        <br/>
    </div>
    {{/each}}
</script>

	<script>
		$(document)
				.ready(
						function() {
							var b_num = "${board.b_num}"; // 현재 게시글 번호
							var re_writer = "${loginInfo.u_id}";
							var replyPageNum = 1; // 댓글 페이지 번호 초기화

							Handlebars.registerHelper("eqWriter", function(
									re_writer, block) {
								var accum = "";
								if (re_writer === "${loginInfo.u_id}") {
									accum += block.fn();
								}
								return accum;
							});

							Handlebars.registerHelper("escape", function(
									re_content) {
								var text = Handlebars.Utils
										.escapeExpression(re_content);
								text = text.replace(/(\r\n|\n\r)/gm, "<br />");
								text = text.replace(/()/gm, "&nbsp;");
								return new Handlebars.SafeString(text);
							});

							Handlebars.registerHelper("prettifyDate", function(
									timeValue) {
								var dateObj = new Date(timeValue);
								var year = dateObj.getFullYear();
								var month = dateObj.getMonth() + 1;
								var date = dateObj.getDate();
								var hours = dateObj.getHours();
								var minutes = dateObj.getMinutes();
								// 2자리 숫자로 변환
								month < 10 ? month = '0' + month : month;
								date < 10 ? date = '0' + date : date;
								hours < 10 ? hours = '0' + hours : hours;
								minutes < 10 ? minutes = '0' + minutes
										: minutes;

								return year + "-" + month + "-" + date + " "
										+ hours + ":" + minutes;
							});

							// 댓글 목록 함수 호출
							getReplies("/replies/" + b_num + "/" + replyPageNum);

							function getReplies(repliesUri) {

								$.getJSON(repliesUri, function(data) {
									printReplyCount(data.pageMaker.totalCount);
									printReplies(data.list, $(".repliesDiv"),
											$("#replyTemplate"));
									printReplyPaging(data.pageMaker,
											$(".pagination"));
								});
							}

							// 댓글 갯수 출력 함수
							function printReplyCount(totalCount) {

								var replyCount = $(".replyCount");
								var collapsedBox = $(".collapsed-box");

								// 댓글이 없으면
								if (totalCount === 0) {
									replyCount.html("첫 댓글을 남겨주세요!");
									collapsedBox.find(".btn-box-tool").remove();
									return;
								}

								// 댓글이 있으면
								replyCount.html("댓글 목록 (" + totalCount + ")");
								collapsedBox.find(".box-tools").html(
										"<button type = 'button' class='btn btn-box-tool' data-widget='collapse'>"
												+ "<i class='fa fa-plus'></i>"
												+ "</button>");
							}

							// 댓글 목록 출력
							function printReplies(replyArr, targetArea,
									templateObj) {
								var replyTemplate = Handlebars
										.compile(templateObj.html());
								var html = replyTemplate(replyArr);
								$(".replyDiv").remove();
								targetArea.html(html);
							}
							// 댓글 페이징 출력
							function printReplyPaging(pageMaker, targetArea) {

								var str = "";

								if (pageMaker.prev) {
									str += "<li class=page-item ><a class=page-link href='"
											+ (pageMaker.startPage - 1)
											+ "'>이전</a></li>";
								}
								for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
									var strClass = pageMaker.cri.page == i ? "class=active aria-current=page"
											: "";
									str += "<li class=page-item " +strClass + "><a class=page-link href='" + i + "'>"
											+ i + "</a></li>";
								}
								if (pageMaker.next) {
									str += "<li class=page-item><a class=page-link href='"
											+ (pageMaker.endPage + 1)
											+ "'>다음</a></li>";
								}
								targetArea.html(str);
							}

							// 댓글 페이지 번호 클릭 이벤트
							$(".pagination").on(
									"click",
									"li a",
									function(event) {
										event.preventDefault();
										replyPageNum = $(this).attr("href");
										getReplies("/replies/" + b_num + "/"
												+ replyPageNum);
									});
							// 댓글 저장 버튼 클릭 이벤트
							$(".replyAddBtn")
									.on(
											"click",
											function() {
												// 입력 form 선택자
												var re_writerObj = $("#newRe_writer");
												var re_contentObj = $("#newRe_content");
												var re_writer = re_writerObj
														.val();
												var re_content = re_contentObj
														.val();
												// 댓글 입력처리 수행
												$
														.ajax({
															type : 'post',
															url : '/replies/',
															headers : {
																"Content-Type" : "application/json",
																"X-HTTP-Method-Override" : "POST"
															},
															dataType : 'text',
															data : JSON
																	.stringify({
																		b_num : b_num,
																		re_writer : re_writer,
																		re_content : re_content
																	}),
															success : function(
																	result) {
																console
																		.log("result : "
																				+ result);
																if (result === 'success') {
																	alert("댓글이 등록되었습니다.");
																	replyPageNum = 1; // 페이지 1로 초기화
																	getReplies("/replies/"
																			+ b_num
																			+ "/"
																			+ replyPageNum); // 댓글 목록 호출
																	re_contentObj
																			.val(""); // 댓글 입력창 공백처리
																}
															}
														});
											});

							// 댓글 수정을 위해 modal창에 선택한 댓글의 값들을 세팅
							$(".repliesDiv").on(
									"click",
									".replyDiv",
									function(event) {

										var reply = $(this);

										console.log("reply re_num  ", reply);

										$(".re_num").val(
												reply.attr("data-re_num"));

										$("#re_content").val(
												reply.find(".oldre_content")
														.text());
									});

							// modal 창의 댓글 수정버튼 클릭 이벤트
							$(".modalModBtn")
									.on(
											"click",
											function() {

												var re_num = $(".re_num").val();
												//var re_num = 333;

												console.log("re_num", re_num)

												console
														.log("======================================")

												var re_content = $(
														"#re_content").val();
												$
														.ajax({
															type : "put",
															url : "/replies/"
																	+ re_num,
															headers : {
																"Content-Type" : "application/json",
																"X-HTTP-Method-Override" : "PUT"
															},
															dataType : "text",
															data : JSON
																	.stringify({
																		re_content : re_content
																	}),
															success : function(
																	result) {
																console
																		.log("result : "
																				+ result);
																if (result === "success") {
																	alert("댓글이 수정되었습니다.");
																	getReplies("/replies/"
																			+ b_num
																			+ "/"
																			+ replyPageNum); // 댓글 목록 호출
																	$(
																			"#modModal")
																			.modal(
																					"hide"); // modal 창 닫기
																}
															}
														})
											});
							// modal 창의 댓글 삭제버튼 클릭 이벤트
							$(".modalDelBtn")
									.on(
											"click",
											function() {
												var re_num = $(".re_num").val();
												$
														.ajax({
															type : "delete",
															url : "/replies/"
																	+ re_num,
															headers : {
																"Content-Type" : "application/json",
																"X-HTTP-Method-Override" : "DELETE"
															},
															dataType : "text",
															success : function(
																	result) {
																console
																		.log("result : "
																				+ result);
																if (result === "success") {
																	alert("댓글이 삭제되었습니다.");
																	getReplies("/replies/"
																			+ b_num
																			+ "/"
																			+ replyPageNum); // 댓글 목록 호출
																	$(
																			"#delModal")
																			.modal(
																					"hide"); // modal 창 닫기
																}
															}
														});
											});

							var formObj = $("form[role='form']");
							console.log(formObj);

							$(".modBtn").on("click", function() {
								formObj.attr("action", "/board/modify");
								formObj.attr("method", "get");
								formObj.submit();
							});

							$(".delBtn")
									.on(
											"click",
											function() {
												var con_test = confirm("정말로 삭제하시겠습니까?");
												var count = "${count}";
												if (con_test == true) {
													if (count > 0) {
														alert("댓글이 있는 게시물은 삭제할 수 없습니다.")
														return;
													} else {
														formObj
																.attr("action",
																		"/board/delete");
														formObj.submit();
													}
												}

											});

							/* $(".listBtn").on("click", function() {
								self.location = "/board/list";
							}); */

							$(".listBtn").on("click", function() {

								formObj.attr("method", "get");
								formObj.attr("action", "/board/list");
								formObj.submit();
							});
						});
	</script>
</body>
</html>
