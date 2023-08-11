package com.project.petcarepedia.service;

import com.project.petcarepedia.dto.PageDto;
import com.project.petcarepedia.repository.PageMapper;
import com.project.petcarepedia.repository.ReviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PageService {
    @Autowired
    private PageMapper pageMapper;
    @Autowired
    private NoticeService noticeService;
    @Autowired
    private ReviewMapper reviewMapper;

    public PageDto getPageResult(PageDto pageDto) {
        String gloc = "";
        String hid = "";
        String hname = "";
        String mid= "";
        String serviceName = pageDto.getServiceName();
        //페이징 처리 - startCount, endCount 구하기
        int startCount = 0;
        int endCount = 0;
        int pageSize = 10;	//한페이지당 게시물 수
        int reqPage = 1;	//요청페이지
        int pageCount = 1;	//전체 페이지 수
        int dbCount = 0;	//DB에서 가져온 전체 행수

        if(serviceName.equals("my_review")) {
            pageSize = 3;
            dbCount = pageMapper.Myscount(pageDto);
            mid = pageDto.getMid();
        }else if(serviceName.equals("review")) {
            pageSize = 7;
            dbCount = reviewMapper.count();
        }else if(serviceName.equals("reviewSearch")) {
            pageSize = 7;
            gloc = pageDto.getGloc();
            dbCount = reviewMapper.searchCount(pageDto.getGloc());
        }else if(serviceName.equals("notice")) {
            dbCount = noticeService.count();
        }else if(serviceName.equals("best_review")) {
            pageSize = 3;
            dbCount = pageMapper.Rcount();
            if(dbCount>9) dbCount=9;
        }else if(serviceName.equals("hospital")) {
            dbCount = pageMapper.Hcount();
        }else if(serviceName.equals("member")) {
            dbCount = pageMapper.Mcount();
        }else if(serviceName.equals("review_report")){
            dbCount= pageMapper.RRcount();
        }else if(serviceName.equals("manager_review")) {
            dbCount = pageMapper.MRcount(pageDto);
            hid = pageDto.getHid();
        } else if(serviceName.equals("manager_review_report")) {
            dbCount = pageMapper.MRScount(pageDto);
            hid = pageDto.getHid();
        }else if(serviceName.equals("member_mid")) {
            dbCount = pageMapper.Mscount(pageDto);
            mid = pageDto.getMid();
        }else if(serviceName.equals("reserve")){
            dbCount = pageMapper.Bcount();
        } else if (serviceName.equals("booking_mid")) {
            dbCount = pageMapper.Bscount(pageDto);
            mid = pageDto.getMid();
        }else if(serviceName.equals("hospital_hname")) {
            dbCount = pageMapper.Hscount(pageDto);
            hname = pageDto.getHname();
        }else if(serviceName.equals("hospital_gloc")) {
            dbCount = pageMapper.Hscount2(pageDto);
            gloc = pageDto.getGloc();
        }else if(serviceName.equals("manager_reserve")){
            dbCount = pageMapper.HBcount(pageDto);
            hid = pageDto.getHid();
        }else if(serviceName.equals("manager_reserve_search")){
            dbCount = pageMapper.HBscount(pageDto);
            hid = pageDto.getHid();
        } else if(serviceName.equals("manager_reserve_booking")) {
            dbCount = pageMapper.HBcount2(pageDto);
            hid = pageDto.getHid();
        } else if(serviceName.equals("manager_reserve_cancel")) {
            dbCount = pageMapper.HBcount3(pageDto);
            hid = pageDto.getHid();
        } else if(serviceName.equals("manager_reserve_completed")) {
            dbCount = pageMapper.HBcount4(pageDto);
            hid = pageDto.getHid();
        }

        //총 페이지 수 계산
        if(dbCount % pageSize == 0){
            pageCount = dbCount/pageSize;
        }else{
            pageCount = dbCount/pageSize+1;
        }

        //요청 페이지 계산
        if(pageDto.getPage() != null){
            reqPage = Integer.parseInt(pageDto.getPage());
            startCount = (reqPage-1) * pageSize+1;
            endCount = reqPage *pageSize;
        }else{
            startCount = 1;
            endCount = pageSize;
        }

        pageDto.setHname(hname);
        pageDto.setMid(mid);
        pageDto.setGloc(gloc);
        pageDto.setStartCount(startCount);
        pageDto.setEndCount(endCount);
        pageDto.setDbCount(dbCount);
        pageDto.setPageCount(pageCount);
        pageDto.setPageSize(pageSize);
        pageDto.setReqPage(reqPage);
        pageDto.setHid(hid);

        return pageDto;
    }
}
