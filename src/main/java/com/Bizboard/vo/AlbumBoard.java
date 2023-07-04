package com.Bizboard.vo;

import lombok.Data;

public class AlbumBoard {
	private int ab_code;			//앨범 식별번호
	private int b_code;				//글 번호
	private String ab_originimg;	//원본 사진이름
	private String ab_savedimg;		//저장된 사진이름
	public int getAb_code() {
		return ab_code;
	}
	public void setAb_code(int ab_code) {
		this.ab_code = ab_code;
	}
	public int getB_code() {
		return b_code;
	}
	public void setB_code(int b_code) {
		this.b_code = b_code;
	}
	public String getAb_originimg() {
		return ab_originimg;
	}
	public void setAb_originimg(String ab_originimg) {
		this.ab_originimg = ab_originimg;
	}
	public String getAb_savedimg() {
		return ab_savedimg;
	}
	public void setAb_savedimg(String ab_savedimg) {
		this.ab_savedimg = ab_savedimg;
	}
	
	
}
