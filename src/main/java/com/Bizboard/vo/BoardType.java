package com.Bizboard.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class BoardType {
	private int bt_code;		//게시판 코드
	private String bt_name;		//게시판 이름
	private int bf_code;		//게시판 형식 코드
}
