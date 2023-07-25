package com.project.petcarepedia.controller;

import com.project.petcarepedia.dto.*;
import com.project.petcarepedia.service.FileUploadService;
import com.project.petcarepedia.service.PageService;
import com.project.petcarepedia.service.ReviewLikeService;
import com.project.petcarepedia.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@Controller
public class ReviewController {
    @Autowired
    private ReviewService reviewService;
    @Autowired
    private ReviewLikeService reviewLikeService;
    @Autowired
    private PageService pageService;
    @Autowired
    private FileUploadService fileUploadService;

    //review_main.do 리뷰 리스트 페이징
    @GetMapping("review_main/{page}")
    public String review_main(@PathVariable String page, Model model) {
        PageDto pageDto = pageService.getPageResult(new PageDto(page,"review"));
        model.addAttribute("list", reviewService.listPage(pageDto));
        model.addAttribute("page", pageDto);
        return ("/review/review_main");
    }

    //review_content.do 리뷰 상세 페이지
    @GetMapping("review_content/{rid}")
    public String review_content(@PathVariable String rid, Model model, HttpSession session) {
        ReviewDto reviewDto = reviewService.enter_content(rid);
        ReviewLikeDto reviewLikeDto = new ReviewLikeDto();

        reviewDto.setRcontent(reviewDto.getRcontent().replace("\n", "<br>"));
        String mid ="";
        if(session.getAttribute("svo") != null) {
            SessionDto sessionDto = (SessionDto) session.getAttribute("svo");
            mid = sessionDto.getMid();
        }
        reviewLikeDto.setMid(mid);
        reviewLikeDto.setRid(rid);
        int likeResult = reviewLikeService.idCheck(reviewLikeDto);

        model.addAttribute("likeResult",likeResult);
        model.addAttribute("rvo",reviewDto);
        return ("/review/review_content");
    }

    @GetMapping("review_content/{page}/{rid}")
    public String review_content( @PathVariable String page,@PathVariable String rid, Model model, HttpSession session) {
        ReviewDto reviewDto = reviewService.enter_content(rid);
        ReviewLikeDto reviewLikeDto = new ReviewLikeDto();
        PageDto pageDto = new PageDto(page, "review");

        reviewDto.setRcontent(reviewDto.getRcontent().replace("\n", "<br>"));
        String mid ="";
        if(session.getAttribute("svo") != null) {
            SessionDto sessionDto = (SessionDto) session.getAttribute("svo");
            mid = sessionDto.getMid();
        }
        reviewLikeDto.setMid(mid);
        reviewLikeDto.setRid(rid);
        int likeResult = reviewLikeService.idCheck(reviewLikeDto);

        model.addAttribute("likeResult",likeResult);
        model.addAttribute("rvo",reviewDto);
        model.addAttribute("page",pageDto);
        return ("/review/review_content");
    }

    //review_content.do 리뷰 상세 페이지 - gloc 있을 때
    @GetMapping("review_content/{gloc}/{page}/{rid}")
    public String review_content(@PathVariable String gloc, @PathVariable String page, @PathVariable String rid, Model model, HttpSession session) {
        ReviewDto reviewDto = reviewService.enter_content(rid);
        ReviewLikeDto reviewLikeDto = new ReviewLikeDto();
        PageDto pageDto = new PageDto(page, "review");
        pageDto.setGloc(gloc);

        reviewDto.setRcontent(reviewDto.getRcontent().replace("\n", "<br>"));
        String mid ="";
        if(session.getAttribute("svo") != null) {
            SessionDto sessionDto = (SessionDto) session.getAttribute("svo");
            mid = sessionDto.getMid();
        }
        reviewLikeDto.setMid(mid);
        reviewLikeDto.setRid(rid);
        int likeResult = reviewLikeService.idCheck(reviewLikeDto);

        model.addAttribute("likeResult",likeResult);
        model.addAttribute("rvo",reviewDto);
        model.addAttribute("page",pageDto);
        return ("/review/review_content");
    }


    //review_delete_proc.do 리뷰 삭제 처리
    @PostMapping("/review_delete")
    public String review_delete_proc(ReviewDto reviewDto) throws Exception {
        String[] oldFileName = {reviewDto.getRsfile1(), reviewDto.getRsfile2()};
        int result = reviewService.delete(reviewDto.getRid());
        if(result == 1) {
            fileUploadService.multiFileDelete(oldFileName);
        }
        String url = "서울전체";
        url = URLEncoder.encode(url, "UTF-8");
        return ("redirect:/review_main/"+url+"/1/");
    }

    //review_report_check.do 리뷰 신고 체크 ----- restComtroller로 바꾸기
    /*
    @RequestMapping(value="/review_report_check.do", method=RequestMethod.GET)
    @ResponseBody
    public String review_report_check(String rid) {
        int result = reviewService.reviewCheckResult(rid);
        return String.valueOf(result);
    }
    */

    //review_report_proc.do 리뷰 신고 처리
    @PostMapping("/review_report")
    public String review_report_proc(ReviewDto reviewDto) throws UnsupportedEncodingException {
        int result = reviewService.report(reviewDto.getRid());
        String view ="";
        if(result == 1) {
            // 리뷰로 돌아가게하기
            String url = reviewDto.getGloc();
            url = URLEncoder.encode(url, "UTF-8");
            view = "redirect:/review_content/"+url+"/"+reviewDto.getPage()+"/"+reviewDto.getRid()+"/";
        }
        return view;
    }

    //리뷰 좋아요
    @PostMapping("/review_like")
    public String review_like_proc(ReviewLikeDto reviewLikeDto, PageDto pageDto, HttpSession session, Model model) throws UnsupportedEncodingException {
        SessionDto sessionDto = (SessionDto) session.getAttribute("svo");
        reviewLikeDto.setMid(sessionDto.getMid());

        if(reviewLikeService.idCheck(reviewLikeDto) == 1) {
            reviewLikeService.likesDownID(reviewLikeDto);
            reviewLikeService.likesDown(reviewLikeDto);
        }
        else {
            reviewLikeService.likesUpID(reviewLikeDto);
            reviewLikeService.likesUp(reviewLikeDto);
        }
        String url = pageDto.getGloc();
        url = URLEncoder.encode(url, "UTF-8");
        model.addAttribute("page", pageDto);
        return ("redirect:/review_content/"+url+"/"+pageDto.getPage()+"/"+reviewLikeDto.getRid()+"/");
    }


    //리뷰 검색 페이징
    @PostMapping("/review_main")
    public String review_main_search(String page , String gloc, Model model) throws UnsupportedEncodingException {
        PageDto pageDto1 = new PageDto(page,"reviewSearch");
        pageDto1.setGloc(gloc);
        PageDto pageDto = pageService.getPageResult(pageDto1);
        model.addAttribute("list", reviewService.searchListPage(pageDto));
        model.addAttribute("page", pageDto);
        String url = pageDto.getGloc();
        url = URLEncoder.encode(url, "UTF-8");
        return("redirect:/review_main/"+url+"/1/");
    }

    @GetMapping("review_main/{gloc}/{page}")
    public String review_main(@PathVariable String gloc, @PathVariable String page, Model model) {
        PageDto pageDto1;
        if(gloc.equals("서울전체")) {
            pageDto1 = new PageDto(page, "review");
        }
        else {
            pageDto1 = new PageDto(page, "reviewSearch");
            pageDto1.setGloc(gloc);
        }

        PageDto pageDto = pageService.getPageResult(pageDto1);

        if(pageDto.getGloc().equals("")) {
            model.addAttribute("list", reviewService.listPage(pageDto));
        }
        else {
            model.addAttribute("list", reviewService.searchListPage(pageDto));
        }
        pageDto.setGloc(gloc);
        model.addAttribute("page", pageDto);
        return ("/review/review_main");
    }

    @GetMapping("manager_review_content/{rid}")
    public String manager_review_content(@PathVariable String rid, Model model) {
        ReviewDto reviewDto = reviewService.enter_content(rid);
        reviewDto.setRcontent(reviewDto.getRcontent().replace("\n", "<br>"));
        model.addAttribute("rvo",reviewDto);
        return("/manager/manager_review_content");
    }
}
