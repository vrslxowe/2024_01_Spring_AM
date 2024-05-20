<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Test Profile"></c:set>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<div id="calendar"></div>
<link href='https://fonts.googleapis.com/css?family=Exo+2:400,100' rel='stylesheet' type='text/css'>
<!-- daisy ui 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/daisyui/4.6.1/full.css" />
<c:set var="loggedInMemberName" value="${rq.loginedMember.name}"></c:set>
<c:set var="loggedInMemberId" value="${rq.loginedMember.loginId}"></c:set>

<!doctype html>

<div class="top_bar top_bar_left">
	<a href="../home/TestMain">
		<button class="btn top_btn btn-ghost">💖</button>
	</a>
	<button class="btn top_btn btn-ghost" onclick="history.back();">뒤로가기</button>
</div>
<div class="top_bar top_bar_right">
<c:if test="${rq.isLogined() }">
<button class="">${loggedInMemberName}님</button>
</c:if>
	<a href="../home/TestSetting">
	<button class="btn top_btn btn-ghost">설정⚙</button></a>
</div>


<div class="box">
	내 정보
	<div class="profile">
		<button class="btn btn-ghost">프로필 사진📷</button>
	</div>
	<input class="box2" type="text" autocomplete="off" placeholder="아이디">
	<input class="box2" type="text" autocomplete="off" placeholder="별명">
	<input class="box2" type="text" autocomplete="off" placeholder="이름">
	<input class="box2" type="text" autocomplete="off" placeholder="생년월일">
	<input class="box2" type="text" autocomplete="off" placeholder="전화번호">
	<input class="box2" type="text" autocomplete="off" placeholder="이메일">
	<div class="modify_btn">
		<button class="btn btn-ghost">정보 수정</button>
	</div>
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
	border-top-left-radius: 55px;
	border-top-right-radius: 55px;
	border-bottom-left-radius: 55px;
	border-bottom-right-radius: 55px;
	text-align: center;
}

.profile {
	margin-top: 55px;
	margin-bottom: 65px;
}

.box2 {
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

.modify_btn {
	color: #5e5e5e;
	padding-top: 14px;
	margin-top: -45px;
	margin-left: 85%;
	font-size: 19px;
	border-radius: 15px;
}

@font-face {
     font-family: 'S-CoreDream-3Light';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff');
     font-weight: normal;
     font-style: normal;
}


</style>