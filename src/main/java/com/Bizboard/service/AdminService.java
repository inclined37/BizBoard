package com.Bizboard.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Bizboard.dao.AdminDao;
import com.Bizboard.vo.Dept;
import com.Bizboard.vo.MemberAllData;
import com.Bizboard.vo.MemberSearchData;

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
    
    public int deptUpdate(Dept dept) {
    	AdminDao dao = sqlSession.getMapper(AdminDao.class);
    	
    	return dao.deptUpdate(dept);
    }
    
    public List<MemberAllData> getMemberAllData(MemberSearchData memberSearchData){
    	AdminDao dao = sqlSession.getMapper(AdminDao.class);
    	
    	
    	return dao.getMemberAllDataSearchList(memberSearchData);
    }
    
    public List<MemberAllData> getMemberAllDataList(){
    	AdminDao dao = sqlSession.getMapper(AdminDao.class);
    	
    	
    	return dao.getMemberAllDataList();
    }
    
    public int getTotalMemberCount() {
    	AdminDao dao = sqlSession.getMapper(AdminDao.class);
    	
    	return dao.getTotalMemberCount();
    }
    
    public List<MemberAllData> getMemberAllDataPagingList(int startRow, int pageSize) {
        AdminDao dao = sqlSession.getMapper(AdminDao.class);
        return dao.getMemberAllDataPagingList(startRow, pageSize);
    }

    
    
    
}
