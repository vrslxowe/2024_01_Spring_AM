package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsrAPITestController {

	@RequestMapping("/usr/home/APITest")
	public String APITest() {

		return "/usr/home/APITest";
	}
	
	@RequestMapping("/usr/home/APITest2")
	public String APITest2() {

		return "/usr/home/APITest2";
	}
	
	@RequestMapping("/usr/home/APITest3")
	public String APITest3() {

		return "/usr/home/APITest3";
	}
	
	@RequestMapping("/usr/home/APITest4")
	public String APITest4() {

		return "/usr/home/APITest4";
	}
	@RequestMapping("/usr/home/APITest5")
	public String APITest5() {

		return "/usr/home/APITest5";
	}
	
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

}