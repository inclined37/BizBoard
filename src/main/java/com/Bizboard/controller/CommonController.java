package com.Bizboard.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.Bizboard.service.AdminService;
import com.Bizboard.service.MemberService;
import com.Bizboard.utils.FileUtils;
import com.Bizboard.vo.Dept;
import com.Bizboard.vo.Members;
import com.Bizboard.vo.MembersDetail;

@Controller
@RequestMapping("/common/*")
public class CommonController {

	@Autowired
	private MemberService memberService;

	
	@Autowired
	private AdminService adminService;

	// 로컬
	@Value("${file.upload.directory.profile}")
	private String uploadDirectory;

	@GetMapping("login")
	public void login() {
		System.out.println("login 페이지 이동");
	}

	@GetMapping("signup")

	public void signup(Model model) {
		
		List<Dept> deptList= adminService.getDeptList();
		
		//부서목록
		model.addAttribute("deptList", deptList);
		

	}
	/* 로컬
	@PostMapping("signup")
	public String signup(@RequestParam("file") MultipartFile file, Members members, MembersDetail membersDetail,
			HttpServletRequest request) {
		if (!file.isEmpty()) {
			try {
				// 파일 업로드 처리
				String originalFilename = file.getOriginalFilename();
				String storedFilename = FileUtils.generateStoredFilename(originalFilename);
				//경로 : C:\Duzon\Spring\SpringBootLabs\BizBoard\src\main\webapp\
				
				String path="/temp";

				ServletContext context= request.getSession().getServletContext();

				String realPath=context.getRealPath(path);
				System.out.println("업로드시 경로 : "+realPath);
				
				
				
				String uploadpath = new File(request.getSession().getServletContext().getRealPath(""))
						+ uploadDirectory.replace("/", File.separator); // File.separator "\"를 나타냄
				System.out.println(uploadpath);
				// 해당 폴더가 없을 경우 생성
				FileUtils.createDirectory(uploadpath);
				
				String fileUploadPath = uploadpath + File.separator + storedFilename;
				File dest = new File(fileUploadPath);
				file.transferTo(dest);

				// MembersDetail 객체에 파일 정보 설정
				membersDetail.setFileOriginalName(originalFilename);
				membersDetail.setFileStoredName(storedFilename);
				membersDetail.setFilePath(uploadDirectory);
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}

		System.out.println(members);
		System.out.println(membersDetail);

		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		members.setPassword(bCryptPasswordEncoder.encode(members.getPassword()));

		memberService.memberInsert(members, membersDetail);

		return "common/main";
	}
	*/
	@PostMapping("signup")
	public String signup(@RequestParam("file") MultipartFile file, Members members, MembersDetail membersDetail,
	                     HttpServletRequest request) {
	    if (!file.isEmpty()) {
	        try {
	            // 파일 업로드 처리
	            String originalFilename = file.getOriginalFilename();
	            String storedFilename = FileUtils.generateStoredFilename(originalFilename);

	            // 업로드 디렉터리 설정
	            String uploadDirectory = "/home/ubuntu/war/upload/profile";

	            // 해당 폴더가 없을 경우 생성
	            FileUtils.createDirectory(uploadDirectory);

	            String fileUploadPath = uploadDirectory + File.separator + storedFilename;
	            File dest = new File(fileUploadPath);
	            file.transferTo(dest);

	            // MembersDetail 객체에 파일 정보 설정
	            membersDetail.setFileOriginalName(originalFilename);
	            membersDetail.setFileStoredName(storedFilename);
	            membersDetail.setFilePath(uploadDirectory);
	        } catch (IOException e) {
	            System.out.println(e.getMessage());
	        }
	    }

	    System.out.println(members);
	    System.out.println(membersDetail);

	    BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
	    members.setPassword(bCryptPasswordEncoder.encode(members.getPassword()));

	    memberService.memberInsert(members, membersDetail);

	    return "member/main";
	}
	@GetMapping("index")
	public String ager() {
		
		return "common/index";
	}
	@GetMapping
	public String test2() {
		
		return "common/test";
	}
	
}
