package com.Bizboard.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
