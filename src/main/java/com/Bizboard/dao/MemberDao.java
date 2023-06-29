package com.Bizboard.dao;

import org.apache.ibatis.annotations.Param;

import com.Bizboard.vo.MemberAllData;
import com.Bizboard.vo.Members;
import com.Bizboard.vo.MembersDetail;

public interface MemberDao {

	
	public int insertMembersAndMembersdetailAndRolls(@Param("member") Members member,@Param("membersDetail") MembersDetail membersDetail); // 회원가입
	
	public MemberAllData getOneMemberData(String userid); // 한명의 유저의 모든 데이터
		
	public int idChk(Members members); //아이디 중복체크
		
	
}
