package com.Bizboard.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Bizboard.service.MemberService;
import com.Bizboard.service.NoticeBoardService;
import com.Bizboard.vo.Board;
import com.Bizboard.vo.MemberAllData;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private NoticeBoardService noticeBoardService;
	
	
	@GetMapping("main")
	public void mainGet() {

	}
	
	//공지사항 게시판 페이지 이동
	@RequestMapping("noticeBoard")
	public void noticeBoardGet(Model model) {
		int btCode = 1000;
		List<Board> blist = noticeBoardService.selectAllNoticeBoard(btCode);
		System.out.println(blist.get(0));
			
		model.addAttribute("data", blist);
	}
	
	@GetMapping("AlbumBoard")
	public void albumBoardGet() {
		
	}
	
	@GetMapping("FileBoard")
	public void fileBoardGet() {
	
	}
	
	@GetMapping("FileBoardInsert")
	public void fileBoardInsert() {
	
	}
	
	@GetMapping("searchResult")
	public void searchResult() {
		
	}
	
	@GetMapping("myInfo")
	public void myInfo(@AuthenticationPrincipal UserDetails user, Model model) {
		System.out.println(user.getUsername());// 회원의 아이디 정보 
		MemberAllData result = memberService.getOneMemberData(user.getUsername());
		System.out.println(result);
		model.addAttribute("memberData", result);
		
		
	}
	
}
