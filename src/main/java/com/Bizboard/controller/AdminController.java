package com.Bizboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Bizboard.service.MemberService;
import com.Bizboard.service.NoticeBoardService;
import com.Bizboard.vo.Board;
import com.Bizboard.vo.MemberAllData;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired
	private NoticeBoardService noticeBoardService; 
	@Autowired
	private MemberService memberService;
	
	@GetMapping("main")
	public void main() {
		
	}
	
	@GetMapping("noticeBoardInsert")
	public void noticeBoard() {
		System.out.println("noticeBoardInsert 페이지 이동");
	}
	
	@GetMapping("deptManagement")
	public void deptManagement() {
		
	}
	
	@PostMapping("noticeBoardInsert")
	public String noticeBoardInsert(Board board) {
		System.out.println("noticeBoardInsert POST 요청 진입");
		//사원의 추가정보 가져오기 -> 주입
		MemberAllData mad = memberService.getOneMemberData(board.getB_id());
		board.setB_name(mad.getMembername());
		board.setB_email(mad.getEmail());
		board.setB_dname(mad.getDname());
		System.out.println(board.toString());
		
		int result = noticeBoardService.insertNoticeBoard(board);
		return "redirect:/member/noticeBoard";
	}
	
	@GetMapping("memberManagement")
	public void memberManagement() {
		System.out.println("memberManagement 진입");
		//총사원수를 알고있어야함
		
		
		
	}

}
