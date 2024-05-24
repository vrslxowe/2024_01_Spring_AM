<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Test Join"></c:set>
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

<div class="member_join">
<form action="../member/doJoin" method="post">회원가입
	<div class="join_box">
    <input class="box member_id" type="text" autocomplete="off" placeholder="아이디" name="loginId"><div></div>
    <input class="box member_password" type="text" autocomplete="off" placeholder="비밀번호" name="loginPw"><div></div>
    <input class="box member_password_1" type="text" autocomplete="off" placeholder="비밀번호 확인"><div></div>
    <input class="box member_nikname" type="text" autocomplete="off" placeholder="별명" name="nickname"><div></div>
    <input class="box member_name" type="text" autocomplete="off" placeholder="이름" name="name"><div></div>
    <input class="box member_phoneNumber" type="text" autocomplete="off" placeholder="전화번호" name="cellphoneNum"><div></div>
    <input class="box member_email" type="text" autocomplete="off" placeholder="이메일" name="email"><div></div>
    </div>
    <button class="btn btn-ghost modify_btn">회원가입</button>
    </form>
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

.top_btn,
.modify_btn {
	box-shadow: 7px 5px 7.1px 0px rgba(0, 0, 0, 0.25);
}
.top_btn {
  font-family: "S-CoreDream-3Light";
  margin-top: 15.5px;
  height: 30px;
  margin-right: 20px;
}
.modify_btn {
  margin-top: 15px;
}

.member_join {
  text-align: center;
  font-size: 25px;
}

.box {
  margin-top: 30px;
  margin-left: 0;
  padding-top: 7px;
  padding-left:20px;
  background: rgba(226, 226, 226, 1);
  width: 350px;
  height: 47px;
  opacity: 0.5;
  border-radius: 35px;
  box-shadow: 10px 5px 7px 5px rgba(0, 0, 0, 0.25) inset;
}
.join_box {
	font-size: 20px;
	padding-left: 0px;
}


@font-face {
     font-family: 'S-CoreDream-3Light';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff');
     font-weight: normal;
     font-style: normal;
}
</style>