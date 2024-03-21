package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UsrAPISpotipyController {
	
	@RequestMapping("/usr/home/APISpotify")
	public String APISpotify() {

		
		return "/usr/home/APISpotify";
	}
	
//	@RequestMapping("/usr/home/RedirectSpotify")
//	public String RedirectSpotify() {
//
//		
//		return "/usr/home/RedirectSpotify";
//	}
//	
	@RequestMapping("/usr/home/RedirectSpotify")
    public String RedirectSpotify(@RequestParam("code") String authorizationCode, Model model) {
        // Pass the authorization code to the page
        model.addAttribute("authorizationCode", authorizationCode);
        
        return "/usr/home/RedirectSpotify";
    }
//	@RequestMapping("/usr/home/RedirectSpotify")
//	public String RedirectSpotify(@RequestParam String code, Model model) {
//		System.err.println("code name : " + code);
//		
//		model.addAttribute("code", code);
//		
//		return "/usr/home/RedirectSpotify";
//	}
	
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
