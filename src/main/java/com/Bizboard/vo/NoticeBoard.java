package com.Bizboard.vo;

import lombok.Data;

public class NoticeBoard {
	private int nbcode;		//공지 식별번호
	private int bcode;		//글 번호
	private int nbchecked;	//공지게시글 상단고정여부
	public int getNbcode() {
		return nbcode;
	}
	public void setNbcode(int nbcode) {
		this.nbcode = nbcode;
	}
	public int getBcode() {
		return bcode;
	}
	public void setBcode(int bcode) {
		this.bcode = bcode;
	}
	public int getNbchecked() {
		return nbchecked;
	}
	public void setNbchecked(int nbchecked) {
		this.nbchecked = nbchecked;
	}
	
}
