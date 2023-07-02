package com.Bizboard.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Bizboard.dao.BoardDao;
import com.Bizboard.vo.BoardFileJoin;
import com.Bizboard.vo.BoardForm;
import com.Bizboard.vo.BoardType;

@Service
public class FileStorageBoardService {

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private BoardForm boardForm;

	@Autowired
	private BoardType boardType;

	// 파일게시판 전체 select
	public List<BoardFileJoin> selectAllFileStorageBoard(int btCode) {
		BoardDao bdao = sqlSession.getMapper(BoardDao.class);
		List<BoardFileJoin> blist = bdao.selectAllFileStorageBoard(btCode);
		return blist;
	}

	// 파일게시판 조건 select
	public BoardFileJoin selectFileBoard(int bcode) {
		BoardDao bdao = sqlSession.getMapper(BoardDao.class);
		bdao.increaseBoardViews(bcode);
		BoardFileJoin board = bdao.selectOneFileStorageBoard(bcode);
		return board;
	}
	

	// 파일게시판 insert
	public int insertFileStorageBoard(BoardFileJoin board) {
		BoardDao bdao = sqlSession.getMapper(BoardDao.class);
		// MemberDao mdao = sqlSession.getMapper(MemberDao.class);

		// 파일 게시판의 게시판 기본정보 설정
		boardForm.setBfCode(20);
		boardType.setBtCode(2000);

		board.setBtCode(boardType.getBtCode());

		int result = bdao.insertFileStorageBoard(board);
		return result;
	}

	// 파일게시판 update
	public int updateFileStorageBoard(BoardFileJoin board) {
	    BoardDao bdao = sqlSession.getMapper(BoardDao.class);
	    // 기존의 첨부파일 정보를 가져옵니다.
	    BoardFileJoin existingBoard = bdao.selectOneFileStorageBoard(board.getBcode());
	    // 새로운 첨부파일 정보를 가져옵니다.
	    BoardFileJoin newBoard = board;

	    // 첨부파일이 존재하지 않을 경우 기존의 첨부파일 정보를 유지합니다.
	    if (newBoard.getFbOriginfile() == null && newBoard.getFbSavedfile() == null && newBoard.getFbFilesize() == 0) {
	        newBoard.setFbCode(existingBoard.getFbCode());
	        newBoard.setFbOriginfile(existingBoard.getFbOriginfile());
	        newBoard.setFbSavedfile(existingBoard.getFbSavedfile());
	        newBoard.setFbFilesize(existingBoard.getFbFilesize());
	    } else {
	        // 첨부파일이 존재할 경우, 기존의 첨부파일 정보를 업데이트합니다.
	        if (existingBoard.getFbCode() != 0) {
	            newBoard.setFbCode(existingBoard.getFbCode());
	            bdao.updateFileStorageBoard(newBoard);
	        } else {
	            // 기존의 첨부파일 정보가 없는 경우, 새로운 첨부파일 정보를 추가합니다.
	            bdao.insertFileStorageBoard(newBoard);
	        }
	    }

	    // 게시글 정보를 업데이트합니다.
	    int result = bdao.updateBoard(newBoard);

	    return result;
	}




	//public int updateFileStorageBoard(BoardFileJoin board) {
		//BoardDao bdao = sqlSession.getMapper(BoardDao.class);
		//int result = bdao.updateBoard(board);
	        //result += bdao.updateFileStorageBoard(board);
	    
	    //return result;
	//}

}
