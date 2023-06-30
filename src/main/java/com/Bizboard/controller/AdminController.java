package com.Bizboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Bizboard.service.AdminService;
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
	private AdminService adminService;
	
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

		MemberAllData mad = memberService.getOneMemberData(board.getBid());
		board.setBname(mad.getMembername());
		board.setBemail(mad.getEmail());
		board.setBdname(mad.getDname());

		System.out.println(board.toString());
		
		int result = noticeBoardService.insertNoticeBoard(board);
		return "redirect:/member/noticeBoard";
	}
	
	@GetMapping("memberManagement")
	public String memberManagement(Model model, @RequestParam(defaultValue = "1") int page) {
	    System.out.println("memberManagement 진입");
	    // 총사원수를 알고있어야함
	    int totalMemberCount = adminService.getTotalMemberCount();
	    System.out.println(totalMemberCount);
	    model.addAttribute("totalMemberCount", totalMemberCount);
	    
	    int pageSize = 5; // 페이지 크기
	    int totalPage = (int) Math.ceil((double) totalMemberCount / pageSize); // 총 페이지 수
	    
	    if (page < 1) page = 1;
	    if (page > totalPage) page = totalPage;
	    
	    int startRow = (page - 1) * pageSize; // 시작 행
	    
	    List<MemberAllData> list = adminService.getMemberAllDataPagingList(startRow, pageSize);
	    System.out.println(list);
	    model.addAttribute("memberList", list);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPage", totalPage);
	    
	    return "admin/memberManagement";

	}


}
