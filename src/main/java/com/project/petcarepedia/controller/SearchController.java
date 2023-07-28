package com.project.petcarepedia.controller;

import com.project.petcarepedia.dto.*;
import com.project.petcarepedia.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
public class SearchController {
    @Autowired
    private BookingService bookingService;
    @Autowired
    private BookmarkService bookmarkService;
    @Autowired
    private HospitalService hospitalService;
    @Autowired
    private ReviewLikeService reviewLikeService;
    @Autowired
    private ReviewService reviewService;


    /** search_main - 병원 리스트 출력하기 **/
    @GetMapping("search_main")
    public String search_main(Model model) {
        model.addAttribute("list", hospitalService.select());

        return "/search/search_main";
    }


    /** search_result - 병원 상세정보 **/
    @GetMapping("/search_result/{hid}")
    /*public String search_result(@PathVariable String hid, String rid, String filter, HttpSession session, Model model) {*/
    public String search_result(@PathVariable String hid, HttpSession session, Model model) {

        //session
        SessionDto svo = (SessionDto) session.getAttribute("svo");

        String mid;
        if(svo == null) {
            mid = "";
        } else {
            mid = svo.getMid();
        }


        model.addAttribute("hospital", hospitalService.content(hid)); //병원 정보 출력
        model.addAttribute("star", hospitalService.selectStar(hid)); //병원 별점 출력
        model.addAttribute("time", bookingService.selectTime2(hid)); //영업시간 출력

        //filter
        ArrayList<ReviewDto> RM_select = new ArrayList<>();
        RM_select = (ArrayList<ReviewDto>) reviewService.RM_select(hid);

        //check bookmark
        BookmarkDto bookmarkDto = new BookmarkDto();
        bookmarkDto.setHid(hid);
        bookmarkDto.setMid(mid);

        int bookmarkResult = bookmarkService.checkBookmark(bookmarkDto);
        model.addAttribute("bookmarkResult", bookmarkResult);

        //check like
        ReviewLikeDto reviewLikeDto = new ReviewLikeDto();
        reviewLikeDto.setMid(mid);

        for(ReviewDto review : RM_select) {
            String targetRid = review.getRid();
            reviewLikeDto.setRid(targetRid);
            int likeResult = reviewLikeService.idCheck(reviewLikeDto);
            review.setLikeresult(likeResult);
        }

        model.addAttribute("RM_select", RM_select);

        return "/search/search_result";
    }


    /** search_reservation **/
    @GetMapping("search_reservation/{hid}")
    public String search_reservation(@PathVariable String hid, HttpSession session, Model model) {
        //session
        SessionDto svo = (SessionDto) session.getAttribute("svo");

        String mid;
        if(svo == null) {
            mid = "";
        } else {
            mid = svo.getMid();
        }

        System.out.println("mid:"+mid + "hid:"+hospitalService.content(hid).getHid());
        System.out.println(svo.getGrade());

        model.addAttribute("hospital", hospitalService.content(hid));
        model.addAttribute("time", bookingService.selectTime2(hid));

        return "/search/search_reservation";
    }


    /** search_result_map - 병원 상세 지도 정보 **/
    /*
    @GetMapping("search_reseult_map")
    @ResponseBody
    public String search_result_map(@PathVariable String hid) {
        HospitalDto list = hospitalService.select(hid);

        JsonObject jobj = new JsonObject();
        jobj.addProperty("hid", list.getHid());
        jobj.addProperty("hname", list.getHname());
        jobj.addProperty("x", list.getX());
        jobj.addProperty("y", list.getY());

        return new Gson().toJson(jobj);
    }
*/


    /** reservationProc - 예약 처리 **/
    /*
    @PostMapping("reservation")
    @ResponseBody
    public String reservationProc(BookingDto bookingDto) {
        int check_result = bookingService.checkBooking(bookingDto);

        if(check_result == 0) {
            bookingService.insert(bookingDto);
            return "success";
        } else if(check_result == 1) {
            return "fail"; //중복예약
        }

        return "error"; //오류
    }
*/

    /** bookmark - 북마크 처리 **/
    /*
    @PostMapping("bookmark")
    @ResponseBody
    public String bookmarkProc(BookmarkDto bookmarkDto, @RequestParam("hid") String hid) {
        int result = bookmarkService.checkBookmark(bookmarkDto);

        if (result == 0) { //북마크 없을 때
            bookmarkService.insert(bookmarkDto);
            return "success";
        } else if (result == 1) { //북마크 있을 때
            bookmarkService.deleteBookmark(bookmarkDto);
            return "fail";
        }

        return "error"; //오류
    }
*/

    /** like - 좋아요 처리 **/
    /*
    @PostMapping("like")
    @ResponseBody
    public String likeProc(ReviewLikeDto reviewLikeDto, @RequestParam("hid") String hid) {
        int like_result = reviewLikeService.idCheck(reviewLikeDto);

        if(like_result == 0) { //기록 없음
            reviewLikeService.likesUpID(reviewLikeDto);
            reviewLikeService.likesUp(reviewLikeDto);

            return "success";
        } else if(like_result == 1) { //기록 있음
            reviewLikeService.likesDownID(reviewLikeDto);
            reviewLikeService.likesDown(reviewLikeDto);

            return "fail";
        }

        return "error"; //오류
    }
*/

    /** rstate - 신고하기 처리 -> 신고테이블 처리 **/
    /*
    @PostMapping("rstate")
    @ResponseBody
    public String rstateProc(ReviewReportDto reviewReportDto) {
        //중복신고 체크
        int result = reviewReportService.reviewReportCheck(reviewReportDto);

        if(result == 0) { //신고 없음
            reviewReportService.reviewReport(reviewReportDto);

            return "success";
        } else if (result == 1) { //신고 있음
            return "fail";
        }

        return "error";
    }
*/

}
