package com.Bizboard.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.Bizboard.vo.Dept;
import com.Bizboard.vo.MemberAllData;
import com.Bizboard.vo.MemberSearchData;

public interface AdminDao {

	public List<Dept> getDeptList();
	
	public int deptInsert(Dept dept);
	
	public int deptUpdate(Dept dept);
	
	public List<MemberAllData> getMemberAllDataSearchList(MemberSearchData memberSearchData); // 사원 조건 검색 결과 
	
	public List<MemberAllData> getMemberAllDataList(); // 모든 사원 정보  
	
	public List<MemberAllData> getMemberAllDataPagingList(@Param("startRow") int startRow, @Param("pageSize") int pageSize);

	
	public int getTotalMemberCount(); //총사원수
	
	
	
}
