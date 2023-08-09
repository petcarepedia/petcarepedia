package com.project.petcarepedia.dto;

import lombok.Data;

@Data
public class BookingDto {
    String bid, bdate, vdate, vtime, bstate, mid, hid;
    int rno;

    /** 추가 **/
    String hname, loc, gloc, tel, hrink, name, phone;
    String start, end;
    String img, hsfile;
    int count;
}
