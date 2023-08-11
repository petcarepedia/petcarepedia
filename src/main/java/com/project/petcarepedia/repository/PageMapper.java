package com.project.petcarepedia.repository;

import com.project.petcarepedia.dto.PageDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PageMapper {
    /*int HBscount(PageDto pageDto);*/

    int MRcount(PageDto pageDto);
    int MRScount(PageDto pageDto);
    int HBscount(PageDto pageDto);
    int HBcount(PageDto pageDto);
    int HBcount2(PageDto pageDto);
    int HBcount3(PageDto pageDto);
    int HBcount4(PageDto pageDto);
    int Rcount();
    int RRcount();
    int Bscount(PageDto pageDto);
    int Bcount();
    int Mscount(PageDto pageDto);
    int Mcount();
    int Hscount(PageDto pageDto);
    int Hscount2(PageDto pageDto);
    int Hcount();
    int Myscount(PageDto pageDto);
    int Mycount();
}
