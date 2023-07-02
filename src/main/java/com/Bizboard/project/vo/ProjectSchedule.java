package com.Bizboard.project.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ProjectSchedule {
    private int scheduleId;		// 스케쥴 고유번호
    private int projectSeq;		// 프로젝트 고유번호
    private int empno;		// 작성자 사원번호
    private String deptno;		// 작성자 부서번호
    private String deptname;	// 작성자 부서명
    private String membername;	// 작성자 이름
    private String title;		// 제목
    private String description;	// 내용
    private Date startDate;		// 시작일
    private Date endDate;		// 종료일
}
