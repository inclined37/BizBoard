package com.Bizboard.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.Bizboard.service.FileStorageBoardService;
import com.Bizboard.service.MemberService;
import com.Bizboard.service.NoticeBoardService;
import com.Bizboard.utils.FileUtils;
import com.Bizboard.vo.Board;
import com.Bizboard.vo.BoardFileJoin;
import com.Bizboard.vo.MemberAllData;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private NoticeBoardService noticeBoardService;

	@Autowired
	private FileStorageBoardService fileStorageBoardService;


	
	

	@GetMapping("main")
	public void mainGet() {

	}
	
	//공지사항 게시판 페이지 이동
	@RequestMapping("noticeBoard")
	public void noticeBoardGet(Model model) {
		int btCode = 1000;
		List<Board> blist = noticeBoardService.selectAllNoticeBoard(btCode);
			
		model.addAttribute("data", blist);
	}
	
	//공지사항 글 상세보기 페이지 이동
	@GetMapping("noticeBoardDetail")
	public void noticeBoardDetailGet(int bcode, Model model) {
		Board board = noticeBoardService.selectNoticeBoard(bcode);
		
		model.addAttribute("data", board);
	}
	
	@GetMapping("AlbumBoard")
	public void albumBoardGet() {
		
	}
	
	//파일 게시판 리스트
	@RequestMapping("FileBoard")
	public void fileBoardGet(Model model) {
		int btCode = 2000;
		List<BoardFileJoin> blist = fileStorageBoardService.selectAllFileStorageBoard(btCode);
		System.out.println(blist.get(0));
			
		model.addAttribute("data", blist);
	}
	
	@GetMapping("FileBoardInsert")
	public void fileBoard() {
		System.out.println("fileBoardInsert 페이지 이동");
	}
	
	@PostMapping("FileBoardInsert")
	public String fileBoardInsert(@RequestParam("file") MultipartFile file, BoardFileJoin board) {
		System.out.println("fileBoardInsert POST 요청 진입");

		// 파일 저장 로직 추가
		if (!file.isEmpty()) {
		    String originalFilename = file.getOriginalFilename();
		    // 파일 저장 로직을 추가하여 파일을 실제로 저장하고 저장된 파일명을 얻을 수 있습니다.
		    String storedFilename = FileUtils.generateStoredFilename(originalFilename);
		    int fileSize = (int) file.getSize();

		    // 파일 저장 로직 추가
		    File savedFile = new File("D:\\Douzone\\Spring\\SpringBootLabs\\Bizboard\\src\\main\\resources\\static\\uploads\\file\\" + storedFilename);
	        try {
	            file.transferTo(savedFile);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	        
		    // 게시물 객체에 파일 정보 설정
		    board.setFbOriginfile(originalFilename);
		    board.setFbSavedfile(storedFilename);
		    board.setFbFilesize(fileSize);
		}
		
		
		// 사원의 추가정보 가져오기 -> 주입
		MemberAllData mad = memberService.getOneMemberData(board.getBid());
		board.setBname(mad.getMembername());
		board.setBemail(mad.getEmail());
		board.setBdname(mad.getDname());
		System.out.println(board.toString());
		
		fileStorageBoardService.insertFileStorageBoard(board);
		return "redirect:/member/FileBoard";
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
