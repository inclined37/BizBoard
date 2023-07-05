package com.Bizboard.project.vo;

import lombok.Data;

public class ProjectMember {
	// view 페이지에서 넘어온 사원 수만큼 db에 insert 
	
    private int projectSeq;		// 프로젝트 고유번호
    private int empno;			// 초대받은 사원번호
	public int getProjectSeq() {
		return projectSeq;
	}
	public void setProjectSeq(int projectSeq) {
		this.projectSeq = projectSeq;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
    
}
