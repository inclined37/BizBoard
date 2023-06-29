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
import com.Bizboard.vo.NoticeBoard;

@Service
public class FileStorageBoardBoardService {

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private BoardForm boardForm;

	@Autowired
	private BoardType boardType;

	// 파일게시판 전체 select
	public List<Board> selectAllFileStorageBoard(int btCode) {
		BoardDao bdao = sqlSession.getMapper(BoardDao.class);
		List<Board> blist = bdao.selectAllFileStorageBoard(btCode);
		return blist;
	}

	// 파일게시판 insert
	public int insertFileStorageBoard(Board board) {
		BoardDao bdao = sqlSession.getMapper(BoardDao.class);
		// MemberDao mdao = sqlSession.getMapper(MemberDao.class);

		// 파일 게시판의 게시판 기본정보 설정
		boardForm.setBfCode(20);
		boardType.setBtCode(2000);

		board.setBtCode(boardType.getBtCode());

		int result = bdao.insertFileStorageBoard(board);
		return result;
	}
}
