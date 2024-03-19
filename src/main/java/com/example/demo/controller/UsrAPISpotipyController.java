package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsrAPISpotipyController {
	
	@RequestMapping("/usr/home/APISpotify")
	public String APISpotify() {

		
		return "/usr/home/APISpotify";
	}
	
	@RequestMapping("/usr/home/RedirectSpotify")
	public String RedirectSpotify() {

		
		return "/usr/home/RedirectSpotify";
	}
	
//	@GetMapping("/RedirectSpotify")
//	public ModelAndView RedirectSpotify(
//	        @RequestParam("client_id") String clientId,
//	        @RequestParam("response_type") String responseType,
//	        @RequestParam("scope") String scope) {
//
//	    // 리디렉션 URI 설정
//	    String redirectUri = "http://localhost:8081/usr/home/RedirectSpotify";
//
//	    // Spotify의 로그인 페이지로 리디렉션합니다.
//	    return new ModelAndView("redirect:" + "https://accounts.spotify.com/authorize"
//	            + "?client_id=" + clientId
//	            + "&response_type=" + responseType
//	            + "&redirect_uri=" + redirectUri
//	            + "&scope=" + scope);
//	}
}
