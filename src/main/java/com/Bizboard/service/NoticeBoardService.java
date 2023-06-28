package com.Bizboard.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Bizboard.dao.BoardDao;
import com.Bizboard.vo.Board;
import com.Bizboard.vo.NoticeBoard;

@Service
public class NoticeBoardService {

	@Autowired
	private SqlSession sqlSession;
	
	public int insertNoticeBoard(Board board, NoticeBoard noticeBoard) {
		
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		
		int result = dao.insertNoticeBoard(board, noticeBoard);
		return result;
	}
}
