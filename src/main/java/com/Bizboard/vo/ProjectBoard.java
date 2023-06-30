package com.Bizboard.vo;

import java.util.List;

import lombok.Data;

@Data
public class ProjectBoard {

	private String projectName; // 프로젝트명
	private String projectDescription; // 프로젝트 내용
	private int projectSeq;				// 프로젝트의 고유번호
	private List<Integer> invitedMembers; // 초대받은 멤버의 사원번호
	
}
