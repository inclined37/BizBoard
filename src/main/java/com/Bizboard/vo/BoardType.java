package com.Bizboard.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class BoardType {
	private int btCode;		//게시판 코드
	private String btName;		//게시판 이름
	private int bfCode;		//게시판 형식 코드
}
