package com.Bizboard.dao;

import org.apache.ibatis.annotations.Param;

import com.Bizboard.vo.Board;
import com.Bizboard.vo.MemberAllData;
import com.Bizboard.vo.MemberSimpleData;
import com.Bizboard.vo.Members;
import com.Bizboard.vo.MembersDetail;

public interface MemberDao {

	
	public int insertMembersAndMembersdetailAndRolls(@Param("member") Members member,@Param("membersDetail") MembersDetail membersDetail);
	
	public MemberAllData getOneMemberData(String userid);
		
	//사원의 정보와 해당 사원이 속한 부서의 정보 가져오기
	//public Object additionalMemberDataforBoard();
	//public MemberSimpleData additionalMemberDataforBoard(String userid);
	
}
