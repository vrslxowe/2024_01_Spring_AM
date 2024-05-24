<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Test List"></c:set>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<div id="calendar"></div>
<link href='https://fonts.googleapis.com/css?family=Exo+2:400,100' rel='stylesheet' type='text/css'>
<!-- daisy ui 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/daisyui/4.6.1/full.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<c:set var="loggedInMemberName" value="${rq.loginedMember.name}"></c:set>
<c:set var="loggedInMemberId" value="${rq.loginedMember.loginId}"></c:set>

<script>
    const box = document.getElementById('box');
    const boxHeader = document.querySelector('.box_header');
    const box3 = document.querySelector('.box3');
    const contentBox = document.querySelector('.content');

    box.addEventListener('scroll', function () {
      const scrolled = box.scrollTop;
      const scrollHeight = box.scrollHeight - box.clientHeight;
      const distanceFromBottom = scrollHeight - scrolled;

      // 스크롤이 맨 아래에 도달하면
      if (distanceFromBottom === 0) {
        boxHeader.style.top = '40px';
        box3.style.top = '60px';
      } else {
        boxHeader.style.top = '20px';
        box3.style.top = '20px';
      }
    });

    function toggleSearch() {
        const searchBox = document.querySelector('.search_box');
        const isVisible = searchBox.style.display === 'block';
        searchBox.style.display = isVisible ? 'none' : 'block';
    }

    function submitSearch(event) {
        event.preventDefault();
        const query = document.querySelector('input[name="search_query"]').value;
        alert('검색어: ' + query);
        // 리스트에서 검색 수행하는 코드 추가 예정
    }
  </script>


<title>Search Toggle Example</title>

<!doctype html>

<div class="top_bar top_bar_left">
	<span class="material-symbols-outlined back_btn" onclick="history.back();">arrow_back_ios</span>
	<a href="../home/TestMain">
		<span class="material-symbols-outlined main_btn">home</span>
	</a>
</div>

<div class="top_bar top_bar_right">
    <div class="search_box">
      <form onsubmit="submitSearch(event)">
        <input type="text" placeholder="검색어를 입력하세요" name="search_query" autocomplete='off'>
        <button type="submit">검색</button>
      </form>
    </div>
    <span class="material-symbols-outlined search_btn" onclick="toggleSearch()">search</span>
    <a href="../home/TestWrite">
      <span class="material-symbols-outlined write_btn">edit_square</span>
    </a>
  </div>

<div class="box">
<button class="box3">3월 기록 ▽</button>
<div class=box_header></div>
<div class="list_box">
  <div class="list_box1">
  <div class="imege_box imege_box1"></div>
    <div class="content_box">
      Plusieurs variations de Lorem Ipsum peuvent être trouvées ici ou là, mais la majeure partie d'entre elles a été altérée par l'addition d'humour ou de mots aléatoires qui ne ressemblent pas une seconde à du texte standard.
    </div>
  </div>
    <div class="list_box2">
    <div class="imege_box imege_box2"></div>
        <div class="content_box">
            Plusieurs variations de Lorem Ipsum peuvent être trouvées ici ou là, mais la majeure partie d'entre elles a été altérée par l'addition d'humour ou de mots aléatoires qui ne ressemblent pas une seconde à du texte standard.
        </div>
    </div>
    <div class="list_box3">
    <div class="imege_box imege_box3"></div>
        <div class="content_box">
           Lorem Ipsum peuvent être trouvées ici ou là, mais la majeure partie d'entre elless variations de Lorem Ipsum peuvent être trouvées ici ou là, mais la majeure partie d'entre elles a été altérée par l'addition d'humour ou de mots aléatoires qui ne ressemblent pas une seconde à du texte standard.
        </div>
    </div>
    <div class="list_box4">
    <div class="imege_box imege_box4"></div>
        <div class="content_box">
            rouvées ici ou là, mais la majeure partie d'entre elles a été altérée par l'addition d'humour ou de mots aléatoires qui ne ressemblent pas une seconde à du texte standard.
        </div>
    </div>
    <div class="list_box5">
    <div class="imege_box imege_box5"></div>
        <div class="content_box">
            d'entre elles a été altérée par l'addition d'humour ou de mots aléatoires qui ne ressemblent pas une seconde à du texte standard.
        </div>
    </div>
    <div class="list_box6">
    <div class="imege_box imege_box6"></div>
        <div class="content_box">
            Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean commodo ligula eget dolor.
        </div>
    </div>
    <div class="list_box7">
    <div class="imege_box imege_box7"></div>
        <div class="content_box">
            Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean commodo ligula eget dolor.
        </div>
    </div>
    <div class="list_box8">
    <div class="imege_box imege_box8"></div>
        <div class="content_box">
            Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean commodo ligula eget dolor.
        	</div>
    	</div>
	</div>
</div>

<style type="text/css">
body {
	color: #5e5e5e; /* 본문 텍스트 색상 */
	overflow: hidden; /* 스크롤 막기 */
	font-family: "Exo 2", "S-CoreDream-3Light"; /* 글꼴 설정 */
	font-weight: normal; /* 글꼴 두껍기 설정 */
	margin: 0; /* 바깥 여백 설정 */
	padding: 0; /* 안쪽 여백 설정 */
	-webkit-touch-callout: none; /* iOS 길게 누르면 메뉴 뜨는 것 막기 */
	-webkit-user-select: none; /* 텍스트 선택 방지 */
	-khtml-user-select: none; /* 텍스트 선택 방지 (KHTML 엔진) */
	-moz-user-select: none; /* 텍스트 선택 방지 (Gecko 엔진) */
	-ms-user-select: none; /* 텍스트 선택 방지 (마이크로소프트 엔진) */
	user-select: none; /* 텍스트 선택 방지 */
	width: 100%; /* 너비 100% 설정 */
	height: 100%; /* 높이 100% 설정 */
	min-height: 100vh; /* 최소 높이 100% 설정 */
	position: relative; /* 상대 위치 설정 */
	display: flex; /* Flexbox 사용 */
	justify-content: center; /* 가로 중앙 정렬 */
	align-items: center; /* 세로 중앙 정렬 */
	flex-wrap: wrap; /* Flexbox 줄 바꿈 */
	background-image:
		url("https://blog.kakaocdn.net/dn/R9biv/btsFioNqNuy/EOMko5QGySmhKmVFJKwYa0/img.jpg");
	/* 배경 이미지 설정 */
	background-repeat: no-repeat; /* 배경 이미지 반복 없음 */
	background-position: center; /* 배경 이미지 가운데 정렬 */
	background-size: cover; /* 배경 이미지를 컨테이너에 맞추어 표시 */
}

.top_bar {
	height: 61.7px; /* 상단 바 높이 설정 */
	padding: 0; /* 안쪽 여백 없음 */
	margin: 0; /* 바깥 여백 없음 */
	position: fixed; /* 고정 위치 설정 */
	top: 0; /* 위쪽으로 고정 */
	text-align: center; /* 가운데 정렬 */
	font-family: "Exo 2"; /* 글꼴 설정 */
	font-weight: normal; /* 글꼴 두껍기 설정 */
	display: flex; /* Flexbox 사용 */
}

.top_bar_left {
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

.top_bar_right {
	left: 95%; /* 오른쪽 여백 설정 */
	justify-content: flex-end; /* 오른쪽 정렬 */
}

.search_btn {
	position: relative;
	top: 23px;
	left: -10px;
}
.write_btn {
	position: relative;
	top: 23px;
	left: 10px;
}

.top_btn {
	font-family: "S-CoreDream-3Light"; /* 글꼴 설정 */
	margin-top: 15.5px; /* 위쪽 여백 설정 */
	height: 30px; /* 높이 설정 */
	margin-right: 20px; /* 오른쪽 여백 설정 */
	display: inline-block; /* 인라인 블록 요소로 표시 */
	box-shadow: 7px 5px 7.1px 0px rgba(0, 0, 0, 0.25); /* 그림자 설정 */
}

.search_box {
	font-family: "S-CoreDream-3Light"; /* 글꼴 설정 */
	font-size: 17px;
	display: none;
	position: absolute; /* 절대 위치 설정 */
	top: 60px; /* 검색 버튼 바로 아래에 위치 */
    right: -30px;
	width: 250px;
	height: 35px;
	border-radius: 35px;
	padding-top: 5px;
	box-shadow: 7px 5px 7.1px 0px rgba(0, 0, 0, 0.25); /* 그림자 설정 */
	opacity: 1;
	-webkit-animation: fadeIn 0.15s ease-out;
	z-index: 10;
}
.fadeIn {
    -webkit-animation: fadeIn 0.15s ease-out;
    display: block;
}

.fadeOut {
    -webkit-animation: fadeOut 0.15s ease-out;
    display: block;
    -webkit-animation-fill-mode: forwards; /* 애니메이션이 끝나고 마지막 프레임을 유지 */
}

input {
    background-color: transparent; /* 검색창 배경색 투명하게 설정 */
}

.box {
	width: 1334px;
	height: 878px;
	position: absolute;
	left: 292px;
	top: 20px;
	background-color: rgba(203, 203, 203, 0.5); /* Adjust the opacity here */
	border-radius: 65px;
	box-shadow: 5px 5px 20px 3px rgba(0, 0, 0, 0.25);
	overflow: auto;
	/* 스크롤바 숨김 */
	scrollbar-width: none; /* Firefox */
	-ms-overflow-style: none; /* IE 10+ */
}

.box2 {
	width: 143px;
	height: 32px;
	filter: drop-shadow(0px 4px 4px rgba(0, 0, 0, 0.25));
}

.box3 {
	position: fixed; /* 'box3' 고정 */
	top: 20px; /* 박스 상단에 고정 */
	left: 45.5%; /* 박스 왼쪽에 고정 */
	width: 9%;
	height: 7%;
	z-index: 2;
	font-style: normal;
	font-weight: 400;
	font-size: 21px;
	line-height: 30px;
	letter-spacing: 0.4em;
	color: #5e5e5e;
}

.box_header {
	width: 1334px;
	height: 55px;
	top: 20px; /* 박스 상단에 고정 */
	background-color: rgba(203, 203, 203, 0);
	z-index: 1;
	position: fixed;
	border-radius:65px 65px 0px 0px;
	background: rgba( 255, 255, 255, 0 );
	backdrop-filter: blur( 5.5px );
	-webkit-backdrop-filter: blur( 5.5px );
}

.list_box > div {
	width: 620px;
	height: 243px;
	position: absolute;
	border-radius: 55px;
	background-color: rgba(231, 231, 231, 0.9);
	box-shadow: 10px 5px 7px 5px rgba(0, 0, 0, 0.25) inset;
}

.list_box1 {
	left: 22.5px; /* -37.5px + 60px */
	top: 79.5px; /* 64.5px + 15px */
}

.list_box2 {
	left: 674.5px; /* 614.5px + 60px */
	top: 79.5px; /* 64.5px + 15px */
}

.list_box3 {
	left: 22.5px; /* -37.5px + 60px */
	top: 340.5px; /* 325.5px + 15px */
}

.list_box4 {
	left: 676.5px; /* 616.5px + 60px */
	top: 340.5px; /* 325.5px + 15px */
}

.list_box5 {
	left: 33.5px; /* -26.5px + 60px */
	top: 601.5px; /* 586.5px + 15px */
}

.list_box6 {
	left: 685.5px; /* 625.5px + 60px */
	top: 601.5px; /* 586.5px + 15px */
}

.list_box7 {
  left: 33.5px; /* Same as list_box5 */
  top: 862.5px; /* 847.5px + 15px */
}

.list_box8 {
  left: 685.5px; /* Same as list_box6 */
  top: 862.5px; /* 847.5px + 15px */
}

.content_box {
	overflow-y: scroll;
	width: 425px;
	height: 165px;
	position: absolute;
	font-size: 18px;
	text-align: center;
	color: #5e5e5e;
	text-shadow: 0px 3px 3px rgba(0, 0, 0, 0.25);
	left: 63%;
	top: 59%;
	transform: translate(-50%, -50%);
	display: flex; /* Flexbox를 사용하여 내부 요소를 가운데 정렬 */
	justify-content: center; /* 수평 가운데 정렬 */
	/* 스크롤바 숨김 */
	scrollbar-width: none; /* Firefox */
	-ms-overflow-style: none; /* IE 10+ */
}

.content_box::-webkit-scrollbar {
	display: none; /* Chrome, Safari, Opera */
}

.imege_box {
	position: absolute;
	width: 135px;
	height: 135px;
	border-radius: 20px;
	left: 5%;
	top: 31%;
	border-radius: 20px;
	box-shadow: 2px 4px 6px 2px rgba(0, 0, 0, 0.25);
}

.imege_box1 {
	
	background: url('https://blog.kakaocdn.net/dn/bmqXqj/btsFYN6qP5h/kPaI2XVZmxnkw8lWkeNIl0/img.jpg') no-repeat;
    background-size: cover;
    
}

.imege_box2 {

	background: url('https://blog.kakaocdn.net/dn/bIaHUa/btsGbBsU2vs/5MJjIJDRJKCHiqNzpA8PZK/img.jpg') no-repeat;
    background-size: cover;
    
}

.imege_box3 {

	background: url('https://blog.kakaocdn.net/dn/ch5xpk/btsGcHTqzJm/w7UD46JENdnghIbQk5f5dk/img.jpg') no-repeat;
    background-size: cover;
    
}

.imege_box4 {

	background: url('https://blog.kakaocdn.net/dn/b1jClb/btsFXY8xE1I/0ZYEE6bO5GscllLtZT3uh1/img.jpg') no-repeat;
    background-size: cover;
    
}

.imege_box5 {

	background: url('https://blog.kakaocdn.net/dn/b1Sn6l/btsGc3IJaP9/bAYukRd89v6w8wb9qbw7GK/img.jpg') no-repeat;
    background-size: cover;
    
}

.imege_box6 {

	background: url('https://blog.kakaocdn.net/dn/bjobPW/btsGbS8Zsqs/REImSzTlkU4Lw1CCtn3HqK/img.jpg') no-repeat;
    background-size: cover;
    
}

.imege_box7 {

	background: url('https://blog.kakaocdn.net/dn/cRw0Cm/btsHCbLx33T/eI5tnr3BEw4ngpVt8hs9w1/img.jpg') no-repeat;
    background-size: cover;
    
}

.imege_box8 {

	background: url('https://blog.kakaocdn.net/dn/7neeP/btsHBnMNOw9/XhkVC2MyD3kb8Vt1qGbFAK/img.jpg') no-repeat;
    background-size: cover;
    
}

@font-face {
	font-family: 'S-CoreDream-3Light';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

/* 19일 */

position: absolute;
width: 63px;
height: 32px;
left: 1021px;
top: 231px;

font-weight: 400;
font-size: 25px;
line-height: 30px;
letter-spacing: 0.15em;

color: #757575;

text-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);

/* unsplash:zcUgjyqEwe8 */

position: absolute;
width: 135px;
height: 135px;
left: 1014px;
top: 285px;
background: url('https://blog.kakaocdn.net/dn/bmqXqj/btsFYN6qP5h/kPaI2XVZmxnkw8lWkeNIl0/img.jpg');
border-radius: 20px;

</style>