package com.Bizboard.vo;

import java.sql.Timestamp;

import lombok.Data;

public class BoardJoinNoticeBoard {
	private int bcode;				//글 번호
	private String bid;			//작성자 아이디
	private String bname;			//작성자 이름
	private String bemail;			//작성자 이메일
	private String bdname;			//작성자 부서명
	private String btitle;			//제목
	private String bcontent;		//내용
	private int bviews;				//조회수
	private Timestamp bcreated;	//작성일(시간)
	private Timestamp bupdated; //최근수정일(기본:null)

	private int btCode;			//게시판 코드
	
	private int nbcode;		//공지 식별번호
	private int nbchecked;	//공지게시글 상단고정여부
	
	
	
	@Override
	public String toString() {
		return "BoardJoinNoticeBoard [bcode=" + bcode + ", bid=" + bid + ", bname=" + bname + ", bemail=" + bemail
				+ ", bdname=" + bdname + ", btitle=" + btitle + ", bcontent=" + bcontent + ", bviews=" + bviews
				+ ", bcreated=" + bcreated + ", bupdated=" + bupdated + ", btCode=" + btCode + ", nbcode=" + nbcode
				+ ", nbchecked=" + nbchecked + "]";
	}
	public int getBcode() {
		return bcode;
	}
	public void setBcode(int bcode) {
		this.bcode = bcode;
	}
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getBemail() {
		return bemail;
	}
	public void setBemail(String bemail) {
		this.bemail = bemail;
	}
	public String getBdname() {
		return bdname;
	}
	public void setBdname(String bdname) {
		this.bdname = bdname;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public int getBviews() {
		return bviews;
	}
	public void setBviews(int bviews) {
		this.bviews = bviews;
	}
	public Timestamp getBcreated() {
		return bcreated;
	}
	public void setBcreated(Timestamp bcreated) {
		this.bcreated = bcreated;
	}
	public Timestamp getBupdated() {
		return bupdated;
	}
	public void setBupdated(Timestamp bupdated) {
		this.bupdated = bupdated;
	}
	public int getBtCode() {
		return btCode;
	}
	public void setBtCode(int btCode) {
		this.btCode = btCode;
	}
	public int getNbcode() {
		return nbcode;
	}
	public void setNbcode(int nbcode) {
		this.nbcode = nbcode;
	}
	public int getNbchecked() {
		return nbchecked;
	}
	public void setNbchecked(int nbchecked) {
		this.nbchecked = nbchecked;
	}
	
	
}
