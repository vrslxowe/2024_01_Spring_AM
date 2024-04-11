<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="API Youtube"></c:set>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://apis.google.com/js/api.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="1072992421270-13sb2i51ts3ti3fda94gq55qnkjvv1a2.apps.googleusercontent.com">

<%@ include file="../common/head.jspf"%>

<title>YouTube Channel Information</title>
</head>
<body>
<div id="channelInfo"></div>

<script>
// API 키
const apiKey = 'AIzaSyAnW6wrkzoAtz9y-G9oainLtxUruRV9kzE';

// 채널 ID
const channelId = 'barbelloper'; 

// 채널 정보를 가져오는 URL
const channelsUrl = 'https://www.googleapis.com/youtube/v3/channels?key=' + apiKey + '&id=' + channelId + '&part=snippet,contentDetails,statistics';

// fetch를 사용하여 데이터를 가져오고 처리합니다.
fetch(channelsUrl)
  .then(res => res.json())
  .then(data => {
    if (data.items && data.items.length > 0) {
      const channelInfoDiv = document.getElementById('channelInfo');
      const snippet = data.items[0].snippet;
      const statistics = data.items[0].statistics;

      // 채널 정보를 표시합니다.
      channelInfoDiv.innerHTML = `
        <h1>${snippet.title}</h1>
        <p>${snippet.description}</p>
        <p>구독자 수: ${statistics.subscriberCount}</p>
        <p>총 조회수: ${statistics.viewCount}</p>
        <p>업로드된 동영상 수: ${statistics.videoCount}</p>
      `;
    } else {
      console.error('API 응답에 유효한 데이터가 없습니다.');
    }
  })
  .catch(error => {
    console.error('API 요청에 실패했습니다:', error);
  });
</script>




<%@ include file="../common/foot.jspf"%>