package com.Bizboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	
	@GetMapping("main")
	public void mainGet() {

	}
	
	@GetMapping("noticeBoard")
	public void noticeBoardGet() {
		
	}
	
	@GetMapping("AlbumBoard")
	public void albumBoardGet() {
		
	}
	
	@GetMapping("FileBoard")
	public void fileBoardGet() {
		
	}
	
}
