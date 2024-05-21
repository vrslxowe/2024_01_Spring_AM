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
<c:set var="loggedInMemberName" value="${rq.loginedMember.name}"></c:set>
<c:set var="loggedInMemberId" value="${rq.loginedMember.loginId}"></c:set>

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
    var maxResults = 10;
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
    window.open("https://www.youtube.com/watch?v=" + videoId, "_blank");
}

</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = data.userSelectedType === 'R' ? data.roadAddress : data.jibunAddress;
            var addressInput = document.getElementById("sample6_address");

            if (addressInput) {
                addressInput.value = addr;
                addressInput.focus();
            } else {
                console.error("sample6_address element not found");
            }
        }
    }).open();
}

function handleFileSelect(event) {
    var files = event.target.files;
    var preview = document.getElementById('photo_preview');
    preview.innerHTML = ''; // Clear any existing previews

    for (var i = 0, f; f = files[i]; i++) {
        if (!f.type.match('image.*')) {
            continue;
        }

        var reader = new FileReader();
        reader.onload = (function(theFile) {
            return function(e) {
                var span = document.createElement('span');
                span.innerHTML = ['<img class="thumb" src="', e.target.result,
                                  '" title="', escape(theFile.name), '"/>'].join('');
                preview.insertBefore(span, null);
            };
        })(f);
        reader.readAsDataURL(f);
    }
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
<div id="photo_preview" style="z-index:8;"></div>
<input class="box title_box" autocomplete="off" type="text" placeholder="제목을 입력해주세요" name="title" />
<input class="box date_box" autocomplete="off" type="text" placeholder="날짜를 입력해주세요" name="date" />
<input class="box address_box" autocomplete="off" type="text" id="sample6_address" placeholder="주소를 입력해주세요" name="address" />

<div class="box_1">
	<div class="box_3">
		<button class="btn btn-circle">글꼴</button>
		<input class="btn btn-circle" type="file" id="photo_input" name="photos" multiple accept="image/*" onchange="handleFileSelect(event)" value="사진">
		<button class="btn btn-circle">링크</button>
		<input class="btn btn-circle" type="button" onclick="sample6_execDaumPostcode()" value="지도">
		<br>
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
	margin-right: 89.5%;
	justify-content: flex-start;
}

.top_bar_right {
	margin-left: 95%;
	justify-content: flex-end;
}

.top_btn {
	font-family: "S-CoreDream-3Light";
	margin-top: 15.5px;
	height: 30px;
	margin-right: 20px;
	display: inline-block;
	box-shadow: 7px 5px 7.1px 0px rgba(0, 0, 0, 0.25);
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
	left: 68%;
	top: 115px;
	z-index: 2;
}

#search_box {
	border: 1px solid black;
	border-radius: 6px;
	background-color: #F1F1F1;
}

.search-results {
	position: fixed;
	top: 150px;
	bottom: 20px;
	right: 19.5%;
	max-height: 150px;
	max-width: 250px;
	background-color: #F1F1F1;
	opacity: 0.8;
	border-radius: 13px;
	font-size: 14px;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow-y: scroll;
	scrollbar-width: none;
	-ms-overflow-style: none;
	z-index: 2;
}

.search-result:hover {
	background-color: gray;
	color: white;
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

.title_box, .address_box, .date_box {
	padding-top: 8px;
	padding-left: 25px;
	opacity: 0.5;
	border-radius: 35px;
	height: 47px;
	background: #e2e2e2;
	box-shadow: 10px 5px 7px 5px rgba(0, 0, 0, 0.25) inset;
	z-index: 1;
}

.title_box, .date_box {
	margin-top: 255px;
	width: 450px;
}

.title_box {
	margin-right: 32%;
}

 .thumb {
        max-width: 200px;
        max-height: 200px;
        width: auto;
        height: auto;
    }

.address_box {
	margin-top: 185px;
	width: 329px;
	margin-right: 38.3%;
	z-index: 7;
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