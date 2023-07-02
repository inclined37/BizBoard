package com.Bizboard.project.vo;

import java.util.List;

import lombok.Data;

@Data
public class CreateProjectRequest { 
	// member/projectAdd 에서 온 post 요청을 받기위한 클래스
	
	
	private String projectName; // 프로젝트명
	private String projectDescription; // 프로젝트 내용
	private List<Integer> invitedMembers; // 초대받은 멤버의 사원번호
    private String deptno;			// 프로젝트를 생성한 사원의 부서번호
    private String deptname;			// 프로젝트를 생성한 사원의 부서이름
    private String membername;			// 프로젝트를 생성한 사원의 이름
	
}
