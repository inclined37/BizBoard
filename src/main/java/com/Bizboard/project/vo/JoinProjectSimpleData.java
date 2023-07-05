package com.Bizboard.project.vo;

import lombok.Data;

public class JoinProjectSimpleData {

    private int projectSeq; 			// 프로젝트 고유번호
    private String empno;				// 프로젝트를 생성한 사원번호
    private String deptno;			// 프로젝트를 생성한 사원의 부서번호
    private String deptname;			// 프로젝트를 생성한 사원의 부서이름
    private String membername;			// 프로젝트를 생성한 사원의 이름
    private String projectName;			// 프로젝트 명
    private String projectDescription;	// 프로젝트 내용
    private int memberCount;			// 프로젝트의 참가중인 인원수
	public int getProjectSeq() {
		return projectSeq;
	}
	public void setProjectSeq(int projectSeq) {
		this.projectSeq = projectSeq;
	}
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public String getDeptno() {
		return deptno;
	}
	public void setDeptno(String deptno) {
		this.deptno = deptno;
	}
	public String getDeptname() {
		return deptname;
	}
	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}
	public String getMembername() {
		return membername;
	}
	public void setMembername(String membername) {
		this.membername = membername;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getProjectDescription() {
		return projectDescription;
	}
	public void setProjectDescription(String projectDescription) {
		this.projectDescription = projectDescription;
	}
	public int getMemberCount() {
		return memberCount;
	}
	public void setMemberCount(int memberCount) {
		this.memberCount = memberCount;
	}
	
	
}
