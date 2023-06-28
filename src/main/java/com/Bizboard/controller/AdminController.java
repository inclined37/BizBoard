package com.Bizboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	
	
	@GetMapping("main")
	public void main() {
		
	}
	
	@GetMapping("noticeBoardInsert")
	public void noticeBoard() {
		
	}
	
	@GetMapping("deptManagement")
	public void deptManagement() {
		
	}
	
}
