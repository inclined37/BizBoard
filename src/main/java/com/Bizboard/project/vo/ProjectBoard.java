package com.Bizboard.project.vo;

import java.security.Timestamp;

import lombok.Data;

public class ProjectBoard {
    private int bCode;
    private int projectSeq;
    private String bId;
    private String bName;
    private String bEmail;
    private String bDname;
    private String bTitle;
    private String bContent;
    private int bViews;
    private Timestamp bCreated;
    private Timestamp bUpdated;
    private int btCode;
	public int getbCode() {
		return bCode;
	}
	public void setbCode(int bCode) {
		this.bCode = bCode;
	}
	public int getProjectSeq() {
		return projectSeq;
	}
	public void setProjectSeq(int projectSeq) {
		this.projectSeq = projectSeq;
	}
	public String getbId() {
		return bId;
	}
	public void setbId(String bId) {
		this.bId = bId;
	}
	public String getbName() {
		return bName;
	}
	public void setbName(String bName) {
		this.bName = bName;
	}
	public String getbEmail() {
		return bEmail;
	}
	public void setbEmail(String bEmail) {
		this.bEmail = bEmail;
	}
	public String getbDname() {
		return bDname;
	}
	public void setbDname(String bDname) {
		this.bDname = bDname;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public int getbViews() {
		return bViews;
	}
	public void setbViews(int bViews) {
		this.bViews = bViews;
	}
	public Timestamp getbCreated() {
		return bCreated;
	}
	public void setbCreated(Timestamp bCreated) {
		this.bCreated = bCreated;
	}
	public Timestamp getbUpdated() {
		return bUpdated;
	}
	public void setbUpdated(Timestamp bUpdated) {
		this.bUpdated = bUpdated;
	}
	public int getBtCode() {
		return btCode;
	}
	public void setBtCode(int btCode) {
		this.btCode = btCode;
	}
    
}
