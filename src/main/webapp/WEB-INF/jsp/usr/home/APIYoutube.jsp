<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="API Youtube"></c:set>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://apis.google.com/js/api.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<meta name="google-signin-client_id" content="1072992421270-13sb2i51ts3ti3fda94gq55qnkjvv1a2.apps.googleusercontent.com">

<%@ include file="../common/head.jspf"%>

<button class="btn btn-circle" onclick="toggleSearchBox()">음악</button>
<form name="form1" method="post" onsubmit="return false;">
    <input type="text" id="search_box" autocomplete="off" placeholder="검색어를 입력하세요" style="display: none;">
    <button id="search_button" onclick="searchVideos();" style="display: none;">검색</button>
</form>
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



<style type="text/css">
#search_box {
	border: 1px solid black;
	border-radius: 6px;
}

.search-results {
	max-height: 150px;
	max-width: 250px;
	background-color: skyblue;
	font-size: 14px;
	white-space: nowrap; /* Prevent text wrapping */
	text-overflow: ellipsis;
	/* Display ellipsis (...) for overflowed text */
	overflow-y: scroll;
	justify-content: center; /* 수평 가운데 정렬 */
	/* 스크롤바 숨김 */
	scrollbar-width: none; /* Firefox */
	-ms-overflow-style: none; /* IE 10+ */ .
	content_box: :-webkit-scrollbar{ 
	display: none; /* Chrome, Safari, Opera */
	padding: 3px;
}

.search-result:hover {
	background-color: #f0f0f0;
}
</style>












<%@ include file="../common/foot.jspf"%>