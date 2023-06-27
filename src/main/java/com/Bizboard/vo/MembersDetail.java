package com.Bizboard.vo;
import java.sql.Date;
import org.springframework.web.multipart.MultipartFile;
import lombok.Data;

@Data
public class MembersDetail {
    private String userid;
    private int empno;
    private String membername;
    private int deptno;
    private String job;
    private Date hiredate;
    private Date enddate;
    private int sal;
    private Date birthday;
    private String phonenumber;
    private String tel;
    private String email;
    private String fileOriginalName;
    private String fileStoredName;
    private String filePath;
    private MultipartFile file;
}
