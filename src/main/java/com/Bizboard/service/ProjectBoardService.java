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
    
    public JoinProjectSimpleData JoinProjectSimpleOneData(int projectSeq) {
    	ProjectBoardDao dao = sqlSession.getMapper(ProjectBoardDao.class);
    	JoinProjectSimpleData result = dao.JoinProjectSimpleOneData(projectSeq);
    	
    	return result;
    }
    
    
}
