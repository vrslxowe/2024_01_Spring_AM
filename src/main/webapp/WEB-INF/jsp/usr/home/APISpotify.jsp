<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="API Spotify"></c:set>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<%@ include file="../common/head.jspf"%>
<a id="Spotify-login-btn" href="https://accounts.spotify.com/authorize?client_id=1440fd0b1217439f81573cf6470a1a51&response_type=code&redirect_uri=http://localhost:8081/usr/home/RedirectSpotify&scope=user-read-private user-read-email user-read-playback-state user-modify-playback-state streaming">
<img src="https://blog.kakaocdn.net/dn/b1jClb/btsFXY8xE1I/0ZYEE6bO5GscllLtZT3uh1/img.jpg" width="150"
/>스포티파이 로그인 버튼 </a>

<a id="kakao-login-btn" href="javascript:loginWithKakao()">
    <img src="https://blog.kakaocdn.net/dn/bmqXqj/btsFYN6qP5h/kPaI2XVZmxnkw8lWkeNIl0/img.jpg" width="150"
     />카카오 로그인 버튼</a>
  <p id="token-result"></p>

<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.0/kakao.min.js" integrity="sha384-l+xbElFSnPZ2rOaPrU//2FF5B4LB8FiX5q4fXYTlfcG4PGpMkE1vcL7kNXI6Cci0" crossorigin="anonymous"></script>
  <script>
    // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해야 합니다.
    Kakao.init('f43f5c71f57f935bcf3eb2d85337b7d9');

    // SDK 초기화 여부를 판단합니다.
    console.log(Kakao.isInitialized());
    
  //카카오 로그인 후 토근 값 저장.
    function loginWithKakao() {
        Kakao.Auth.login({
            success: function (authObj) {
                console.log(authObj); // access토큰 값
                Kakao.Auth.setAccessToken(authObj.access_token); // access토큰값 저장

                getInfo();
            },
            fail: function (err) {
                console.log(err);
            }
        });
    }
  
    // 엑세스 토큰을 발급받고, 아래 함수를 호출시켜서 사용자 정보를 받아옴.
    function getInfo() {
        Kakao.API.request({
            url: '/v2/user/me',
            success: function (res) {
                console.log(res);
                // 이메일, 닉네임
                var email = res.kakao_account.email;
                var profile_nickname = res.kakao_account.profile.nickname;

                console.log(email, profile_nickname);
            },
            fail: function (error) {
                alert('카카오 로그인에 실패했습니다. 관리자에게 문의하세요.' + JSON.stringify(error));
            }
        });
    }

    function loginWithKakao() {
      Kakao.Auth.authorize({
        redirectUri: 'http://localhost:8081/usr/home/RedirectSpotify',
      });
    }
    
 // 로그아웃 기능 - 카카오 서버에 접속하는 엑세스 토큰을 만료, 사용자 어플리케이션의 로그아웃은 따로 진행.
    function kakaoLogout() {
        if (!Kakao.Auth.getAccessToken()) {
            alert('Not logged in.');
            return;
        }
        Kakao.Auth.logout(function() {
            alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken());
        });
    }
    
  </script>

<%@ include file="../common/foot.jspf"%>