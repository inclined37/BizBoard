package com.Bizboard.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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

	@Value("${file.upload.directory.fileBoard}")
	private String fileUploadDirectory;

	@GetMapping("main")
	public void mainGet() {

	}

	// 공지사항 게시판 페이지 이동
	@GetMapping("noticeBoard")
	public void noticeBoardGet(Model model) {
		int btCode = 1000;
		List<Board> blist = noticeBoardService.selectAllNoticeBoard(btCode);

		model.addAttribute("data", blist);
	}

	// 공지사항 글 상세보기 페이지 이동
	@GetMapping("noticeBoardDetail")
	public void noticeBoardDetailGet(int bcode, Model model) {
		Board board = noticeBoardService.selectNoticeBoard(bcode);
		model.addAttribute("data", board);
	}

	@GetMapping("AlbumBoard")
	public void albumBoardGet() {

	}

	// ====================================================================================================================================
	// 파일 게시판 리스트
	@RequestMapping("FileBoard")
	public void fileBoardGet(Model model) {
		int btCode = 2000;
		List<BoardFileJoin> blist = fileStorageBoardService.selectAllFileStorageBoard(btCode);
		model.addAttribute("data", blist);
	}

	// 파일 글 상세보기 페이지 이동
	@GetMapping("FileBoardDetail")
	public void fileBoardDetailGet(int bcode, Model model) {
		BoardFileJoin board = fileStorageBoardService.selectFileBoard(bcode);
		model.addAttribute("data", board);
	}

	// 파일 글 수정 페이지 이동
	@GetMapping("FileBoardUpdate")
	public void fileBoardUpdateGet(int bcode, Model model) {
		BoardFileJoin board = fileStorageBoardService.selectFileBoard(bcode);
		model.addAttribute("data", board);
	}

	@GetMapping("FileBoardInsert")
	public void fileBoard() {
		System.out.println("fileBoardInsert 페이지 이동");
	}

	@PostMapping("FileBoardInsert")
	public String fileBoardInsert(@RequestParam("file") MultipartFile file, BoardFileJoin board,
			HttpServletRequest request) {
		System.out.println("fileBoardInsert POST 요청 진입");

		// 파일 저장 로직 추가
		if (!file.isEmpty()) {
			String originalFilename = file.getOriginalFilename();
			// 파일 저장 로직을 추가하여 파일을 실제로 저장하고 저장된 파일명을 얻을 수 있습니다.
			String storedFilename = FileUtils.generateStoredFilename(originalFilename);
			String uploadpath = new File(request.getSession().getServletContext().getRealPath("")).getParent()
					+ fileUploadDirectory.replace("/", File.separator);
			FileUtils.createDirectory(uploadpath);

			String fileUploadPath = uploadpath + File.separator + storedFilename;
			File dest = new File(fileUploadPath);

			int fileSize = (int) file.getSize();

			try {
				file.transferTo(dest);
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

	@PostMapping("FileBoardUpdate")
	public String fileBoardUpdate(@RequestParam("bcontent") String updatedContent, @RequestParam("bcode") int bcode) {
		// bcode를 사용하여 해당 글을 데이터베이스에서 조회하고, 업데이트할 내용을 설정합니다.
		BoardFileJoin board = fileStorageBoardService.selectFileBoard(bcode);
		board.setBcontent(updatedContent);

		// 데이터베이스에 업데이트
		fileStorageBoardService.updateFileStorageBoard(board);

		// 리스트 페이지로 리다이렉트
		return "redirect:/member/FileBoard";
	}

	// =================================================================================================================================
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
