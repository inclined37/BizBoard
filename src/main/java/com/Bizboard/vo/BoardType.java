package com.Bizboard.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
public class BoardType {
	private int btCode;		//게시판 코드
	private String btName;		//게시판 이름
	private int bfCode;		//게시판 형식 코드
	public int getBtCode() {
		return btCode;
	}
	public void setBtCode(int btCode) {
		this.btCode = btCode;
	}
	public String getBtName() {
		return btName;
	}
	public void setBtName(String btName) {
		this.btName = btName;
	}
	public int getBfCode() {
		return bfCode;
	}
	public void setBfCode(int bfCode) {
		this.bfCode = bfCode;
	}
	
	
}
