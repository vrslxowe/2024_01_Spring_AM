<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Redirect Spotify"></c:set>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<%@ include file="../common/head.jspf"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<h1>Authorization Code: ${authorizationCode}</h1>

<script>
$(document).ready(function() {
    // Retrieve authorization code from URL query parameters
    var authorizationCode = new URLSearchParams(window.location.search).get('code');

    if (authorizationCode) {
        $.ajax({
            type: 'POST',
            url: 'https://kauth.kakao.com/oauth/token',
            data: {
                grant_type: 'authorization_code',
                client_id: 'aff99307eff2ec7502b8517da9477e04',
                redirect_uri: 'http://localhost:8081/usr/home/RedirectSpotify',
                code: authorizationCode
            },
            contentType: 'application/x-www-form-urlencoded;charset=utf-8',
            success: function(response) {
                // Handle successful response
                Kakao.Auth.setAccessToken(response.access_token);
                // If necessary, perform additional actions here
            },
            error: function(jqXHR, textStatus, errorThrown) {
                // Handle error response
                console.error('Error:', errorThrown);
            }
        });
    } else {
        console.error('Authorization code not found');
        // Handle case when authorization code is not present in URL
    }
});
</script>

<%@ include file="../common/foot.jspf"%>