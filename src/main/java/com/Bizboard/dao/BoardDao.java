package com.Bizboard.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.Bizboard.vo.Board;
import com.Bizboard.vo.BoardFileJoin;

public interface BoardDao {

	// 조회수 증가
	void increaseBoardViews(int bcode);

	// 공지형 게시판 전체 select
	public List<Board> selectAllNoticeBoard(@Param("btCode") int btCode, @Param("startRow") int startRow, @Param("pageSize") int pageSize);

	// 공지형 게시판 조건 select
	public Board selectNoticeBoard(int bcode);

	// 공지형 게시판 insert
	public int insertNoticeBoard(Board board);

	// 공지형 게시판 update
	public int updateNoticeBoard(Board board);

	// 공지형 게시판 delete
	public int deleteNoticeBoard(int bcode);

	
	//공지형 게시판 전체 게시글 수 Count
	public int getTotalNoticeBoardCount();


	// ==========================================================================================
	// 파일형 게시판 전체 select
	public List<BoardFileJoin> selectAllFileStorageBoard(int btCode);

	// 파일형 게시판 조건 select
	public BoardFileJoin selectFileStorageBoard(int bcode);

	// 파일형 게시판 조건2 select
	public BoardFileJoin selectOneFileStorageBoard(int bcode);

	// 파일형 게시판 insert
	public int insertFileStorageBoard(BoardFileJoin board);

	// 파일형 게시판 update
	public int updateFileStorageBoard(BoardFileJoin board);

	public int updateBoard(BoardFileJoin board);

	// 파일형 게시판 delete
	public int deleteFileStorageBoard(int bcode);
}
