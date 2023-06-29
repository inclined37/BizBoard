package com.Bizboard.dao;

import java.util.ArrayList;
import java.util.List;

import com.Bizboard.vo.Board;

public interface BoardDao {

	//공지형 게시판 전체 select
	public ArrayList<Board> selectAllNoticeBoard(int bt_code);
	
	//공지형 게시판 insert
	public int insertNoticeBoard(Board board);
	
}
