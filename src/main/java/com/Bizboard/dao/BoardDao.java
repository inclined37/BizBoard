package com.Bizboard.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.Bizboard.vo.Board;
import com.Bizboard.vo.BoardFileJoin;
import com.Bizboard.vo.BoardJoinNoticeBoard;
import com.Bizboard.vo.NoticeBoard;

public interface BoardDao {

	// 조회수 증가
	void increaseBoardViews(int bcode);

	// 공지형 게시판 전체 select
	public List<BoardJoinNoticeBoard> selectAllNoticeBoard(@Param("btCode") int btCode, @Param("startRow") int startRow, @Param("pageSize") int pageSize);

	// 공지형 게시판 검색 - 제목 select
	public List<Board> selectAllNoticeBoardByTitle(@Param("btitle") String btitle, @Param("btCode") int btCode, @Param("startRow") int startRow, @Param("pageSize") int pageSize);
	
	// 공지형 게시판 검색 - 내용 select
	public List<Board> selectAllNoticeBoardByContent(@Param("bcontent") String bcontent, @Param("btCode") int btCode, @Param("startRow") int startRow, @Param("pageSize") int pageSize);
	
	// 공지형 게시판 검색 - 작성자 이름 select
	public List<Board> selectAllNoticeBoardByName(@Param("bname") String bname, @Param("btCode") int btCode, @Param("startRow") int startRow, @Param("pageSize") int pageSize);
	
	// 공지형 게시판 검색 - 제목 totalCount
	public int selectNoticeBoardByTitleCount(@Param("btitle") String btitle, @Param("btCode") int btCode);

	// 공지형 게시판 검색 - 내용 totalCount
	public int selectNoticeBoardByContentCount(@Param("bcontent") String bcontent, @Param("btCode") int btCode);

	// 공지형 게시판 검색 - 작성자 이름 totalCount
	public int selectNoticeBoardByNameCount(@Param("bname") String bname, @Param("btCode") int btCode);

	// 공지형 게시판 조건 select
	public Board selectBoard(int bcode);
	public NoticeBoard selectNoticeBoard(int bcode);

	// 공지형 게시판 insert
	public int insertNoticeBoard(@Param("board") Board board, @Param("nboard") NoticeBoard nboard);

	// 공지형 게시판 update
	public int updateBoardforNotice(Board board);
	public int updateNoticeBoard(NoticeBoard nboard);

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
