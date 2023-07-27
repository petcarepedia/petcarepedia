package com.project.petcarepedia.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;
import java.util.ArrayList;

import java.util.ArrayList;

@Data
public class HospitalDto {
    String page;
    int rno;
    String hid, hname, gloc, loc, tel,htime, ntime, holiday, animal,intro, img, hrink, x, y, starttime, endtime, hfile, hsfile, auth ;
    float rstar;
    MultipartFile file1;


    private MultipartFile[] files;

    private ArrayList hfiles = new ArrayList();
    private ArrayList hsfiles = new ArrayList();

    String hfile1, hsfile1, hfile2, hsfile2;
    String htime1, htime2, mid;

    public String getHtime() {
        if(htime1 != null) {
            htime = htime1 + "~" + htime2;
        }
        return htime;
    }
    public void setHtime(String htime) {
        this.htime = htime;
    }

}
