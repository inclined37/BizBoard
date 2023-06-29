package com.Bizboard.dao;

import org.apache.ibatis.annotations.Param;

import com.Bizboard.vo.MemberAllData;
import com.Bizboard.vo.Members;
import com.Bizboard.vo.MembersDetail;

public interface MemberDao {

	
	public int insertMembersAndMembersdetailAndRolls(@Param("member") Members member,@Param("membersDetail") MembersDetail membersDetail);
	
	public MemberAllData getOneMemberData(String userid);
		
	
}
