package com.Bizboard.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class BoardForm {
	private int bfCode;		//게시판 형식 코드
	private String bfName;		//게시판 형식 이름
}
