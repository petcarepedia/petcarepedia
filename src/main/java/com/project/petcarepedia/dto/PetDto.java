package com.project.petcarepedia.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class PetDto {
    private int rno;
    private String pid, mid, pname, pkind, pgender, pbirth, pfile, psfile;
    MultipartFile file1;
}
