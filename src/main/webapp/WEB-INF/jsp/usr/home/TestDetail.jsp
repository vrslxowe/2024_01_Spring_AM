<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Test Detail"></c:set>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<div id="calendar"></div>
<link href='https://fonts.googleapis.com/css?family=Exo+2:400,100' rel='stylesheet' type='text/css'>
<!-- daisy ui 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/daisyui/4.6.1/full.css" />

<script>
	
</script>

<!doctype html>

<link href='https://fonts.googleapis.com/css?family=Exo+2:400,100' rel='stylesheet' type='text/css'>

<div class="top_bar left">
  <button class="btn top_btn btn-ghost" onclick="history.back();">뒤로가기</button>
</div>
<div class="top_bar right">
  <button class="btn top_btn btn-ghost">글쓰기</button>
</div>

<div class="box box_1"></div>
<div class="box box_2"></div>

<div class="box_1">
  <div class="diary_text">제목</div>
  <div class="dday_text">디데이</div>
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

body {
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
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
  background-image: url("https://blog.kakaocdn.net/dn/bf1nPW/btsFfVyY4fm/lkEFWm3oKHBj7TkLa8DaH0/img.jpg");
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
  margin-top: -90px;
  opacity: 0.5;
  border-radius: 65px;
  background: #e2e2e2;
  box-shadow: 5px 5px 30px 3px rgba(0, 0, 0, 0.25);
  position: fixed;
}
.box_1 {
  width: 1195px;
  height: 805px;
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
.diary_text,
.address_text,
.date_text,
.dday_text {
  opacity: 0.5;
  height: 0px;
  margin-left: 100px;
  background: #e2e2e2;
}
.diary_text,
.date_text,
.dday_text {
  margin-top: 100px;
  width: 450px;
}
.diary_text {
  margin-right: 0;
}
.address_text {
  margin-top: 30px;
  width: 329px;
}
.dday_text {
  margin-right: -350px;
  font-weight: bold;
}
.date_text {
  margin-right: 80px;
}
.btn-circle {
  opacity: 0.6;
  box-shadow: 10px 5px 7px 5px rgba(0, 0, 0, 0.25);
}
.box_4 button {
  margin-right: 10px;
}
.box_4 {
  width: 430px;
  height: 0px;
  margin-top: -20px;
  margin-left: 580px;
  display: flex;
  justify-content: space-between;
}


</style>