<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="API Youtube"></c:set>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<%@ include file="../common/head.jspf"%>

<button onclick="authenticateAndLoadClient()">인증 및 로드</button>
<button onclick="execute()">실행</button>
<div id="searchResults"></div>
<div id="apiData"></div> <!-- New div to display API data -->

<script src="https://apis.google.com/js/api.js"></script>
<script>
    // Google API 클라이언트 로드 및 인증
    function authenticateAndLoadClient() {
        authenticate().then(loadClient);
    }

    // Google 사용자 인증
    function authenticate() {
        return gapi.auth2.getAuthInstance()
            .signIn({scope: "https://www.googleapis.com/auth/youtube.force-ssl"})
            .then(function() { console.log("로그인 성공"); },
                  function(err) { console.error("로그인 오류", err); });
    }

    // YouTube API 클라이언트 로드
    function loadClient() {
        gapi.client.setApiKey("AIzaSyAnW6wrkzoAtz9y-G9oainLtxUruRV9kzE");
        return gapi.client.load("https://www.googleapis.com/discovery/v1/apis/youtube/v3/rest")
            .then(function() { console.log("YouTube API 클라이언트 로드됨"); },
                  function(err) { console.error("YouTube API 클라이언트 로드 오류", err); });
    }

    // YouTube 비디오 검색 실행
    function execute() {
        return gapi.client.youtube.search.list({
            "maxResults": 5,
            "q": "치이카와",
            "type": [
                "video"
            ]
        })
        .then(function(response) {
            // 결과를 여기서 처리합니다 (response.result에 파싱된 본문이 있습니다).
            console.log("검색 결과", response);

            // Display video search results
            const searchResultsElement = document.getElementById("searchResults");
            searchResultsElement.innerHTML = ""; // Clear previous results

            if (response.result && response.result.items) {
                response.result.items.forEach(function(item) {
                    if (item.snippet) { // Check if snippet information exists
                        const title = item.snippet.title;
                        const description = item.snippet.description;
                        const thumbnailUrl = item.snippet.thumbnails.default.url;
                        const videoId = item.id.videoId;

                        // Create HTML elements for video data
                        const videoElement = document.createElement("div");
                        videoElement.innerHTML = `
                            <h2>${title}</h2>
                            <p>${description}</p>
                            <a href="https://www.youtube.com/watch?v=${videoId}" target="_blank">
                                <img src="${thumbnailUrl}" alt="${title}">
                            </a>
                        `;

                        // Append video element to search results
                        searchResultsElement.appendChild(videoElement);
                    } else {
                        console.error("Snippet 정보가 없습니다:", item);
                    }
                });
            } else {
                console.error("API 응답에 아이템이나 결과가 없습니다:", response);
            }
        })
        .catch(function(err) {
            console.error("실행 오류", err);
        });
    }
    
    // 클라이언트 및 인증 로드
    gapi.load("client:auth2", function() {
        gapi.auth2.init({client_id: "1072992421270-13sb2i51ts3ti3fda94gq55qnkjvv1a2.apps.googleusercontent.com"});
    });
    
    // Fetch data from the API
    fetch('https://www.googleapis.com/youtube/v3/videos?key=AIzaSyAnW6wrkzoAtz9y-G9oainLtxUruRV9kzE&part=snippet&chart=mostPopular&maxResults=10')
    .then(response => response.json())
    .then(data => {
      // Check if the response contains items
      if (data.items && data.items.length > 0) {
        // Assuming you want to display the first video's title and description
        const firstVideo = data.items[0];
        const title = firstVideo.snippet.title;
        const description = firstVideo.snippet.description;

        // Update HTML content with fetched data
        const apiDataElement = document.getElementById('apiData');
        apiDataElement.innerHTML = `<h2>${title}</h2><p>${description}</p>`;
      } else {
        console.error('No items found in API response');
      }
    })
    .catch(error => {
      console.error('Error fetching data:', error);
    });

 
/* maniadb:
	  url: http://maniadb.com/api/search/
	  method: song
	  display: 10
	  apiKey: ${MANIADB_API_KEY}
	  version: 0.5
	  
// 24년 3월 20일을 "시험" 디데이로 추가
	    var testDday = moment();
	    var daysUntilTestDday = testDday.diff(moment(), 'days');
	    //var testDdayDiv = createElement("div", "event dday");
	    var testDdayText = daysUntilTestDday >= 0 ? "D-" + daysUntilTestDday + " 시험" : "D+" + Math.abs(daysUntilTestDday) + " 시험";
	 //   var testDdaySpan = createElement("span", "", testDdayText);
	 //   testDdayDiv.appendChild(testDdaySpan);
	 //   wrapper.appendChild(testDdayDiv);

//선택된 날짜를 기반으로 D-Day 번호를 업데이트하는 함수
	  function updateDday(selectedDate) {
		  var testDday = moment("2024-03-20");
		  var daysUntilTestDday = testDday.diff(moment(), 'days');
	   var daysUntilDday = dday.diff(selectedDate, 'days');
	   //var testDdayDiv = createElement("div", "event dday");
	   var ddayText = daysUntilDday >= 0 ? "D-" + daysUntilDday + " 시험" : "D+" + Math.abs(daysUntilDday) + " 시험";
	//   var testDdaySpan = createElement("span", "", testDdayText);
	   document.getElementById('dday-display').innerText = ddayText;
	//   testDdayDiv.appendChild(testDdaySpan);
	//    wrapper.appendChild(testDdayDiv);
	  }

//선택된 날짜를 저장
	    var selectedDate = moment("2024-03-20"); // 예시 선택된 날짜

	    // 선택된 날짜와 현재 날짜 사이의 차이를 계산
	    var daysUntilSelectedDate = selectedDate.diff(moment(), 'days');

	    // 표시된 D-day 번호를 업데이트
	    var ddayText = daysUntilSelectedDate >= 0 ? "D-" + daysUntilSelectedDate + " 시험" : "D+" + daysUntilSelectedDate + " 시험";
	    var ddaySpan = createElement("span", "", ddayText);
	    
	    events.forEach(function(ev) {
	        var div = createElement("div", "event");
	        var square = createElement("div", "event-category " + ev.color);
	        var span = createElement("span", "", ev.eventName);

	        div.appendChild(square);
	        div.appendChild(span);
	        wrapper.appendChild(div);
	    });
	    */
	    
</script>

<%@ include file="../common/foot.jspf"%>