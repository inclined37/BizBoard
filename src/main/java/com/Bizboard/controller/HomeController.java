package com.Bizboard.controller;


import javax.servlet.http.HttpSession;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	@GetMapping("/")
	public String main(HttpSession session) {
		
		String result = (String) session.getAttribute("deptname");
		
		if(result == null) {
			
			return "common/login";
		}else {
			
			return "common/main";
		}
		
	}
}
