<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Test Profile"></c:set>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<div id="calendar"></div>
<link href='https://fonts.googleapis.com/css?family=Exo+2:400,100' rel='stylesheet' type='text/css'>
<!-- daisy ui 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/daisyui/4.6.1/full.css" />

<!doctype html>

<div class="top_bar left">
	<button class="btn top_btn btn-ghost" onclick="history.back();">뒤로가기</button>
</div>
<div class="top_bar right">
	<button class="btn top_btn btn-ghost">검색🔍</button>
	<a href="../home/TestSetting">
	<button class="btn top_btn btn-ghost">설정⚙</button></a>
</div>


<div class="box">
	내 정보
	<div class="profile">
		<button class="btn btn-ghost">프로필 사진📷</button>
	</div>
	<div class="box2"></div>
	<div class="box2"></div>
	<div class="box2"></div>
	<div class="box2"></div>
	<div class="box2"></div>
	<div class="box2"></div>
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

.left {
	margin-right: 95%;
	justify-content: flex-start;
}

.right {
	margin-left: 95%;
	justify-content: flex-end;
}

.box {
	font-size: 30px;
	width: 1334px;
	height: 862px;
	margin: 0px;
	padding-top: 35px;
	height: 650px;
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
	margin-top: 30px;
	margin-bottom: 50px;
}

.box2 {
	margin-top: 25px;
	margin-left: 41%;
	background-color: red;
	background: rgba(226, 226, 226, 1);
	width: 250px;
	height: 47px;
	opacity: 0.5;
	border-radius: 35px;
	background: #e2e2e2;
	display: block;
	padding-top: 5px;
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

.btn-ghost {
	font-family: "S-CoreDream-3Light";
	box-shadow: 7px 5px 7.1px 0px rgba(0, 0, 0, 0.25);
}
@font-face {
     font-family: 'S-CoreDream-3Light';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff');
     font-weight: normal;
     font-style: normal;
}
</style>