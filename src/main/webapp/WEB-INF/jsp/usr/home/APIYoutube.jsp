<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="API Youtube"></c:set>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://apis.google.com/js/api.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="1072992421270-13sb2i51ts3ti3fda94gq55qnkjvv1a2.apps.googleusercontent.com">

<%@ include file="../common/head.jspf"%>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>YouTube Video Search</title>
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
</head>
<body>
    <form name="form1" method="post" onsubmit="return false;">
        <input type="text" id="search_box"  autocomplete="off" placeholder="검색어를 입력하세요">
        <button onclick="searchVideos();">가져오기</button>
    </form>
    <div id="search_results"></div>

    <script>
        function searchVideos() {
            var query = $("#search_box").val().trim();
            if (query === "") {
                alert("검색어를 입력하세요.");
                return;
            }

            var apiKey = "apiKey 넣기";
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

                var videoElement = $("<div class='search_result'>" + title + "'><p>" + title + "</p></div>");
                videoElement.click(function() {
                    watchVideo(videoId);
                });

                searchResultsDiv.append(videoElement);
            });
        }

        function watchVideo(videoId) {
            window.location.href = "https://www.youtube.com/watch?v=" + videoId;
        }
    </script>
</body>















<%@ include file="../common/foot.jspf"%>