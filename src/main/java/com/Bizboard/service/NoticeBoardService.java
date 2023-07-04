package com.Bizboard.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Bizboard.dao.BoardDao;
import com.Bizboard.vo.Board;
import com.Bizboard.vo.BoardForm;
import com.Bizboard.vo.BoardJoinNoticeBoard;
import com.Bizboard.vo.BoardType;
import com.Bizboard.vo.NoticeBoard;

@Service
public class NoticeBoardService {

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private BoardForm boardForm;

	@Autowired
	private BoardType boardType;

	// 공지게시판 전체 select
	public List<BoardJoinNoticeBoard> selectAllNoticeBoard(int btCode, int startRow, int pageSize) {
		BoardDao bdao = sqlSession.getMapper(BoardDao.class);
		List<BoardJoinNoticeBoard> blist = bdao.selectAllNoticeBoard(btCode,startRow,pageSize);
		return blist;
	}
	
	// 공지게시판 검색 select
	public List<Board> selectAllNoticeBoardByValue(String option, String keyword, int btCode, int startRow, int pageSize){
		BoardDao bdao = sqlSession.getMapper(BoardDao.class);
		List<Board> selectList = null;
		
		//조건이 무엇인지에 따라 다른 메서드 호출
		if("btitle".equals(option)) {
			selectList = bdao.selectAllNoticeBoardByTitle(keyword, btCode, startRow, pageSize);
		} else if("bcontent".equals(option)) {
			selectList = bdao.selectAllNoticeBoardByContent(keyword, btCode, startRow, pageSize);
		} else if("bname".equals(option)) {
			selectList = bdao.selectAllNoticeBoardByName(keyword, btCode, startRow, pageSize);
		}
		return selectList;
	}
	
	// 공지게시판 검색 select Count
	public int selectNoticeBoardCountByValue(String option, String keyword, int btCode) {
		BoardDao bdao = sqlSession.getMapper(BoardDao.class);
		int count;

        if ("btitle".equals(option)) {
            count = bdao.selectNoticeBoardByTitleCount(keyword, btCode);
        } else if ("bcontent".equals(option)) {
            count = bdao.selectNoticeBoardByContentCount(keyword, btCode);
        } else if ("bname".equals(option)) {
            count = bdao.selectNoticeBoardByNameCount(keyword, btCode);
        } else {
            count = 0;
        }
        return count;
    }

	// 공지게시판 조건 select
	public Board selectNoticeBoard(int bcode) {
		BoardDao bdao = sqlSession.getMapper(BoardDao.class);
		bdao.increaseBoardViews(bcode);
		Board board = bdao.selectNoticeBoard(bcode);
		return board;
	}
	
	// 공지게시판 insert
	public int insertNoticeBoard(Board board, NoticeBoard nboard) {
		BoardDao bdao = sqlSession.getMapper(BoardDao.class);
		//MemberDao mdao = sqlSession.getMapper(MemberDao.class);

		// 공지사항 게시판의 게시판 기본정보 설정
		boardForm.setBfCode(10);
		boardType.setBtCode(1000);

		board.setBtCode(boardType.getBtCode());

		// int result = 0;
		int result = bdao.insertNoticeBoard(board, nboard);
		return result;
	}

	// 공지게시판 update
	public int updateNoticeBoard(Board board) {
		BoardDao bdao = sqlSession.getMapper(BoardDao.class);
		int result = bdao.updateNoticeBoard(board);
		
		return result;
	}
	
	// 공지게시판 delete
	public void deleteNoticeBoard(int bcode) {
		BoardDao bdao = sqlSession.getMapper(BoardDao.class);
		bdao.deleteNoticeBoard(bcode);
	}
	
	// 공지게시판 전체 글의 개수
	public int getTotalNoticeBoardCount() {
		BoardDao bdao = sqlSession.getMapper(BoardDao.class);
		int result = bdao.getTotalNoticeBoardCount();
		
		return result;
	}
	
}
