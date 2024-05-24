<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Test Login"></c:set>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<div id="calendar"></div>
<link href='https://fonts.googleapis.com/css?family=Exo+2:400,100' rel='stylesheet' type='text/css'>
<!-- daisy ui 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/daisyui/4.6.1/full.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

<!doctype html>

  <div class="top_bar">
    <span class="material-symbols-outlined back_btn" onclick="history.back();">arrow_back_ios</span>
	<a href="../home/TestMain">
		<span class="material-symbols-outlined main_btn">home</span>
	</a>
  </div>

<div class="login">
<form action="../member/doLogin" method="POST">로그인
<input type="hidden" name="afterLoginUri" value="${param.afterLoginUri }"/>
	<div>
		<input class="box2" type="text" autocomplete="off" placeholder="아이디"  name="loginId">
		<input class="box2" type="password" autocomplete="off" placeholder="비밀번호" name="loginPw">
	</div>
  <input class="btn btn-ghost login_btn" type="submit" value="로그인" />
  </form>
  
  <a href="../home/TestJoin" class="join_btn">회원가입</a>
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
  background-image: url("https://blog.kakaocdn.net/dn/R9biv/btsFioNqNuy/EOMko5QGySmhKmVFJKwYa0/img.jpg");
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

.material-symbols-outlined {
	font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
	font-size: 27px;
}

.back_btn{
	position: absolute;
	top: 23px;
	left: 15px;
}
.main_btn {
	position: absolute;
	top: 23px;
	left: 55px;
}

.top_btn {
  font-family: "S-CoreDream-3Light";
  margin-top: 15.5px;
  height: 30px;
  margin-right: 20px;
}

.btn-ghost {
	font-family: "S-CoreDream-3Light";
	box-shadow: 7px 5px 7.1px 0px rgba(0, 0, 0, 0.25);
}

.login {
  text-align: center;
  font-size: 25px;
}

.login_btn {
	width: 92px;
	margin-top: 13%;
	margin-left: 0%;
}

.join_btn {
position: relative;
	top: -53px;
	left: 36%;
	font-size: 16px;
}

.join_btn:hover {
    text-decoration: underline;
  }

.box2 {
  margin-top: 45px;
  margin-left: 0;
  padding-left: 20px;
  background: rgba(226, 226, 226, 1);
  width: 350px;
  height: 47px;
  opacity: 0.5;
  display: block;
  border-radius: 35px;
  padding-top: 5px;
  font-size: 20px;
  box-shadow: 10px 5px 7px 5px rgba(0, 0, 0, 0.25) inset;
}


@font-face {
     font-family: 'S-CoreDream-3Light';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff');
     font-weight: normal;
     font-style: normal;
}
</style>