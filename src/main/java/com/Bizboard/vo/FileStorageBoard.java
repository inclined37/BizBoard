package com.Bizboard.vo;

import lombok.Data;

@Data
public class FileStorageBoard {
	private int fbCode;			//자료실 식별번호
	private int bCode;				//글 번호
	private String fbOriginfile;	//원본 파일이름
	private String fbSavedfile;	//저장 파일이름
	private int fbFilesize;		//파일 크기
}
