package com.Bizboard.vo;

import lombok.Data;

public class MemberSearchData {

	private String searchText;
	private String searchType;
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	
	
}
