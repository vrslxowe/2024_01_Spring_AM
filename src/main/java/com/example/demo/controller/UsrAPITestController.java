package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsrAPITestController {

	@RequestMapping("/usr/home/APIYoutube")
	public String APIYoutube() {

		return "/usr/home/APIYoutube";
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
	
	@RequestMapping("/usr/home/APITest6")
	public String APITest6() {

		return "/usr/home/APITest6";
	}
	
}