package com.Bizboard.vo;

import lombok.Data;

@Data
public class FileStorageBoard {
	private int fb_code;			//자료실 식별번호
	private int b_code;				//글 번호
	private String fb_originfile;	//원본 파일이름
	private String fb_savedfile;	//저장 파일이름
	private int fb_filesize;		//파일 크기
}
