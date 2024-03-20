<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="API Spotify"></c:set>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<%@ include file="../common/head.jspf"%>
<a id="" href="https://accounts.spotify.com/authorize?client_id=1440fd0b1217439f81573cf6470a1a51&response_type=code&redirect_uri=http://localhost:8081/usr/home/RedirectSpotify&scope=user-read-private user-read-email user-read-playback-state user-modify-playback-state streaming">
스포티파이 로그인 버튼
</a>
    <a id="kakao-login-btn" href="javascript:loginWithKakao()">
    <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222"
      alt="카카오 로그인 버튼" />
  </a>
  <p id="token-result"></p>

<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.0/kakao.min.js" integrity="sha384-l+xbElFSnPZ2rOaPrU//2FF5B4LB8FiX5q4fXYTlfcG4PGpMkE1vcL7kNXI6Cci0" crossorigin="anonymous"></script>
  <script>
    // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해야 합니다.
    Kakao.init('f43f5c71f57f935bcf3eb2d85337b7d9');

    // SDK 초기화 여부를 판단합니다.
    console.log(Kakao.isInitialized());
    

    function loginWithKakao() {
      Kakao.Auth.authorize({
        redirectUri: 'http://localhost:8081/usr/home/RedirectSpotify',
      });
    }
    
  </script>

<%@ include file="../common/foot.jspf"%>