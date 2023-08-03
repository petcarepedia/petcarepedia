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
        //페이징 처리 - startCount, endCount 구하기
        int startCount = 0;
        int endCount = 0;
        int pageSize = 5;	//한페이지당 게시물 수
        int reqPage = 1;	//요청페이지
        int pageCount = 1;	//전체 페이지 수
        int dbCount = 0;	//DB에서 가져온 전체 행수

        if(pageDto.getServiceName().equals("my_review")) {
            pageSize = 3;
            dbCount = pageMapper.Myscount(pageDto);
        }else if(pageDto.getServiceName().equals("review")) {
            pageSize = 7;
            dbCount = reviewMapper.count();
        }else if(pageDto.getServiceName().equals("reviewSearch")) {
            pageSize = 7;
            gloc = pageDto.getGloc();
            dbCount = reviewMapper.searchCount(pageDto.getGloc());
        }else if(pageDto.getServiceName().equals("notice")) {
            pageSize = 10;
            dbCount = noticeService.count();
        }else if(pageDto.getServiceName().equals("best_review")) {
            pageSize = 3;
            dbCount = pageMapper.Rcount();
            if(dbCount>9) dbCount=9;
        }else if(pageDto.getServiceName().equals("hospital")) {
            pageSize = 10;
            dbCount = pageMapper.Hcount();
        }else if(pageDto.getServiceName().equals("member")) {
            pageSize = 10;
            dbCount = pageMapper.Mcount();
        }else if(pageDto.getServiceName().equals("review_report")){
            pageSize=10;
            dbCount= pageMapper.RRcount();
        }else if(pageDto.getServiceName().equals("manager_review")) {
            pageSize = 10;
            dbCount = pageMapper.MRcount(pageDto);
            hid = pageDto.getHid();
        } else if(pageDto.getServiceName().equals("manager_review_report")) {
            pageSize = 10;
            dbCount = pageMapper.MRScount(pageDto);
            hid = pageDto.getHid();
        }else if(pageDto.getHid() != null && pageDto.getHid() != ""){
            pageSize=10;
            dbCount = pageMapper.HBcount(pageDto);
        }else if(pageDto.getMid() != null && pageDto.getMid() != "") {
            pageSize = 10;
            dbCount = pageMapper.Mscount(pageDto);
        }else if(pageDto.getServiceName().equals("reserve")){
            pageSize = 10;
            dbCount = pageMapper.Bcount();
        } else if (pageDto.getMid() != null && pageDto.getMid() != "") {
            pageSize = 10;
            dbCount = pageMapper.Bscount(pageDto);
        }else if(pageDto.getHname() != null && pageDto.getHname() != "") {
            pageSize = 10;
            dbCount = pageMapper.Hscount(pageDto);
        }else if(pageDto.getGloc() != null && pageDto.getGloc() != "") {
            pageSize = 10;
            dbCount = pageMapper.Hscount2(pageDto);
        } else if (pageDto.getMid() != null && pageDto.getMid() != "") {
            pageSize = 10;
            dbCount = pageMapper.HBscount(pageDto);
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
