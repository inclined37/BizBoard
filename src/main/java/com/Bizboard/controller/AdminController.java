package com.Bizboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Bizboard.service.NoticeBoardService;
import com.Bizboard.vo.Board;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired
	private NoticeBoardService noticeBoardService; 
	
	@GetMapping("main")
	public void main() {
		
	}
	
	@GetMapping("noticeBoardInsert")
	public void noticeBoard() {
		System.out.println("noticeBoardInsert 페이지 이동");
	}
	
	@PostMapping("noticeBoardInsert")
	public String noticeBoardInsert(Board board) {
		System.out.println("noticeBoardInsert POST 요청 진입");
		System.out.println(board.toString());
		
		int result = noticeBoardService.insertNoticeBoard(board);
		return "redirect:/member/noticeBoard";
	}
}
