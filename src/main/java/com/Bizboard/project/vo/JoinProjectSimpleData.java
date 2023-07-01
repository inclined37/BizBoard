package com.Bizboard.project.vo;

import lombok.Data;

@Data
public class JoinProjectSimpleData {

    private int projectSeq; 			// 프로젝트 고유번호
    private String empno;				// 프로젝트를 생성한 사원번호
    private String deptno;			// 프로젝트를 생성한 사원의 부서번호
    private String deptname;			// 프로젝트를 생성한 사원의 부서이름
    private String membername;			// 프로젝트를 생성한 사원의 이름
    private String projectName;			// 프로젝트 명
    private String projectDescription;	// 프로젝트 내용
    private int memberCount;			// 프로젝트의 참가중인 인원수
	
	
}
