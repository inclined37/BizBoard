package com.Bizboard.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Board {
	private int b_code;				//글 번호
	private String b_id;			//작성자 아이디
	private String b_name;			//작성자 이름
	private String b_email;			//작성자 이메일
	private String b_dname;			//작성자 부서명
	private String b_title;			//제목
	private String b_content;		//내용
	private int views;				//조회수
	private Timestamp b_created;	//작성일(시간)
	private int bt_code;			//게시판 코드
}
