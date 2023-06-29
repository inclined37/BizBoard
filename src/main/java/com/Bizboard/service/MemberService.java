package com.Bizboard.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Bizboard.dao.MemberDao;
import com.Bizboard.vo.MemberAllData;
import com.Bizboard.vo.MemberSimpleData;
import com.Bizboard.vo.Members;
import com.Bizboard.vo.MembersDetail;

@Service
public class MemberService {

    @Autowired
    private SqlSession sqlSession;

    public int memberInsert(Members member, MembersDetail membersDetail) {
        MemberDao dao = sqlSession.getMapper(MemberDao.class);

        int result = dao.insertMembersAndMembersdetailAndRolls(member, membersDetail);
        
        return result;
    }
    
    public MemberAllData getOneMemberData(String userid) {
    	
    	MemberDao dao = sqlSession.getMapper(MemberDao.class);
    	
    	MemberAllData result = dao.getOneMemberData(userid);
    	
    	return result;
    }
    
//    public MemberSimpleData getMemberSimpleDataForBoard(String userid) {
//    	MemberDao dao = sqlSession.getMapper(MemberDao.class);
//    	MemberSimpleData msd = dao.additionalMemberDataforBoard(userid);
//    	return msd;
//    }
}
