package com.project.petcarepedia.controller;

import com.project.petcarepedia.dto.*;
import com.project.petcarepedia.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import java.util.ArrayList;
import java.util.List;

@Controller
public class MypageController {
    @Autowired
    private BookmarkService bookmarkService;
    @Autowired
    private MemberService memberService;
    @Autowired
    private BookingService bookingService;
    @Autowired
    private ReviewService reviewService;
    @Autowired
    private PageService pageService;
    @Autowired
    private FileUploadService fileService;
    @Autowired
    private HospitalService hospitalService;

    // 나의 회원정보 폼
    @GetMapping("mypage_member_information")
    public String mypage_member_information(HttpSession session, Model model) {
        SessionDto svo = (SessionDto) session.getAttribute("svo");
        MemberDto memberDto = memberService.content(svo.getMid());
        model.addAttribute("member", memberDto);
        return "/mypage/mypage_member_information";
    }

    // 회원정보 수정 처리
    @PostMapping("member_update")
    public String member_update(MemberDto memberDto) throws Exception{
        String viewName = "";
        String oldFileName = memberDto.getMsfile();
        int result = memberService.update((MemberDto) fileService.mfileCheck(memberDto));
        if(result == 1) {
            if(!memberDto.getFile1().isEmpty()) {
                fileService.mfileSave(memberDto);
                fileService.mfileDelete(oldFileName);
            }
            viewName = "redirect:/mypage_member_information";
        }
        return viewName;
    }

    // 예약내역 폼
    @GetMapping("mypage_reservation")
    public String mypage_reservation(HttpSession session, Model model) {
        SessionDto svo = (SessionDto) session.getAttribute("svo");
        ArrayList<BookingDto> list = bookingService.search2(svo.getMid());
        ArrayList<BookingDto> list2 = bookingService.search4(svo.getMid());
        model.addAttribute("list", list);
        model.addAttribute("list2", list2);
        return "/mypage/mypage_reservation";
    }
    
    // 예약내역 삭제하기 폼
    @GetMapping("mypage_reservation_delete/{bid}/{page}")
    public String mypage_reservation_delete(@PathVariable String bid, @PathVariable String page, Model model) {
        model.addAttribute("booking", bookingService.select2(bid));
        return "/mypage/mypage_reservation_delete";
    }
    
    // 예약내역 삭제 처리
    @PostMapping("reservation_delete")
    public String reservation_delete(String bid) {
        String viewName = "";
        int result = bookingService.delete(bid);
        if(result == 1) {
            viewName = "redirect:/mypage_reservation";
        }
        return viewName;
    }

    //진료완료 리뷰작성기간 만료병원 삭제 처리
    @GetMapping("end_review_delete/{bid}")
    public String delete_booking(@PathVariable String bid) {
        String viewName = "";
        int result = bookingService.delete(bid);
        if(result == 1) {
            viewName = "redirect:/mypage_reservation2";
        }
        return viewName;
    }

    // 예약내역(진료완료) 폼
    @GetMapping("mypage_reservation2")
    public String mypage_reservation2(HttpSession session, Model model) {
        SessionDto svo = (SessionDto) session.getAttribute("svo");
        ArrayList<BookingDto> list = bookingService.search1(svo.getMid());
        ArrayList<BookingReviewDto> list2 = bookingService.search3(svo.getMid());
        model.addAttribute("list", list);
        model.addAttribute("list2", list2);
        return "/mypage/mypage_reservation2";
    }
    
    // 리뷰 쓰기 폼
    @GetMapping("mypage_review_write/{hid}/{bid}")
    public String mypage_review_write(@PathVariable String hid, @PathVariable String bid, HttpSession session, Model model) {
        SessionDto svo = (SessionDto) session.getAttribute("svo");
        model.addAttribute("member", memberService.content(svo.getMid()));
        model.addAttribute("hid", hid);
        model.addAttribute("bid", bid);
        return "/mypage/mypage_review_write";
    }
    
    // 리뷰 쓰기 처리
    @PostMapping("review_write")
    public String review_write(ReviewDto reviewDto) throws Exception {
        System.out.println(reviewDto.getHid());
        String viewName = "";
        int result = reviewService.insert(fileService.multiFileCheck(reviewDto));
        if(result == 1) {
            if(reviewDto.getFiles()[0].getOriginalFilename() != null) {
                fileService.multiFileSave(reviewDto);
            }
            viewName = "redirect:/mypage_my_review/1/";
        }
        return viewName;
    }
    
    // 내가 쓴 리뷰 폼
    @GetMapping("mypage_my_review/{page}")
    public String mypage_my_review(@PathVariable String page, HttpSession session, Model model) {
        SessionDto svo = (SessionDto) session.getAttribute("svo");
        PageDto pageDto = new PageDto(page, "my_review");
        pageDto.setMid(svo.getMid());
        pageDto = pageService.getPageResult(pageDto);
//        PageDto pageDto = new PageDto(page, svo.getMid());
//        pageDto = pageService.getPageResult(pageDto);
        List<ReviewDto> list = reviewService.Mylist(pageDto);
        model.addAttribute("page", pageDto);
        model.addAttribute("list", list);
        return "mypage/mypage_my_review";
    }

    // 리뷰 상세보기 폼
    @GetMapping("mypage_review_content/{rid}")
    public String mypage_review_content(@PathVariable String rid, Model model){
        model.addAttribute("review", reviewService.enter_content(rid));
        return "/mypage/mypage_review_content";
    }

    // 리뷰 수정하기 폼
    @GetMapping("mypage_review_revise/{rid}")
    public String mypage_review_revise(@PathVariable String rid, Model model) {
        model.addAttribute("review", reviewService.content(rid));
        return "/mypage/mypage_review_revise";
    }

    // 리뷰 수정 처리
    @PostMapping("review_update")
    public String review_update(ReviewDto reviewDto) throws Exception{
        String[] oldFileName = {reviewDto.getRsfile1(), reviewDto.getRsfile2()};
        String viewName = "";
        int result = reviewService.update(fileService.multiFileCheck(reviewDto));
        if(result == 1) {
            fileService.multiFileSave(reviewDto);
            fileService.multiFileDelete(reviewDto, oldFileName);
            viewName = "redirect:/mypage_review_content/" + reviewDto.getRid();
        } else {
            //오류페이지 호출
        }
        return viewName;
    }

    // 리뷰 삭제하기 폼
    @GetMapping("mypage_review_delete/{rid}")
    public String mypage_review_delete(@PathVariable String rid, Model model){
        model.addAttribute("review", reviewService.content(rid));
        return "/mypage/mypage_review_delete";
    }

    // 내가 쓴 리뷰 삭제 처리
    @PostMapping("my_review_delete")
    public String my_review_delete(ReviewDto reviewDto) throws Exception{
        String viewName = "";
        //ReviewDao reviewDao = new ReviewDao();
        int result = reviewService.delete(reviewDto.getRid());
        String[] oldFileName = {reviewDto.getRsfile1(),reviewDto.getRsfile2()};
        System.out.println(result);
        if(result == 1) {
            fileService.multiFileDelete(oldFileName);
            viewName = "redirect:/mypage_my_review/1/";
        }
        return viewName;
    }

    // 즐겨찾기 폼
    @GetMapping("mypage_bookmark")
    public String mypage_bookmark(HttpSession session, Model model){
        SessionDto svo = (SessionDto) session.getAttribute("svo");
        ArrayList<BookmarkDto> list = bookmarkService.select(svo.getMid());
        model.addAttribute("list", list);
        return "/mypage/mypage_bookmark";
    }

    //즐겨찾기 삭제
    @GetMapping("bookmark_delete/{bmid}")
    public String bookmark_delete(@PathVariable String bmid) {
        String viewName = "";
        int result = bookmarkService.delete(bmid);
        if(result == 1) {
            viewName = "redirect:/mypage_bookmark";
        }
        return viewName;
    }

    //회원탈퇴 폼
    @GetMapping("mypage_signout")
    public String mypage_signout(HttpSession session, Model model) {
        SessionDto svo = (SessionDto) session.getAttribute("svo");
        model.addAttribute("mid", svo.getMid());
        return "/mypage/mypage_signout";
    }

    //회원탈퇴 처리
    @PostMapping("member_delete")
    public String member_delete(HttpSession session, String pass) {
        String viewName = "";
        SessionDto svo = (SessionDto) session.getAttribute("svo");
        MemberDto memberDto = new MemberDto();
        memberDto.setMid(svo.getMid());
        memberDto.setPass(pass);
        int result = memberService.delete(memberDto);
        if(result == 1) {
            session.invalidate();
            viewName = "redirect:/login";
        } else {
            viewName = "redirect:/mypage_member_information";
        }
        return viewName;
    }

    //병원정보 수정 폼
    @GetMapping("manager_hospital_update")
    public String manager_hospital_info(HttpSession session, Model model) {
        SessionDto svo = (SessionDto) session.getAttribute("svo");
        HospitalDto hospitalDto = hospitalService.selectMh(svo.getMid());
        model.addAttribute("hospital", hospitalDto);
        return "/manager/manager_hospital_update";
    }

    //병원정보 등록 폼
    @GetMapping("manager_hospital_write")
    public String manager_hospital_write(HttpSession session) {
        SessionDto svo = (SessionDto)session.getAttribute("svo");
        return "/manager/manager_hospital_write";
    }

    //병원정보 등록 처리
    @PostMapping("hospital_write")
    public String hospital_write(HospitalDto hospitalDto) throws Exception{
        String viewName = "";
        int result = hospitalService.manager_insert(fileService.hospitalMultiFileCheck(hospitalDto));
        if(result == 1) {
            if(result == 1) {
                if(hospitalDto.getFiles()[0].getOriginalFilename() != null) {
                    fileService.hospitalFileSave(hospitalDto);
                }
                viewName = "redirect:/manager_hospital_list";
            }
        }
        return viewName;
    }
}
