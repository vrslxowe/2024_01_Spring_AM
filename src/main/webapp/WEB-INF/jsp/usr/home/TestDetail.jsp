<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Test Detail"></c:set>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<div id="calendar"></div>
<link href='https://fonts.googleapis.com/css?family=Exo+2:400,100' rel='stylesheet' type='text/css'>
<!-- daisy ui 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/daisyui/4.6.1/full.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<c:set var="loggedInMemberName" value="${rq.loginedMember.name}"></c:set>
<c:set var="loggedInMemberId" value="${rq.loginedMember.loginId}"></c:set>

<!doctype html>

<div class="top_bar left">
	<span class="material-symbols-outlined back_btn" onclick="history.back();">arrow_back_ios</span>
	<a href="../home/TestMain">
		<span class="material-symbols-outlined main_btn">home</span>
	</a>
</div>
<div class="top_bar right">
	<a href="../home/TestWrite">
		<span class="material-symbols-outlined modify_btn">edit</span>
	</a>
</div>

<div class="box box_1"></div>
<div class="box box_2">${article.body }</div>

<div class="box_1">
	<div class="diary_text">제목 ${article.title }</div>
	<div class="date_text">날짜</div>
</div>

<div class="box_1">
	<div class="address_text">주소</div>
</div>

<div class="box_1">
	<div class="box_4">
		<button class="btn btn-circle">날씨</button>
		<button class="btn btn-circle">감정</button>
		<button class="btn btn-circle">음악</button>
	</div>
</div>

<style type="text/css">

/* 기본 스타일 */
body {
	overflow: hidden;
	font-family: "Exo 2", "S-CoreDream-3Light";
	font-weight: normal;
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;
	min-height: 100vh;
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
	background-image:
		url("https://blog.kakaocdn.net/dn/bf1nPW/btsFfVyY4fm/lkEFWm3oKHBj7TkLa8DaH0/img.jpg");
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}

/* 상단 바 */
.top_bar {
	height: 61.7px;
	padding: 0;
	margin: 0;
	position: fixed;
	top: 0;
	text-align: center;
	font-family: "Exo 2";
	font-weight: normal;
	display: flex;
}

.btn-ghost {
	font-family: "S-CoreDream-3Light";
	box-shadow: 7px 5px 7.1px 0px rgba(0, 0, 0, 0.25);
}

.left {
	right: 97%; /* 왼쪽 여백 설정 */
	justify-content: flex-start; /* 왼쪽 정렬 */
}

.material-symbols-outlined {
	font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
	font-size: 27px;
}

.back_btn{
	position: absolute;
	top: 23px;
	left: -20px;
}
.main_btn {
	position: absolute;
	top: 23px;
	left: 25px;
}

.right {
	left: 88%; /* 오른쪽 여백 설정 */
	justify-content: flex-end; /* 오른쪽 정렬 */
}

.modify_btn {
	position: absolute;
	top: 23px;
	left: 160px;
}


/* 박스 스타일 */
.box {
	margin-top: -110px;
	opacity: 0.5;
	border-radius: 65px;
	background: #e2e2e2;
	box-shadow: 5px 5px 30px 3px rgba(0, 0, 0, 0.25);
	position: fixed;
}

.box_1 {
	width: 1195px;
	height: 830px;
	position: fixed;
	left: 362px;
	top: 156px;
	display: flex;
	justify-content: space-between;
}

.box_2 {
	width: 1050px;
	height: 544px;
	position: fixed;
	left: 424px;
	top: 418px;
	box-shadow: 10px 5px 7px 5px rgba(0, 0, 0, 0.25) inset;
}

/* 텍스트 스타일 */
.diary_text, .address_text, .date_text, .dday_text {
	opacity: 0.5;
	height: 0;
	margin-left: 100px;
	background: #e2e2e2;
}

.diary_text, .date_text, .dday_text {
	margin-top: 95px;
	width: 450px;
}

.diary_text {
	margin-right: 0;
}

.address_text {
	margin-top: 25px;
	width: 329px;
}

.dday_text {
	margin-right: -350px;
	font-weight: bold;
}

.date_text {
	margin-right: 80px;
}

/* 버튼 스타일 */
.btn-circle {
	opacity: 0.6;
	box-shadow: 10px 5px 7px 5px rgba(0, 0, 0, 0.25);
}

.box_4 button {
	margin-right: 10px;
}

.box_4 {
	width: 430px;
	height: 0;
	margin-top: -25px;
	margin-left: 580px;
	display: flex;
	justify-content: space-between;
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