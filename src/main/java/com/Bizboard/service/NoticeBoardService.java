package com.Bizboard.service;

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
	
	//공지게시판 insert
	public int insertNoticeBoard(Board board) {
		BoardDao bdao = sqlSession.getMapper(BoardDao.class);
		MemberDao mdao = sqlSession.getMapper(MemberDao.class);
		
		//공지사항 게시판의 게시판 기본정보 설정
        boardForm.setBf_code(10);
        boardType.setBt_code(1000);
        
        board.setBt_code(boardType.getBt_code());
        
        //int result = 0;
		int result = bdao.insertNoticeBoard(board);
		return result;
	}
}
