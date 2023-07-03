package com.Bizboard.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Bizboard.dao.BoardDao;
import com.Bizboard.dao.MemberDao;
import com.Bizboard.vo.Board;
import com.Bizboard.vo.BoardForm;
import com.Bizboard.vo.BoardType;

@Service
public class NoticeBoardService {

	@Autowired
	private SqlSession sqlSession;


	@Autowired
	private BoardForm boardForm;

	@Autowired
	private BoardType boardType;

	// 공지게시판 전체 select
	public List<Board> selectAllNoticeBoard(int btCode) {
		BoardDao bdao = sqlSession.getMapper(BoardDao.class);
		List<Board> blist = bdao.selectAllNoticeBoard(btCode);
		return blist;
	}

	//공지게시판 조건 select
	public Board selectNoticeBoard(int bcode) {
		BoardDao bdao = sqlSession.getMapper(BoardDao.class);
		bdao.increaseBoardViews(bcode);
		Board board = bdao.selectNoticeBoard(bcode);
		return board;
	}
	
	// 공지게시판 insert
	public int insertNoticeBoard(Board board) {
		BoardDao bdao = sqlSession.getMapper(BoardDao.class);
		//MemberDao mdao = sqlSession.getMapper(MemberDao.class);

		// 공지사항 게시판의 게시판 기본정보 설정
		boardForm.setBfCode(10);
		boardType.setBtCode(1000);

		board.setBtCode(boardType.getBtCode());

		// int result = 0;
		int result = bdao.insertNoticeBoard(board);
		return result;
	}

	//공지게시판 update
	public int updateNoticeBoard(Board board) {
		BoardDao bdao = sqlSession.getMapper(BoardDao.class);
		int result = bdao.updateNoticeBoard(board);
		
		return result;
	}
	
	//공지게시판 delete
	@Transactional
	public void deleteNoticeBoard(int bcode) {
		BoardDao bdao = sqlSession.getMapper(BoardDao.class);
		try {
			bdao.deleteAdditionalNoticeBoard(bcode);
			bdao.deleteNoticeBoard(bcode);
		} catch (Exception e) {
			//두 테이블에서 정상적으로 delete가 수행되지 못한 경우 rollback 처리
			throw new RuntimeException("Failed to delete post", e);
		}
	}
	
}
