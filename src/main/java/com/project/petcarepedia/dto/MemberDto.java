package com.project.petcarepedia.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class MemberDto {
    private int rno;
    private String mid, pass, name, nickname, phone, birth, email, addr, mdate, grade, mfile, msfile;
    private String hname, loc, hsfile1, hfile1, deletemh;
    MultipartFile file1;
}
