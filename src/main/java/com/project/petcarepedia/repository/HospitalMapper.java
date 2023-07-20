package com.project.petcarepedia.repository;

import com.project.petcarepedia.dto.HospitalDto;
import com.project.petcarepedia.dto.PageDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.List;

@Mapper
public interface HospitalMapper {

    /* 지역구 검색 결과 조회 및 페이징 처리 */
    List<HospitalDto> Hslist2(PageDto pageDto);

    /* 병원명 검색 결과 조회 및 페이징 처리 */
    List<HospitalDto> Hslist(PageDto pageDto);

    /* 병원 메인 조회 및 페이징 처리 */
    List<HospitalDto> Hlist(PageDto pageDto);

    /* 병원 페이징 카운트 */
    int totalRowCount();

    List<HospitalDto> list(PageDto pageDto);
    
    /* 병원 별점 */
    HospitalDto selectStar(String hid);
    
    /* 병원 지역구 필터링 */
    ArrayList<HospitalDto> searchGloc(String gloc);

    /* 병원명 검색 */
    List<Object> search(String hname);
   
    /* 병원 삭제 */
    int delete(String hid);
   
    /* 병원 수정 */
    int update(HospitalDto hospitalDto);

    /* 병원 수정 및 삭제 시 상세 조회 */
    HospitalDto content2(String hid, String hsfile);

    /* 병원 상세 조회 */
    HospitalDto content(String hid);
    
    /* 병원 조회 */
    ArrayList<HospitalDto> list2();

    /* 병원 예약 시간 */
    HospitalDto selectTime(String hid);

    /* 병원 등록 */
    int insert(HospitalDto hospitalDto);

}
