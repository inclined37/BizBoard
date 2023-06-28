package com.Bizboard.dao;

import com.Bizboard.vo.Board;
import com.Bizboard.vo.NoticeBoard;

public interface BoardDao {

	//공지형 게시판 insert
	public int insertNoticeBoard(Board board, NoticeBoard noticeBoard);
	
}
