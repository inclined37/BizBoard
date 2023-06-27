package com.Bizboard.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Bizboard.dao.MemberDao;
import com.Bizboard.vo.Members;
import com.Bizboard.vo.MembersDetail;

@Service
public class MemberService {

    @Autowired
    private SqlSession sqlSession;

    public int memberInsert(Members member, MembersDetail membersDetail) {
        MemberDao dao = sqlSession.getMapper(MemberDao.class);

        dao.insertMembersAndMembersdetailAndRolls(member, membersDetail);
        
        
        
        return 0;
    }
}
