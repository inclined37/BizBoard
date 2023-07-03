package com.Bizboard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.Bizboard.project.vo.JoinProjectSimpleData;
import com.Bizboard.project.vo.Project;
import com.Bizboard.project.vo.ProjectMember;
import com.Bizboard.project.vo.ProjectSchedule;

public interface ProjectBoardDao {
	
	public int insertProjectAndMembers(Map<String, Object> params); // 프로젝트 생성
	
	public List<JoinProjectSimpleData> joinProjectSimpleDataList(int empno); // 모든 프로젝트 정보
	
	public JoinProjectSimpleData JoinProjectSimpleOneData(int projectSeq, int empno); // 한개의 프로젝트 정보
	
	public int insertProjectSchedule(ProjectSchedule projectSchedule); // 생성된 프로젝트의 일정삽입
	
	public List<ProjectSchedule> projectScheduleListAll(int projectSeq); // 한개의 프로젝트 안에 있는 모든 일정 정보
	
	public List<ProjectSchedule> projectScheduleList(@Param("projectSeq")int projectSeq ,@Param("startRow") int startRow, @Param("pageSize") int pageSize);

	public int getProjectScheduleCount(int projectSeq);
	
}
