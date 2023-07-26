package com.project.petcarepedia.controller;

import com.project.petcarepedia.dto.*;
import com.project.petcarepedia.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin/")
public class AdminController {

    @Autowired
    HospitalService hospitalService;
    @Autowired
    MemberService memberService;
    @Autowired
    BookingService bookingServcie;
    @Autowired
    PageService pageService;
    @Autowired
    FileUploadService fileUploadService;
    @Autowired
    ReviewReportService reviewReportService;


    /* 병원 관리 검색 */
    @GetMapping("manager/reserve_msearch/{page}/{hid}")
    public String hospital_reserve_msearch(HttpSession session ,@PathVariable String page,@PathVariable String hid, Model model){
        SessionDto svo =  (SessionDto) session.getAttribute("svo");
        PageDto pageDto = new PageDto(page, hid);
        pageDto.setHid(hid);
        pageDto.setMid(svo.getMid());
        pageDto = pageService.getPageResult(pageDto);
        model.addAttribute("list", bookingServcie.HBslist(pageDto));
        model.addAttribute("page", pageDto);

        return "admin/manager_reserve_msearch";
    }

    /* 병원 관리 예약하기 */
    @GetMapping("manager/reserve_list/{page}/{hid}")
    public String hospital_reserve_list(@PathVariable String page,@PathVariable String hid, Model model){
        PageDto pageDto = pageService.getPageResult(new PageDto(page, hid));
        pageDto.setHid(hid);
        model.addAttribute("list", bookingServcie.HBlist(pageDto));
        model.addAttribute("page", pageDto);
        return "admin/manager_reserve_list";
    }

    /* 신고 리뷰 삭제 처리 */
    @PostMapping("review_delete/")
    public String review_delete_proc(ReviewReportDto reviewReportDto) throws Exception {
        String oldFileName = reviewReportDto.getMsfile();
        int result = reviewReportService.reviewDelete(reviewReportDto.getRrid());
        if(result == 1){
            fileUploadService.fileDelete(oldFileName);
        }
        return "redirect:/admin/review_list/1/";
    }

    /* 신고 리뷰 삭제 페이지 */
    @GetMapping("review_delete2/{page}/{rrid}/")
    public String review_delete(@PathVariable String rrid, @PathVariable String page, Model model){
        model.addAttribute("review_report", reviewReportService.content(rrid));
        model.addAttribute("page", page);
        return "admin/review/admin_review_delete2";
    }

    /* 신고 리뷰 상세 페이지 */
    @GetMapping("review_detail/{page}/{rrid}/")
    public String review_detail(@PathVariable String rrid, @PathVariable String page, Model model){
        model.addAttribute("review_report", reviewReportService.content(rrid));
        model.addAttribute("page", page);
        return "admin/review/admin_review_detail";
    }
    
    /* 신고 리뷰 메인 페이지 */
    @GetMapping("review_list/{page}/")
    public String review_list(@PathVariable String page, Model model){
        PageDto pageDto = pageService.getPageResult(new PageDto (page, "review_report"));
        model.addAttribute("list", reviewReportService.RRlist(pageDto));
        model.addAttribute("page", pageDto);
        return "admin/review/admin_review_list";
    }

    /* 예약 검색 결과 페이지 */
    @GetMapping("reserve_msearch/{page}/{mid}")
    public String reserve_msearch(@PathVariable String page, @PathVariable String mid, Model model){
        PageDto pageDto = pageService.getPageResult(new PageDto(page, mid));
        pageDto.setMid(mid);
        model.addAttribute("list", bookingServcie.Bslist(pageDto));
        model.addAttribute("page", pageDto);

        return "admin/reserve/admin_reserve_msearch";
    }

    /* 예약 메인 페이지 */
    @GetMapping("reserve_list/{page}")
    public String reserve_list(@PathVariable String page, Model model){
        PageDto pageDto = pageService.getPageResult(new PageDto(page, "reserve"));
        model.addAttribute("list", bookingServcie.Blist(pageDto));
        model.addAttribute("page", pageDto);

        return "admin/reserve/admin_reserve_list";
    }
    
    /* 회원 상세 페이지 */
    @GetMapping("member_detail/{page}/{mid}/")
    public String member_content(@PathVariable String mid, @PathVariable String page, Model model){
        model.addAttribute("member", memberService.content(mid));
        model.addAttribute("page", page);
        return "admin/member/admin_member_detail";
    }

    /* 회원 검색 결과 페이지 */
    @GetMapping("member_msearch/{page}/{mid}")
    public String member_msearch(@PathVariable String page, @PathVariable String mid,Model model){
        PageDto pageDto = pageService.getPageResult(new PageDto(page, mid));
        pageDto.setMid(mid);
        model.addAttribute("list", memberService.mslist(pageDto));
        model.addAttribute("page", pageDto);
        return "admin/member/admin_member_msearch";
    }

    /* 회원 메인 페이지 */
    @GetMapping("member_list/{page}/")
    public String member_list(@PathVariable String page, Model model){
        PageDto pageDto = pageService.getPageResult(new PageDto(page, "member"));
        model.addAttribute("list", memberService.mlist(pageDto));
        model.addAttribute("page", pageDto);

        return "admin/member/admin_member_list";
    }

    /* 병원 삭제 처리 */
    @PostMapping("hospital_delete")
    public String hospital_delete_proc(HospitalDto hospitalDto) throws Exception{
        String oldFileName = hospitalDto.getHsfile();
        int result = hospitalService.delete(hospitalDto.getHid());
        if(result == 1){
            fileUploadService.fileDelete(oldFileName);
        }
        return "redirect:/admin/hospital_list/1/";
    }

    /* 병원 삭제 페이지 */
    @GetMapping("hospital_delete/{page}/{hid}/")
    public String hospital_delete(@PathVariable String hid, @PathVariable String page, Model model){
        model.addAttribute("hospital", hospitalService.content(hid));
        model.addAttribute("page", page);

        return "admin/hospital/admin_hospital_delete";
    }

    /* 병원 수정 처리 */
    @PostMapping("hospital_update")
    public String hospital_update_proc(HospitalDto hospitalDto) throws Exception{
        String oldFileName = hospitalDto.getHsfile();
        hospitalDto = fileUploadService.fileCheck(hospitalDto);
        int result = hospitalService.update(hospitalDto);
        if(result == 1){
            fileUploadService.fileDelete2(hospitalDto, oldFileName);
            fileUploadService.fileSave(hospitalDto);
        }
        return "redirect:/admin/hospital_list/1/";

    }

    /* 병원 수정 페이지 */
    @GetMapping("hospital_update/{page}/{hid}/")
    public String hospital_update(@PathVariable String hid, @PathVariable String page, Model model){
        model.addAttribute("hospital", hospitalService.content(hid));
        model.addAttribute("page", page);

        return "admin/hospital/admin_hospital_update";
    }

    /* 병원 등록 처리 */
    @PostMapping("/hospital_detail")
    public String hospital_write_proc(HospitalDto hospitalDto) throws Exception{
        hospitalDto = fileUploadService.fileCheck(hospitalDto);
        int result = hospitalService.insert(hospitalDto);
        if(result == 1){
            fileUploadService.fileSave(hospitalDto);
        }
        return "redirect:/admin/hospital_list/1/";
    }

    /* 병원 등록 페이지 */
    @GetMapping("hospital_detail")
    public String hospital_write(){
        return "admin/hospital/admin_hospital_detail";
    }

    /* 병원 상세 페이지 */
    @GetMapping("hospital_content/{page}/{hid}")
    public String hospital_content(@PathVariable String hid, @PathVariable String page, Model model){
        model.addAttribute("hospital", hospitalService.content(hid));
        model.addAttribute("page", page);

        return "admin/hospital/admin_hospital_content";
    }

    /* 지역구 검색 페이지 */
    @GetMapping("hospital_gsearch/{page}/{gloc}")
    public String hospital_list_gloc(@PathVariable String page, @PathVariable String gloc, Model model){
        PageDto pageDto = pageService.getPageResult(new PageDto(page, gloc));
        pageDto.setGloc(gloc);
        model.addAttribute("list", hospitalService.Hslist2(pageDto));
        model.addAttribute("page", pageDto);
        return "admin/hospital/admin_hospital_gsearch";
    }


    /* 병원명 검색 페이지 */
    @GetMapping("hospital_hsearch/{page}/{hname}")
    public String hospital_list_hname(@PathVariable String page, @PathVariable String hname, Model model){
        PageDto pageDto = pageService.getPageResult(new PageDto(page, hname));
        pageDto.setHname(hname);
        model.addAttribute("list", hospitalService.Hslist(pageDto));
        model.addAttribute("page", pageDto);
        return "admin/hospital/admin_hospital_hsearch";
    }

    /* 병원 메인 페이지 */
    @GetMapping("hospital_list/{page}/")
    public String hospital_list(@PathVariable String page, Model model){
        PageDto pageDto = pageService.getPageResult(new PageDto(page, "hospital"));
        model.addAttribute("list", hospitalService.Hlist(pageDto));
        model.addAttribute("page", pageDto);

        return "/admin/hospital/admin_hospital_list";
    }
}
