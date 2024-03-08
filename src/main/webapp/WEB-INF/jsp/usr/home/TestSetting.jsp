<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Test Setting"></c:set>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<div id="calendar"></div>
<link href='https://fonts.googleapis.com/css?family=Exo+2:400,100' rel='stylesheet' type='text/css'>
<!-- daisy ui 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/daisyui/4.6.1/full.css" />

<!doctype html>

<div class="top_bar">
	<button class="btn top_btn btn-ghost" onclick="history.back();">뒤로가기</button>
	<a href="../home/TestMain">
		<button class="btn top_btn btn-ghost">💖</button>
	</a>
</div>

<div class="member_join">
	설정
	<div class="btn-group">
		<button class="btn btn-ghost">글꼴 설정</button>
		<button class="btn btn-ghost">시작요일 변경</button>
		<button class="btn btn-ghost">기록 백업</button>
		<button class="btn btn-ghost">기록 복구</button>
		<button class="btn btn-ghost">문의하기</button>
	</div>
</div>


<style type="text/css">
body {
	color: #5e5e5e;
	overflow: hidden;
	font-family: "Exo 2", "S-CoreDream-3Light";
	font-weight: normal;
	margin: 0;
	padding: 0;
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
	width: 100%;
	padding: 0;
	margin: 0;
	position: absolute;
	top: 0;
	text-align: center;
	font-family: "Exo 2";
	font-weight: normal;
	display: flex;
	margin-left: 20px;
}

.top_btn, .btn-ghost {
	box-shadow: 7px 5px 7.1px 0px rgba(0, 0, 0, 0.25);
	font-family: "S-CoreDream-3Light";
	margin-top: 15.5px;
	height: 30px;
	margin-right: 20px;
}

.member_join {
	text-align: center;
	font-size: 25px;
	margin-bottom: 150px;
}

.btn-group {
  width: 100%;
  display: flex;
  margin-left: 7%;
  flex-direction: column;
  gap: 30px;
  margin-top: 50px;
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