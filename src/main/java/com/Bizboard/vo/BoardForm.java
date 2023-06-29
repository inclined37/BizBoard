package com.Bizboard.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class BoardForm {
	private int bf_code;		//게시판 형식 코드
	private String bf_name;		//게시판 형식 이름
}
