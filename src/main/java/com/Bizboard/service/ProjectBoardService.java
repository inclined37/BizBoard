package com.Bizboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Bizboard.dao.ProjectBoardDao;
import com.Bizboard.project.vo.JoinProjectSimpleData;
import com.Bizboard.project.vo.Project;
import com.Bizboard.project.vo.ProjectMember;
import com.Bizboard.project.vo.ProjectSchedule;

@Service
public class ProjectBoardService {

    @Autowired
    private SqlSession sqlSession;
    
    public int insertProjectAndMembers(Project project, List<ProjectMember> members) {
    	ProjectBoardDao dao = sqlSession.getMapper(ProjectBoardDao.class);
        Map<String, Object> params = new HashMap<>();
        params.put("project", project);
        params.put("members", members);
    	
    	return dao.insertProjectAndMembers(params);
    }
    
    public List<JoinProjectSimpleData> joinProjectSimpleDataList(int empno){
    	ProjectBoardDao dao = sqlSession.getMapper(ProjectBoardDao.class);
    	List<JoinProjectSimpleData> result = dao.joinProjectSimpleDataList(empno); 
    	
    	return result;
    }; 
    
    public JoinProjectSimpleData JoinProjectSimpleOneData(int projectSeq,int empno) {
    	ProjectBoardDao dao = sqlSession.getMapper(ProjectBoardDao.class);
    	JoinProjectSimpleData result = dao.JoinProjectSimpleOneData(projectSeq,empno);
    	
    	return result;
    }
    
	public int insertProjectSchedule(ProjectSchedule projectSchedule) {
		ProjectBoardDao dao = sqlSession.getMapper(ProjectBoardDao.class);
		int result = dao.insertProjectSchedule(projectSchedule);
		
		return result;
	}
    
	public List<ProjectSchedule> projectScheduleListAll(int projectSeq){
		ProjectBoardDao dao = sqlSession.getMapper(ProjectBoardDao.class);
		List<ProjectSchedule> result = dao.projectScheduleListAll(projectSeq);
		
		return result;
	}
	public List<ProjectSchedule> projectScheduleList(int projectSeq, int startRow, int pageSize) {
	    ProjectBoardDao dao = sqlSession.getMapper(ProjectBoardDao.class);
	    List<ProjectSchedule> result = dao.projectScheduleList(projectSeq,startRow,pageSize);
	    return result;
	}

	public int getProjectScheduleCount(int projectSeq) {
		ProjectBoardDao dao = sqlSession.getMapper(ProjectBoardDao.class);
		int result = dao.getProjectScheduleCount(projectSeq);
		
		return result;
	}
	
	public ProjectSchedule getOneProjectSchedule(int scheduleId) {
		ProjectBoardDao dao = sqlSession.getMapper(ProjectBoardDao.class);
		ProjectSchedule result = dao.getOneProjectSchedule(scheduleId);
		
		return result;
	}
	
	public int oneProjectScheduleUpdate(ProjectSchedule projectSchedule) {
		ProjectBoardDao dao = sqlSession.getMapper(ProjectBoardDao.class);
		int result = dao.oneProjectScheduleUpdate(projectSchedule);
		
		return result;
	}
	
	public int oneProjectScheduleDelete(int scheduleId) {
		ProjectBoardDao dao = sqlSession.getMapper(ProjectBoardDao.class);
		int result = dao.oneProjectScheduleDelete(scheduleId);
		
		return result;
	}
	
	
    
}
