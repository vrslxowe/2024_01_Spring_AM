<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Test Write"></c:set>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<div id="calendar"></div>
<link href='https://fonts.googleapis.com/css?family=Exo+2:400,100' rel='stylesheet' type='text/css'>
<!-- daisy ui 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/daisyui/4.6.1/full.css" />
<script src="https://apis.google.com/js/api.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<meta name="google-signin-client_id" content="1072992421270-13sb2i51ts3ti3fda94gq55qnkjvv1a2.apps.googleusercontent.com">

<div class="search-container">
    <form name="form1" method="post" onsubmit="return false;">
        <input type="text" id="search_box" autocomplete="off" placeholder="검색어를 입력하세요">
        <button id="search_button" onclick="searchVideos();">검색</button>
    </form>
</div>
<div id="search_results" class="search-results"></div>


<script>
function toggleSearchBox() {
    var searchBox = $("#search_box");
    var searchButton = $("#search_button");

    if (searchBox.css("display") === "none") {
        searchBox.css("display", "inline-block");
        searchButton.css("display", "inline-block");
    } else {
        searchBox.css("display", "none");
        searchButton.css("display", "none");
    }
}

function searchVideos() {
    var query = $("#search_box").val().trim();
    if (query === "") {
        alert("검색어를 입력하세요.");
        return;
    }

    var apiKey = "AIzaSyAnW6wrkzoAtz9y-G9oainLtxUruRV9kzE";
    var maxResults = 10; // Number of search results to display
    var searchUrl = "https://www.googleapis.com/youtube/v3/search?part=snippet&type=video&q=" + encodeURIComponent(query) + "&key=" + apiKey + "&maxResults=" + maxResults;

    $.ajax({
        type: "GET",
        url: searchUrl,
        dataType: "json",
        success: function(response) {
            displaySearchResults(response.items);
        },
        error: function(xhr, textStatus, error) {
            console.error("Error fetching search results:", error);
        }
    });
}

function displaySearchResults(results) {
    var searchResultsDiv = $("#search_results");
    searchResultsDiv.empty();

    if (results.length === 0) {
        searchResultsDiv.append("<p>No results found.</p>");
        return;
    }

    results.forEach(function(result) {
        var videoId = result.id.videoId;
        var title = result.snippet.title;
        var thumbnailUrl = result.snippet.thumbnails.default.url;

        var videoElement = $("<div class='search-result'>" + title + "'></div>");
        videoElement.click(function() {
            watchVideo(videoId);
        });

        searchResultsDiv.append(videoElement);
    });

    // Scroll to the bottom of the search results div
    searchResultsDiv.animate({ scrollTop: searchResultsDiv.prop("scrollHeight") }, 400);
}

function watchVideo(videoId) {
    window.location.href = "https://www.youtube.com/watch?v=" + videoId;
}
</script>

<!doctype html>

<div class="top_bar top_bar_left">
	<button class="btn top_btn btn-ghost" onclick="history.back();">뒤로가기</button>
	<a href="../home/TestMain">
		<button class="btn top_btn btn-ghost">💖</button>
	</a>
</div>
<div class="top_bar top_bar_right">
	<a href="../home/TestDetail">
	<button class="btn top_btn btn-ghost">등록</button>
	</a>
</div>

<div class="box box_1"></div>
	<textarea class="box content_box scrollBar" autocomplete="off" type="text" placeholder="내용을 입력해주세요" name="content"></textarea>
	<input class="box title_box" autocomplete="off" type="text" placeholder="제목을 입력해주세요" name="title" />
	<input class="box date_box" autocomplete="off" type="text" placeholder="날짜를 입력해주세요" name="date" />
	<input class="box address_box" autocomplete="off" type="text" placeholder="주소를 입력해주세요" name="address" />

<div class="box_1">
	<div class="box_3">
		<button class="btn btn-circle">글꼴</button>
		<button class="btn btn-circle">사진</button>
		<button class="btn btn-circle">링크</button>
		<button class="btn btn-circle">지도</button>
		<div class="box_4">
			<button class="btn btn-circle">날씨</button>
			<button class="btn btn-circle">감정</button>
			<button class="btn btn-circle" onclick="toggleSearchBox()">음악</button>
		</div>
	</div>
</div>

<style type="text/css">
body {
	overflow: hidden;
	font-family: "Exo 2", "S-CoreDream-3Light";
	font-weight: normal;
	margin: 0px;
	padding: 0px;
	width: 100%;
	height: 100%;
	min-height: 100vh;
	position: relative;
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
	background-image:
		url("https://blog.kakaocdn.net/dn/bf1nPW/btsFfVyY4fm/lkEFWm3oKHBj7TkLa8DaH0/img.jpg");
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
	margin-right: 89.5%; /* 왼쪽 여백 설정 */
	justify-content: flex-start; /* 왼쪽 정렬 */
}

.top_bar_right {
	margin-left: 95%; /* 오른쪽 여백 설정 */
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

.btn-circle {
	font-family: "S-CoreDream-3Light";
	opacity: 0.6;
	box-shadow: 7px 5px 6px 4px rgba(0, 0, 0, 0.25);
}

.search-container {
    position: fixed;
    bottom: 20px; /* Adjust as needed */
    right: 20px; /* Adjust as needed */
    z-index: 2; /* Ensure the search box and button are above other elements */
}

#search_box {
	border: 1px solid black;
	border-radius: 6px;
}

.search-results {
	position: fixed;
    bottom: 20px; /* 아래 여백 조절 */
    right: calc(50% + 160px); /* 음악 버튼의 가로 길이 + 여백만큼 오른쪽에 위치 */
    max-height: 150px;
    max-width: 250px;
    background-color: skyblue;
    font-size: 14px;
    white-space: nowrap; /* Prevent text wrapping */
    text-overflow: ellipsis; /* Display ellipsis (...) for overflowed text */
    overflow-y: scroll;
    scrollbar-width: none; /* Firefox */
    -ms-overflow-style: none; /* IE 10+ */
    z-index: 2; /* 다른 요소 위에 표시하기 위한 z-index 값 설정 */
}

.search-result:hover {
	background-color: #f0f0f0;
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
.content_box {
  padding-left: 40px;
  padding-top: 25px;
  width: 1050px;
  height: 497px;
  position: fixed;
  left: 424px;
  top: 418px;
  box-shadow: 10px 5px 7px 5px rgba(0, 0, 0, 0.25) inset;
  z-index: 1;
  resize: none;
}

.title_box,
.address_box,
.date_box {
  padding-top: 8px;
  padding-left: 25px;
  opacity: 0.5;
  border-radius: 35px;
  height: 47px;
  background: #e2e2e2;
  box-shadow: 10px 5px 7px 5px rgba(0, 0, 0, 0.25) inset;
  z-index: 1;
}

.title_box,
.date_box {
	margin-top: 255px;
	width: 450px;
}

.title_box {
	margin-right: 32%;
}

.address_box {
	margin-top: 185px;
	width: 329px;
	margin-right: 38.3%;
}

.date_box {
	margin-left: 27%;
}

.box_3 {
	width: 370px;
	height: 0px;
	margin-left: 60px;
	margin-top: -50px;
}

.box_3 button {
	margin-right: 10px;
}

.box_4 {
	width: 430px;
	height: 0px;
	margin-top: 0px;
	margin-left: 580px;
	display: flex;
	justify-content: space-between;
}

.scrollBar::-webkit-scrollbar {
    width: 10px;  /* 스크롤바의 너비 */
}

.scrollBar::-webkit-scrollbar-thumb {
    height: 30%; /* 스크롤바의 길이 */
    background: #606060; /* 스크롤바의 색상 */
    border-radius: 10px;
}

.scrollBar::-webkit-scrollbar-track {
    background: transparent;  /*스크롤바 뒷 배경 색상*/
}

@-webkit-scrollbar {
    width: 10px;  /* 스크롤바의 너비 */
}

@-webkit-scrollbar-thumb {
    height: 30%; /* 스크롤바의 길이 */
    border-radius: 10px;
}

@-webkit-scrollbar-track {
    background: transparent;
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