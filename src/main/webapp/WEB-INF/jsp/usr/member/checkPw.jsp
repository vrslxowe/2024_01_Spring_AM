<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Check Password"></c:set>
<link href='https://fonts.googleapis.com/css?family=Exo+2:400,100' rel='stylesheet' type='text/css'>
<!-- daisy ui 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/daisyui/4.6.1/full.css" />
<c:set var="loggedInMemberName" value="${rq.loginedMember.name}"></c:set>
<c:set var="loggedInMemberId" value="${rq.loginedMember.loginId}"></c:set>


<div class="top_bar top_bar_left">
	<a href="../home/TestMain">
		<button class="btn top_btn btn-ghost">💖</button>
	</a>
	<button class="btn top_btn btn-ghost" onclick="history.back();">뒤로가기</button>
</div>
<div class="top_bar top_bar_right">
	<a href="../home/TestSetting">
		<button class="btn top_btn btn-ghost">설정⚙</button>
	</a>
</div>
<form action="../member/doCheckPw" method="POST">
	<table class="login-box table-box-1" border="1">
		<tbody>
			<tr>
				<th>아이디</th>
				<td>${rq.loginedMember.loginId }</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input class="info2" autocomplete="off" type="text"
						placeholder="기존 비밀번호를 입력해주세요" name="loginPw" />
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<input class="modify_btn" type="submit" value="확인" />
				</td>
			</tr>
		</tbody>
	</table>
</form>
<div class="btns">
	<button class="modify_btn" type="button" onclick="history.back();">뒤로가기</button>
</div>

<style type="text/css">
body {
	color: #5e5e5e;
	overflow: hidden;
	font-family: "Exo 2", "S-CoreDream-3Light";
	font-weight: normal;
	margin: 0px;
	padding: 0px;
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	width: 100%;
	height: 100%;
	min-height: 100vh;
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-wrap: wrap;
	background-image:
		url("https://blog.kakaocdn.net/dn/R9biv/btsFioNqNuy/EOMko5QGySmhKmVFJKwYa0/img.jpg");
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}

.top_bar {
	height: 61.7px;
	padding: 0px;
	margin: 0px;
	position: fixed;
	top: 0px;
	text-align: center;
	font-family: "Exo 2";
	font-weight: normal;
	display: flex;
}

.top_bar_left {
	margin-right: 89%; /* 왼쪽 여백 설정 */
	justify-content: flex-start; /* 왼쪽 정렬 */
}

.top_bar_right {
	margin-left: 93%; /* 오른쪽 여백 설정 */
	justify-content: flex-end; /* 오른쪽 정렬 */
}

.top_btn {
	font-family: "S-CoreDream-3Light"; /* 글꼴 설정 */
	margin-top: 15.5px; /* 위쪽 여백 설정 */
	height: 30px; /* 높이 설정 */
	margin-right: 20px; /* 오른쪽 여백 설정 */
	display: inline-block; /* 인라인 블록 요소로 표시 */
	box-shadow: 7px 5px 7.1px 0px rgba(0, 0, 0, 0.25); /* 그림자 설정 */
}

.btn-ghost {
	font-family: "S-CoreDream-3Light";
	box-shadow: 7px 5px 7.1px 0px rgba(0, 0, 0, 0.25);
}

.box {
	font-size: 30px;
	width: 1334px;
	height: 780px;
	margin: 0px;
	padding-top: 35px;
	overflow: hidden;
	backdrop-filter: blur(0px);
	box-shadow: 5px 5px 30px rgba(0, 0, 0, 0.25);
	border-radius: 55px;
	text-align: center;
}

.profile {
	margin-top: 40px;
	margin-bottom: 65px;
}

.box2 {
	position: relative;
	top: -10px;
	background: #e2e2e2;
	margin-top: 40px;
	margin-left: 39.5%;
	width: 280px;
	height: 47px;
	opacity: 0.5;
	border-radius: 35px;
	display: block;
	padding-top: 5px;
	padding-left: 20px;
	font-size: 20px;
	box-shadow: 10px 5px 7px 5px rgba(0, 0, 0, 0.25) inset;
}

.box3 {
	position: relative;
	top: -10px;
	background: #e2e2e2;
	margin-top: 40px;
	margin-left: 45%;
	width: 130px;
	height: 47px;
	opacity: 0.5;
	border-radius: 35px;
	display: block;
	padding-top: 5px;
	padding-left: 20px;
	font-size: 20px;
	box-shadow: 7px 5px 7.1px 0px rgba(0, 0, 0, 0.25);
}

.box3:hover {
	box-shadow: 10px 5px 7px 5px rgba(0, 0, 0, 0.25) inset;
}

.info1 {
	position: relative;
	left: -85%;
}

.info2 {
	position: relative;
	top: -55%;
	left: -5%;
}

.info3 {
	position: relative;
	top: 10%;
	left: -200%;
}

.modify_btn {
	color: #5e5e5e;
	padding-top: 14px;
	margin-top: 20px;
	margin-left: 0%;
	font-size: 19px;
	border-radius: 15px;
}

@font-face {
	font-family: 'S-CoreDream-3Light';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
</style>


<%@ include file="../common/foot.jspf"%>