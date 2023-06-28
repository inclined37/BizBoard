package com.Bizboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Bizboard.service.MemberService;
import com.Bizboard.vo.MemberAllData;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	
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
	
	@GetMapping("searchResult")
	public void searchResult() {
		
	}
	
	@GetMapping("myInfo")
	public void myInfo(@AuthenticationPrincipal UserDetails user, Model model) {
		System.out.println(user.getUsername());// 회원의 아이디 정보 
		MemberAllData result = memberService.getOneMemberData(user.getUsername());
		model.addAttribute("memberData", result);
		
		
	}
	
}
