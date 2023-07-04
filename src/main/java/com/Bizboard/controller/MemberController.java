package com.Bizboard.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Bizboard.project.vo.CreateProjectRequest;
import com.Bizboard.project.vo.JoinProjectSimpleData;
import com.Bizboard.project.vo.Project;
import com.Bizboard.project.vo.ProjectMember;
import com.Bizboard.project.vo.ProjectSchedule;
import com.Bizboard.service.FileStorageBoardService;
import com.Bizboard.service.MemberService;
import com.Bizboard.service.NoticeBoardService;
import com.Bizboard.service.ProjectBoardService;
import com.Bizboard.utils.FileUtils;
import com.Bizboard.vo.Board;
import com.Bizboard.vo.BoardFileJoin;
import com.Bizboard.vo.BoardJoinNoticeBoard;
import com.Bizboard.vo.MemberAllData;
import com.Bizboard.vo.NoticeBoard;

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

	@Autowired
	private ProjectBoardService projectBoardService;

	@GetMapping("main")
	public String mainGet(HttpSession session, Model model) {
		System.out.println("메인 진입!!!!!!!!!!!!!!!");
		int empno = (int) session.getAttribute("empno");
		System.out.println(empno);
		System.out.println("*********************");

		List<JoinProjectSimpleData> joinProjectSimpleDataList = projectBoardService.joinProjectSimpleDataList(empno);
		model.addAttribute("joinProjectSimpleDataList", joinProjectSimpleDataList);

		return "member/main";

	}

	// 공지사항 게시판 페이지 이동
	@GetMapping("noticeBoard")
	public void noticeBoardGet(@RequestParam(defaultValue = "1") int page, Model model) {
		int btCode = 1000;
		
		int totalBoard = noticeBoardService.getTotalNoticeBoardCount();
		int pageSize = 10;
	    int totalPage = (int) Math.ceil((double) totalBoard / pageSize); // 총 페이지 수
	    
	    if (page < 1) page = 1;
	    if (page > totalPage) page = totalPage;
	    int startRow = (page - 1) * pageSize;
	    
	    List<BoardJoinNoticeBoard> blist = noticeBoardService.selectAllNoticeBoard(btCode, startRow, pageSize);
		model.addAttribute("data", blist);
		model.addAttribute("totalBoard", totalBoard);
		model.addAttribute("currentPage", page);
	    model.addAttribute("totalPage", totalPage);
	}

	// 공지사항 글 상세보기 페이지 이동
	@GetMapping("noticeBoardDetail")
	public void noticeBoardDetailGet(int bcode, Model model) {
		BoardJoinNoticeBoard board = noticeBoardService.selectNoticeBoard(bcode);
		model.addAttribute("data", board);
	}
	
	//공지사항 글 수정
	@PostMapping("noticeBoardUpdate")
	public String noticeBoardUpdate(@ModelAttribute("data") BoardJoinNoticeBoard bjnboard) {
		System.out.println("noticeBoardUpdate POST 요청 진입");
		bjnboard.toString();
		noticeBoardService.updateNoticeBoard(bjnboard);
		return "redirect:/member/noticeBoardDetail?bcode="+bjnboard.getBcode();
	}
	
	//공지사항 글 삭제
	@GetMapping("noticeBoardDelete")
	public String noticeBoardDelete(int bcode) {
		System.out.println("noticeBoardDelete GET 요청 진입");
		noticeBoardService.deleteNoticeBoard(bcode);
		return "redirect:/member/noticeBoard";
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

	// 파일 글 수정하기
	@PostMapping("/FileBoardUpdate")
	public String fileBoardUpdate(
	    @RequestParam("bcode") int bcode,
	    @RequestParam("btitle") String btitle,
	    @RequestParam("bcontent") String bcontent,
	    @RequestParam(value = "file", required = false) MultipartFile file,
	    HttpServletRequest request
	) {
	    BoardFileJoin board = new BoardFileJoin();
	    board.setBcode(bcode);
	    board.setBtitle(btitle);
	    board.setBcontent(bcontent);

	    if (file != null && !file.isEmpty()) {
	        // 파일 업로드 로직 작성
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

	    int result = fileStorageBoardService.updateFileStorageBoard(board);

	    if (result > 0) {
	        return "redirect:/member/FileBoard";
	    } else {
	        return "error";
	    }
	}

	// 파일게시판 삭제
	@GetMapping("fileStorageBoardDelete")
	public String fileStorageBoardDelete(int bcode) {
		System.out.println("fileStorageBoardDelete GET 요청 진입");
		fileStorageBoardService.deleteFileStorageBoard(bcode);
		return "redirect:/member/FileBoard";
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

	@GetMapping("projectAdd")
	public void projectAdd() {

	}

	@PostMapping("createProject")
	public String createProject(CreateProjectRequest data) {

		Project project = new Project();
		List<ProjectMember> members = new ArrayList();

		// project - projectName , projectDescription
		project.setProjectName(data.getProjectName());
		project.setProjectDescription(data.getProjectDescription());
		project.setDeptno(data.getDeptno());
		project.setDeptname(data.getDeptname());
		project.setMembername(data.getMembername());

		List<Integer> requestData = data.getInvitedMembers();

		for (int i = 0; i < requestData.size(); i++) {
			ProjectMember projectMember = new ProjectMember();
			projectMember.setEmpno(requestData.get(i));
			members.add(projectMember);
		}

		System.out.println(requestData);
		System.out.println("***********************");
		System.out.println(members);

		projectBoardService.insertProjectAndMembers(project, members);

		return "redirect:/member/main";
	}

	@GetMapping("projectBoard")
	public String projectBoard(@RequestParam(defaultValue = "1") int page, int projectSeq, Model model, HttpSession session) {
	    System.out.println("****************");
	    int empno = (int) session.getAttribute("empno");
	    int totalSchedules = projectBoardService.getProjectScheduleCount(projectSeq);
	    System.out.println(projectSeq);
	    System.out.println("****************");
	    
	    JoinProjectSimpleData joinProjectSimpleData = projectBoardService.JoinProjectSimpleOneData(projectSeq, empno);
	    model.addAttribute("joinProjectSimpleData", joinProjectSimpleData);

	    int pageSize = 10;
	    int totalPage = (int) Math.ceil((double) totalSchedules / pageSize); // 총 페이지 수
	    
	    if (page < 1) page = 1;
	    if (page > totalPage) page = totalPage;
	    
	    int startRow = (page - 1) * pageSize;

	    List<ProjectSchedule> projectScheduleList = projectBoardService.projectScheduleList(projectSeq, startRow, pageSize);
	    model.addAttribute("projectScheduleList", projectScheduleList);
	    model.addAttribute("totalSchedules", totalSchedules);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPage", totalPage);
	    
	    return "member/projectBoard";
	}

	
    @GetMapping("/getProjectSchedules")
    @ResponseBody
    public ResponseEntity<List<ProjectSchedule>> getProjectSchedules(@RequestParam int projectSeq, HttpSession session) {
        int empno = (int) session.getAttribute("empno");
        List<ProjectSchedule> projectScheduleList = projectBoardService.projectScheduleListAll(projectSeq);
        return new ResponseEntity<>(projectScheduleList, HttpStatus.OK);
    }
	
	
	
	
	


	@GetMapping("projectBoardInsert")
	public String projectBoardInsert(int projectSeq, Model model) {

		/*
		 * int empno = (int)session.getAttribute("empno"); int deptno =
		 * (int)session.getAttribute("deptno"); String deptname =
		 * (String)session.getAttribute("deptname"); String membername =
		 * (String)session.getAttribute("membername");
		 * 
		 * System.out.println("*****************************");
		 * System.out.println("작성자 부서번호 : " + deptno); System.out.println("프로젝트 고유번호 : "
		 * +projectSeq); System.out.println("작성자 사원번호 : " +empno);
		 * System.out.println("작성자 부서명 : " + deptname); System.out.println("작성자 이름 : " +
		 * membername); System.out.println("*****************************");
		 */
		model.addAttribute("projectSeq", projectSeq);

		return "member/projectBoardInsert";
	}

	@PostMapping("projectBoardInsertOk")
	public String projectBoardInsertOk(ProjectSchedule projectSchedule, RedirectAttributes redirectAttributes) {

		System.out.println("**************************");
		System.out.println(projectSchedule);
		System.out.println("**************************");
		projectBoardService.insertProjectSchedule(projectSchedule);
		redirectAttributes.addAttribute("projectSeq", projectSchedule.getProjectSeq());

		return "redirect:/member/projectBoard";
	}

}
