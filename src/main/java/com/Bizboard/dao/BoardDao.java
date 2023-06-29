package com.Bizboard.dao;

import java.util.List;

import com.Bizboard.vo.Board;

public interface BoardDao {

	// 공지형 게시판 전체 select
	public List<Board> selectAllNoticeBoard(int btCode);

	// 공지형 게시판 insert
	public int insertNoticeBoard(Board board);

	
	
	
	// 파일형 게시판 전체 select
	public List<Board> selectAllFileStorageBoard(int btCode);

	// 파일형 게시판 insert
	public int insertFileStorageBoard(Board board);

}
