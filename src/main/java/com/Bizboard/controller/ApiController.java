package com.Bizboard.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.Bizboard.service.AdminService;
import com.Bizboard.service.MemberService;
import com.Bizboard.service.NoticeBoardService;
import com.Bizboard.vo.Board;
import com.Bizboard.vo.BoardJoinNoticeBoard;
import com.Bizboard.vo.Dept;
import com.Bizboard.vo.MemberAllData;
import com.Bizboard.vo.MemberSearchData;
import com.Bizboard.vo.Members;

@RestController
@RequestMapping("/api/*")
public class ApiController {

	@Autowired
	private AdminService adminService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private NoticeBoardService noticeBoardService;

	@GetMapping("deptList")
	public ResponseEntity<?> deptList() {
		Object deptList = adminService.getDeptList(); // JSON으로 반환될 데이터 List, Map
		return new ResponseEntity<>(deptList, HttpStatus.OK); // Object를 JSON으로 반환
	}

	@PostMapping("deptInsert")
	public ResponseEntity<?> deptInsert(@RequestBody Dept dept) {
		int result = adminService.deptInsert(dept);

		System.out.println("*************************");
		System.out.println(result);
		System.out.println("*************************");

		return new ResponseEntity<>(result, HttpStatus.OK);
	}

	@PostMapping("deptUpdate")
	public ResponseEntity<?> deptUpdate(@RequestBody Dept dept) {
		// int result = adminService.deptInsert(dept);

		System.out.println("*************************");
		System.out.println(dept);
		System.out.println("*************************");
		int result = adminService.deptUpdate(dept);
		return new ResponseEntity<>(result, HttpStatus.OK);
	}

	@PostMapping("memberSearch")
	public ResponseEntity<?> memberSearchList(@RequestBody MemberSearchData memberSearchData) {
		// 회원 검색결과 리스트 를 반환해야함
		System.out.println(memberSearchData);
		List<MemberAllData> list = adminService.getMemberAllData(memberSearchData);

		return new ResponseEntity<>(list, HttpStatus.OK);
	}

	@PostMapping("checkId")
	public ResponseEntity<?> checkId(@RequestBody Members members) {
		System.out.println("userid" + members.getUserid());
		int result = memberService.idChk(members);

		return new ResponseEntity<String>(String.valueOf(result), HttpStatus.OK);
	}

	// 공지사항 게시글 전체 리스트
	@GetMapping("getAllNoticeBoard")
	public ResponseEntity<?> getNoticeBoardList(@RequestParam(defaultValue = "1") int page, Model model) {
		System.out.println("API 게시글 전체 리스트 반환 GET 요청 진입"); 
		int btcode = 1000;
		  
		int totalBoard = noticeBoardService.getTotalNoticeBoardCount(); 
		int pageSize = 10; 
		int totalPage = (int) Math.ceil((double) totalBoard / pageSize); // 총 페이지 수
		  
		if (page < 1) page = 1; 
		if (page > totalPage) page = totalPage; 
		int startRow = (page - 1) * pageSize;
		  
		List<BoardJoinNoticeBoard> blist = noticeBoardService.selectAllNoticeBoard(btcode, startRow, pageSize);
		  
		model.addAttribute("data", blist); 
		model.addAttribute("totalBoard",totalBoard); 
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", totalPage);
		  
		return new ResponseEntity<List>(blist, HttpStatus.OK); 
	}

	// 공지사항 게시글 검색 기능
	@PostMapping("noticeBoardSearch")
	@ResponseBody 
	public ResponseEntity<?> noticeBoardSearchList(@RequestParam(defaultValue = "1") int page,
			@RequestBody Map<String, String> searchRequest, Model model) {
		System.out.println("공지사항 게시글 검색 POST 요청 진입"); 
		int btcode = 1000; 
		String searchOption = searchRequest.get("option"); 
		String searchKeyword = searchRequest.get("keyword");
	  
		int totalBoard = noticeBoardService.selectNoticeBoardCountByValue(searchOption, searchKeyword, btcode); 
		int pageSize = 10; 
		int totalPage = (int) Math.ceil((double)totalBoard / pageSize); // 총 페이지 수
	  
		if (page < 1) page = 1; 
		if (page > totalPage) page = totalPage; 
		int startRow = (page - 1) * pageSize;
		
		List<BoardJoinNoticeBoard> blist = noticeBoardService.selectAllNoticeBoardByValue(searchOption, searchKeyword, btcode, startRow, pageSize); 
		model.addAttribute("data", blist);
		model.addAttribute("totalBoard", totalBoard);
		model.addAttribute("currentPage", page); 
		model.addAttribute("totalPage", totalPage); 
		return new ResponseEntity<List>(blist, HttpStatus.OK);
	}
	 

}
