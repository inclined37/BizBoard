package com.Bizboard.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Board {

	private int bcode;				//글 번호
	private String bid;			//작성자 아이디
	private String bname;			//작성자 이름
	private String bemail;			//작성자 이메일
	private String bdname;			//작성자 부서명
	private String btitle;			//제목
	private String bcontent;		//내용
	private int bviews;				//조회수
	private Timestamp bcreated;	//작성일(시간)

	private int btCode;			//게시판 코드
}
