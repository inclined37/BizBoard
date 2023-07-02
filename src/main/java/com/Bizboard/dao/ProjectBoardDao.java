package com.Bizboard.dao;

import java.util.List;
import java.util.Map;

import com.Bizboard.project.vo.JoinProjectSimpleData;
import com.Bizboard.project.vo.Project;
import com.Bizboard.project.vo.ProjectMember;

public interface ProjectBoardDao {
	
	//public int insertProjectAndMembers(Project project, List<ProjectMember> members);
	public int insertProjectAndMembers(Map<String, Object> params);
	
	public List<JoinProjectSimpleData> joinProjectSimpleDataList(int empno);
	
	public JoinProjectSimpleData JoinProjectSimpleOneData(int projectSeq);
	
}
