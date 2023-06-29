package com.Bizboard.vo;

import lombok.Data;

@Data
public class AlbumBoard {
	private int ab_code;			//앨범 식별번호
	private int b_code;				//글 번호
	private String ab_originimg;	//원본 사진이름
	private String ab_savedimg;		//저장된 사진이름
}
