<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Test Join"></c:set>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<div id="calendar"></div>
<link href='https://fonts.googleapis.com/css?family=Exo+2:400,100' rel='stylesheet' type='text/css'>
<!-- daisy ui 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/daisyui/4.6.1/full.css" />

<!doctype html>

  <div class="top_bar">
    <button class="btn top_btn btn-ghost" onclick="history.back();">뒤로가기</button>
  </div>

<div class="member_join">회원가입
    <div class="box"></div>
    <div class="box member_id"></div>
    <div class="box member_password"></div>
    <div class="box member_id"></div>
    <div class="box member_name"></div>
    <div class="box member_birth"></div>
    <div class="box member_phoneNumber"></div>
    <div class="box member_email"></div>
    <div class="modify_btn"><button class="btn btn-ghost">회원가입</button></div>
  </div>



<style type="text/css">

body {
  color: #5e5e5e;
  overflow: hidden;
  font-family: "Exo 2";
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
  background-image: url("https://blog.kakaocdn.net/dn/R9biv/btsFioNqNuy/EOMko5QGySmhKmVFJKwYa0/img.jpg");
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
}

.top_bar {
  height: 61.7px;
  width: 100%;
  padding: 0px;
  margin: 0px;
  position: absolute;
  top: 0px;
  text-align: center;
  font-family: "Exo 2";
  font-weight: normal;
  display: flex;
  margin-left: 20px;
}
.top_btn {
  margin-top: 15.5px;
  height: 30px;
  margin-right: 20px;
  display: inline-block;
}
.member_join {
  text-align: center;
  font-size: 25px;
}
.box {
  margin-top: 30px;
  margin-left: 0%;
  background: rgba(226, 226, 226, 1);
  width: 350px;
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
  margin-top: 15px;
  margin-left: 0%;
  font-size: 19px;
  border-radius: 15px;
}
</style>