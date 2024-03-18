package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsrTestController {
	
	@RequestMapping("/usr/home/TestMain")
	public String TestMain() {

		return "/usr/home/TestMain";
	}
	
	@RequestMapping("/usr/home/TestProfile")
	public String TestProfile() {

		return "/usr/home/TestProfile";
	}
	
	@RequestMapping("/usr/home/TestWrite")
	public String TestWrite() {

		return "/usr/home/TestWrite";
	}
	
	@RequestMapping("/usr/home/TestLogin")
	public String TestLogin() {

		return "/usr/home/TestLogin";
	}
	
	@RequestMapping("/usr/home/TestJoin")
	public String TestJoin() {

		return "/usr/home/TestJoin";
	}

	@RequestMapping("/usr/home/TestDetail")
	public String TestDetail() {

		return "/usr/home/TestDetail";
	}
	
	@RequestMapping("/usr/home/TestSetting")
	public String TestSetting() {

		return "/usr/home/TestSetting";
	}
}