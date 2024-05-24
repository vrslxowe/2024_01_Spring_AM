<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Check Password"></c:set>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<div id="calendar"></div>
<link href='https://fonts.googleapis.com/css?family=Exo+2:400,100' rel='stylesheet' type='text/css'>
<!-- daisy ui 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/daisyui/4.6.1/full.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />


<div class="top_bar top_bar_left">
	<span class="material-symbols-outlined back_btn" onclick="history.back();">arrow_back_ios</span>
	<a href="../home/TestMain">
		<span class="material-symbols-outlined main_btn">home</span>
	</a>
</div>
<div class="top_bar top_bar_right">
	<a href="../home/TestSetting">
		<span class="material-symbols-outlined set_btn">settings</span>
	</a>
</div>
<form action="../member/doCheckPw" method="POST">
	<div class="box2">
		<div class="info1">아이디</div>
		<div class="info2">${rq.loginedMember.loginId }</div>
		<div class="info1">비밀번호</div>
		<input class="info2" autocomplete="off" type="text" placeholder="기존 비밀번호를 입력해주세요" name="loginPw" />
		<input class="btn btn-ghost login_btn" type="submit" value="확인" />
	</div>
</form>

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
	right: 97%; /* 왼쪽 여백 설정 */
	justify-content: flex-start; /* 왼쪽 정렬 */
}

.material-symbols-outlined {
	font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
	font-size: 27px;
}

.back_btn {
	position: absolute;
	top: 23px;
	left: -20px;
}

.main_btn {
	position: absolute;
	top: 23px;
	left: 25px;
}

.set_btn {
	position: absolute;
	top: 23px;
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
	margin-top: 15.5px;
	height: 30px;
	margin-right: 20px;
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

.login_btn {
	width: 92px;
	margin-top: 13%;
	margin-left: 0%;
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