package com.Bizboard.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
public class BoardForm {
	private int bfCode;		//게시판 형식 코드
	private String bfName;		//게시판 형식 이름
	public int getBfCode() {
		return bfCode;
	}
	public void setBfCode(int bfCode) {
		this.bfCode = bfCode;
	}
	public String getBfName() {
		return bfName;
	}
	public void setBfName(String bfName) {
		this.bfName = bfName;
	}
	
}
