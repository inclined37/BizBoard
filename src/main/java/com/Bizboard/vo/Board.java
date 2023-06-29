package com.Bizboard.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Board {
	private int bCode;				//글 번호
	private String bId;			//작성자 아이디
	private String bName;			//작성자 이름
	private String bEmail;			//작성자 이메일
	private String bDname;			//작성자 부서명
	private String bTitle;			//제목
	private String bContent;		//내용
	private int bViews;				//조회수
	private Timestamp bCreated;	//작성일(시간)
	private int btCode;			//게시판 코드
}
