<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="API Youtube"></c:set>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://apis.google.com/js/api.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="1072992421270-13sb2i51ts3ti3fda94gq55qnkjvv1a2.apps.googleusercontent.com">

<%@ include file="../common/head.jspf"%>

<button onclick="authenticateAndLoadClient()">인증 및 로드</button>
<button onclick="execute()">실행</button>
<div id="searchResults">검색결과</div>
<div id="errorMessage">에러</div>
<div id="apiData">1</div> <!-- New div to display API data -->
<div class="g-signin2" data-onsuccess="onSignIn"></div>
<a href="#" onclick="signOut();">Sign out</a>

    <script src="https://accounts.google.com/gsi/client" async defer></script>
    <div id="g_id_onload"
         data-client_id="1072992421270-13sb2i51ts3ti3fda94gq55qnkjvv1a2.apps.googleusercontent.com"
         data-callback="handleCredentialResponse">
    </div>
    <div class="g_id_signin" data-type="standard"></div>

<!-- content에 자신의 OAuth2.0 클라이언트ID를 넣습니다. -->
<meta name ="google-signin-client_id" content="1072992421270-13sb2i51ts3ti3fda94gq55qnkjvv1a2.apps.googleusercontent.com">

<ul>
 <li id="GgCustomLogin">
  <a href="javascript:void(0)">
   <span>Login with 구글</span>
  </a>
 </li>
</ul>
<!-- 구글 api 사용을 위한 스크립트 -->
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>

<script>

//처음 실행하는 함수
function init() {
	gapi.load('auth2', function() {
		gapi.auth2.init();
		options = new gapi.auth2.SigninOptionsBuilder();
		options.setPrompt('select_account');
        // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
		options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
        // 인스턴스의 함수 호출 - element에 로그인 기능 추가
        // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
		gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
	})
}

function onSignIn(googleUser) {
	var access_token = googleUser.getAuthResponse().access_token
	$.ajax({
    	// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
		url: 'https://people.googleapis.com/v1/people/me'
        // key에 자신의 API 키를 넣습니다.
		, data: {personFields:'birthdays', key:'AIzaSyBOdmeC4SOSzXmPGLEM2vZueqiBSWKg3wk', 'access_token': access_token}
		, method:'GET'
	})
	.done(function(e){
        //프로필을 가져온다.
		var profile = googleUser.getBasicProfile();
		console.log(profile)
	})
	.fail(function(e){
		console.log(e);
	})
}
function onSignInFailure(t){		
	console.log(t);
}


function onSignIn(googleUser) {
    var profile = googleUser.getBasicProfile();
    console.log('ID: ' + profile.getId());
    console.log('Name: ' + profile.getName());
    console.log('Image URL: ' + profile.getImageUrl());
    console.log('Email: ' + profile.getEmail());
}

function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
        console.log('User signed out.');
    });
}


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
            "q": "nct wish",
            "type": ["video"]
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
            // Handle API error
            console.error("실행 오류", err);
            
            // Update an element on the page with the error message
            const errorElement = document.getElementById("errorMessage");
            errorElement.textContent = "API 호출 중 오류가 발생했습니다: " + err.message;
        });
    }

    // 클라이언트 및 인증 로드
    gapi.load("client:auth2", function() {
        gapi.auth2.init({client_id: "1072992421270-13sb2i51ts3ti3fda94gq55qnkjvv1a2.apps.googleusercontent.com"})
        .then(function() {
            // 클라이언트 및 인증이 로드되면 실행
            execute();
        })
        .catch(function(err) {
            console.error("클라이언트 및 인증 로드 오류", err);
        });
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