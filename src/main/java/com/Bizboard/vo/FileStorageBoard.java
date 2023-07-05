package com.Bizboard.vo;

import lombok.Data;

public class FileStorageBoard {

	private int fbCode;			//자료실 식별번호
	private int bCode;				//글 번호
	private String fbOriginfile;	//원본 파일이름
	private String fbSavedfile;	//저장 파일이름
	private int fbFilesize;		//파일 크기
	public int getFbCode() {
		return fbCode;
	}
	public void setFbCode(int fbCode) {
		this.fbCode = fbCode;
	}
	public int getbCode() {
		return bCode;
	}
	public void setbCode(int bCode) {
		this.bCode = bCode;
	}
	public String getFbOriginfile() {
		return fbOriginfile;
	}
	public void setFbOriginfile(String fbOriginfile) {
		this.fbOriginfile = fbOriginfile;
	}
	public String getFbSavedfile() {
		return fbSavedfile;
	}
	public void setFbSavedfile(String fbSavedfile) {
		this.fbSavedfile = fbSavedfile;
	}
	public int getFbFilesize() {
		return fbFilesize;
	}
	public void setFbFilesize(int fbFilesize) {
		this.fbFilesize = fbFilesize;
	}

}
