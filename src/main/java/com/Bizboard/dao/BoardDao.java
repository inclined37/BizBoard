package com.Bizboard.dao;

import java.util.List;

import com.Bizboard.vo.Board;
import com.Bizboard.vo.BoardFileJoin;

public interface BoardDao {

	// 조회수 증가
	void increaseBoardViews(int bcode);

	// 공지형 게시판 전체 select
	public List<Board> selectAllNoticeBoard(int btCode);
	
	// 공지형 게시판 조건 select
	public Board selectNoticeBoard(int bcode);

	// 공지형 게시판 insert
	public int insertNoticeBoard(Board board);
	
	
	// 공지형 게시판 update
	public int updateNoticeBoard(Board board);
	
	
	// 파일형 게시판 전체 select
	public List<BoardFileJoin> selectAllFileStorageBoard(int btCode);

	// 파일형 게시판 insert
	public int insertFileStorageBoard(Board board);


}
