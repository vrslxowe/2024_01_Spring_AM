<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="API TEST"></c:set>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<%@ include file="../common/head.jspf"%>

<button onclick="authenticateAndLoadClient()">인증 및 로드</button>
<button onclick="execute()">실행</button>
<div id="searchResults"></div>

    <script src="https://apis.google.com/js/api.js"></script>
    <script>
        function authenticateAndLoadClient() {
            authenticate().then(loadClient);
        }

        function authenticate() {
            return gapi.auth2.getAuthInstance()
                .signIn({scope: "https://www.googleapis.com/auth/youtube.force-ssl"})
                .then(function() { console.log("Sign-in successful"); },
                      function(err) { console.error("Error signing in", err); });
        }

        function loadClient() {
            gapi.client.setApiKey("AIzaSyAnW6wrkzoAtz9y-G9oainLtxUruRV9kzE");
            return gapi.client.load("https://www.googleapis.com/discovery/v1/apis/youtube/v3/rest")
                .then(function() { console.log("GAPI client loaded for API"); },
                      function(err) { console.error("Error loading GAPI client for API", err); });
        }

        function execute() {
            return gapi.client.youtube.search.list({
                "maxResults": 5,
                "q": "riize",
                "type": [
                    "video"
                ]
            })
                .then(function(response) {
                    // Handle the results here (response.result has the parsed body).
                    console.log("Response", response);
                },
                function(err) { console.error("Execute error", err); });
        }

        gapi.load("client:auth2", function() {
            gapi.auth2.init({client_id: "1072992421270-13sb2i51ts3ti3fda94gq55qnkjvv1a2.apps.googleusercontent.com"});
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