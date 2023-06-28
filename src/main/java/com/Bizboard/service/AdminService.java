package com.Bizboard.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Bizboard.dao.AdminDao;
import com.Bizboard.vo.Dept;

@Service
public class AdminService {
	
    @Autowired
    private SqlSession sqlSession;
    
    
    public List<Dept> getDeptList(){
    	AdminDao dao = sqlSession.getMapper(AdminDao.class);
    	
    	return dao.getDeptList();
    }
  
    public int deptInsert(Dept dept) {
    	AdminDao dao = sqlSession.getMapper(AdminDao.class);
    	
    	return dao.deptInsert(dept);
    }
    
    
    
    
    
    
}
