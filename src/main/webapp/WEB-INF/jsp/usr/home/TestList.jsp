<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Test List"></c:set>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<div id="calendar"></div>
<link href='https://fonts.googleapis.com/css?family=Exo+2:400,100' rel='stylesheet' type='text/css'>
<!-- daisy ui 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/daisyui/4.6.1/full.css" />

<!doctype html>

<div class="top_bar left">
  <a href="../home/TestMain">
  <button class="btn top_btn btn-ghost">💖</button></a>
</div>

<div class="top_bar top_bar_right">
	<div class="search_box">
	<form onsubmit="submitSearch(event)">
		<input type="text" placeholder="검색어를 입력하세요" name="search_query" autocomplete='off'>
		<button type="submit">검색</button>
		</form>
	</div>
	<button class="btn top_btn btn-ghost" onclick="toggleSearch()">검색🔍</button>
	<a href="../home/TestWrite">
		<button class="btn top_btn btn-ghost write">글쓰기🖊</button>
	</a>
	<a href="../home/TestProfile">
		<button class="btn top_btn btn-ghost">내 정보😀</button>
	</a>
</div>

<div class="box">
<div class="box3">3월 기록 ▽</div>
<div class="list_box">
  <div class="list_box1">
    <div class="content_box">
      늘 바라왔던 작은 소원 네가 행복했으면 좋겠어 네 웃음과 눈물과 모든 것들이 소중해 이 순간의 심장 소리와 떨림을 난 영원히 기억할래 Keep on keep on loving babe 밤은 길지 않을 테니 있는 그대로의 널 사랑하고 있어 너의 꿈이 내 꿈이 돼 우린 답을 알고 있지 바로 여기 So I make this wish tonight
    </div>
  </div>
    <div class="list_box2">
        <div class="content_box">
            Plusieurs variations de Lorem Ipsum peuvent être trouvées ici ou là, mais la majeure partie d'entre elles a été altérée par l'addition d'humour ou de mots aléatoires qui ne ressemblent pas une seconde à du texte standard.
        </div>
    </div>
    <div class="list_box3">
        <div class="content_box">
            국회에서 의결된 법률안은 정부에 이송되어 15일 이내에 대통령이 공포한다. 모든 국민은 사생활의 비밀과 자유를 침해받지 아니한다. 국회는 선전포고, 국군의 외국에의 파견 또는 외국군대의 대한민국 영역안에서의 주류에 대한 동의권을 가진다. 명령·규칙 또는 처분이 헌법이나 법률에 위반되는 여부가 재판의 전제가 된 경우에는 대법원은 이를 최종적으로 심사할 권한을 가진다.
        </div>
    </div>
    <div class="list_box4">
        <div class="content_box">
            願い事はいつも キミの幸せだけさ 笑顔や涙 大切なすべて いつまでも忘れない この瞬間 心臓の音まで Keep on keep on loving babe 明けない夜はない 飾らないキミを 見つめているよ ユメとユメが Link 答えなら すぐそこにある So I make this wish tonight
        </div>
    </div>
    <div class="list_box5">
        <div class="content_box">
            えんしてぃウィッシュはえんしてぃの最後のグループで、2024年2月21日にデビューしました。リーダーはシオンです。メンバーはシオンを含めて合計6人で、リク、ユウシ、ジェヒ、リョウ、サクヤで構成されています。韓国人はシオン、ジェヒの二人で、リク、ユウシ、リョウ、サクヤは日本人です。
        </div>
    </div>
    <div class="list_box6">
        <div class="content_box">
            Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.
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

.top_btn {
	font-family: "S-CoreDream-3Light"; /* 글꼴 설정 */
	margin-top: 15.5px; /* 위쪽 여백 설정 */
	height: 30px; /* 높이 설정 */
	margin-right: 20px; /* 오른쪽 여백 설정 */
	display: inline-block; /* 인라인 블록 요소로 표시 */
	box-shadow: 7px 5px 7.1px 0px rgba(0, 0, 0, 0.25); /* 그림자 설정 */
}

.left {
  margin-right: 95%;
  justify-content: flex-start;
}

.search_box {
	font-family: "S-CoreDream-3Light"; /* 글꼴 설정 */
	font-size: 17px;
	display: none;
	position: absolute; /* 절대 위치 설정 */
	margin-top: 22px; /* 위쪽 여백 설정 */
	margin-right: 350px;
	width: 285px;
	height: 35px;
	border-radius: 35px;
	padding-top: 5px;
	box-shadow: 7px 5px 7.1px 0px rgba(0, 0, 0, 0.25); /* 그림자 설정 */
	opacity: 1;
	-webkit-animation: fadeIn 0.15s ease-out;
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
  height: 862px;
  position: absolute;
  left: 292px;
  top: 35px;
  opacity: 0.5;
  border-radius: 65px;
  background: #e2e2e2;
  box-shadow: 5px 5px 30px 3px rgba(0,0,0,0.25);
}

.box2 {
    width: 143px;
    height: 32px;
    filter: drop-shadow(0px 4px 4px rgba(0,0,0,0.25));
}

.box3 {
    position: absolute;
    width: 180px;
    height: 32px;
    left: 45%;
    top: 15px;
    font-style: normal;
    font-weight: 400;
    font-size: 18px;
    line-height: 30px;
    letter-spacing: 0.4em;
    color: #5e5e5e;
}

.list_box > div {
  width: 620px;
  height: 243px;
  position: absolute;
  opacity: 0.5;
  border-radius: 55px;
  background: white;
}

.list_box1 {
  left: 22.5px; /* -37.5px + 60px */
  top: 64.5px; /* 104.5px - 40px */
}

.list_box2 {
  left: 674.5px; /* 614.5px + 60px */
  top: 64.5px; /* 104.5px - 40px */
}

.list_box3 {
  left: 22.5px; /* -37.5px + 60px */
  top: 325.5px; /* 365.5px - 40px */
}

.list_box4 {
  left: 676.5px; /* 616.5px + 60px */
  top: 325.5px; /* 365.5px - 40px */
}

.list_box5 {
  left: 33.5px; /* -26.5px + 60px */
  top: 586.5px; /* 626.5px - 40px */
}

.list_box6 {
  left: 685.5px; /* 625.5px + 60px */
  top: 586.5px; /* 626.5px - 40px */
}

.content_box {
  width: 512px;
  height: 135px;
  position: absolute;
  font-size: 18px;
  text-align: center;
  color: #5e5e5e;
  filter: drop-shadow(0px 4px 4px rgba(0, 0, 0, 0.25));
  left: 50%;
  top: 65%;
  transform: translate(-50%, -50%);
}

@font-face {
     font-family: 'S-CoreDream-3Light';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff');
     font-weight: normal;
     font-style: normal;
}
</style>