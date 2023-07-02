package com.Bizboard.project.vo;

import java.security.Timestamp;

import lombok.Data;

@Data
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
}
