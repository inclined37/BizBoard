package com.Bizboard.dao;

import java.util.List;

import com.Bizboard.vo.Dept;

public interface AdminDao {

	public List<Dept> getDeptList();
	
	public int deptInsert(Dept dept);
	
}
