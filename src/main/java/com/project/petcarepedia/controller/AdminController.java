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
import java.net.URLEncoder;
import java.util.List;

@Controller
@RequestMapping("/admin/")
public class AdminController {

    @Autowired
    HospitalService hospitalService;
    @Autowired
    MemberService memberService;
    @Autowired
    BookingService bookingService;
    @Autowired
    PageService pageService;
    @Autowired
    FileUploadService fileUploadService;
    @Autowired
    ReviewService reviewService;
    @Autowired
    ReviewReportService reviewReportService;




    /* 신고 리뷰 삭제 처리*/
    @PostMapping("review_delete")
    public String review_delete(ReviewDto reviewDto)throws Exception{
        String oldFileName = reviewDto.getMsfile();
        int result = reviewService.delete(reviewDto.getRid());
        if(result == 1){
            fileUploadService.fileDelete(oldFileName);
        }
        return "redirect:/admin/review_list/1/";
    }

    /* 신고 리뷰 삭제 페이지 */
    @GetMapping("review_delete2/{page}/{rid}/")
    public String review_delete(@PathVariable String rid, @PathVariable String page, Model model){
        model.addAttribute("review", reviewService.content(rid));
        model.addAttribute("page", page);
        return "admin/review/admin_review_delete2";
    }

    /* 신고 리뷰 취소 처리 */
    @PostMapping("review_report_delete")
    public String review_report_delete(ReviewReportDto reviewReportDto) throws Exception{
        String oldFileName = reviewReportDto.getMsfile();
        int result = reviewReportService.reviewDelete(reviewReportDto.getRrid());
        if(result == 1){
            fileUploadService.fileDelete(oldFileName);
        }
        return "redirect:/admin/review_list/1/";
    }

    /* 신고 리뷰 상세 페이지 */
    @GetMapping("review_detail/{page}/{rrid}")
    public String review_detail(@PathVariable String page, @PathVariable String rrid, Model model){
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
        PageDto pageDto = new PageDto(page, "booking_mid");
        pageDto.setMid(mid);
        pageDto = pageService.getPageResult(pageDto);

        model.addAttribute("list", bookingService.Bslist(pageDto));
        model.addAttribute("page", pageDto);

        return "admin/reserve/admin_reserve_msearch";
    }

    /* 예약 메인 페이지 */
    @GetMapping("reserve_list/{page}")
    public String reserve_list(@PathVariable String page, Model model){
        PageDto pageDto = pageService.getPageResult(new PageDto(page, "reserve"));
        model.addAttribute("list", bookingService.Blist(pageDto));
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
        PageDto pageDto = new PageDto(page, "member_mid");
        pageDto.setMid(mid);
        pageDto = pageService.getPageResult(pageDto);

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
        String[] oldFileName = {hospitalDto.getHsfile1(), hospitalDto.getHsfile2()};
        int result = hospitalService.delete(hospitalDto.getHid());
        if(result == 1){
            fileUploadService.hospitalMultiFileDelete2(oldFileName);
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
        String[] oldFileName = {hospitalDto.getHsfile1(), hospitalDto.getHsfile2()};
        hospitalDto = fileUploadService.hospitalMultiFileCheck(hospitalDto);
        int result = hospitalService.update(hospitalDto);
        if(result == 1){
            fileUploadService.hospitalMultiFileDelete(hospitalDto,oldFileName);
            fileUploadService.hospitalFileSave(hospitalDto);
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
        int result = hospitalService.insert(fileUploadService.hospitalMultiFileCheck(hospitalDto));
        if(result == 1){
            if(hospitalDto.getFiles()[0].getOriginalFilename() != null) {
                fileUploadService.hospitalFileSave(hospitalDto);
            }
        }
        return "redirect:/admin/hospital_list/1/";
    }

    /* 병원 등록 페이지 */
    @GetMapping("hospital_detail")
    public String hospital_write(){
        return "admin/hospital/admin_hospital_detail";
    }

    /* 병원 승인 여부 처리 */
    @PostMapping("/auth_update")
    public String auth_update(HospitalDto hospitalDto) throws Exception{
        int result = hospitalService.authUpdate(hospitalDto);
        return "redirect:/admin/hospital_list/1/";
    }

    /* 병원 등록 여부 상세 페이지 */
    @GetMapping("hospital_content2/{page}/{hid}/")
    public String hospital_content2(@PathVariable String hid, @PathVariable String page, Model model){
        model.addAttribute("hospital", hospitalService.content(hid));
        model.addAttribute("page", page);

        return "admin/hospital/admin_hospital_content2";
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
        PageDto pageDto = new PageDto(page, "hospital_gloc");
        pageDto.setGloc(gloc);
        pageDto = pageService.getPageResult(pageDto);

        model.addAttribute("list", hospitalService.Hslist2(pageDto));
        model.addAttribute("page", pageDto);
        return "admin/hospital/admin_hospital_gsearch";
    }


    /* 병원명 검색 페이지 */
    @GetMapping("hospital_hsearch/{page}/{hname}")
    public String hospital_list_hname(@PathVariable String page, @PathVariable String hname, Model model){
        PageDto pageDto = new PageDto(page, "hospital_hname");
        pageDto.setHname(hname);
        pageDto = pageService.getPageResult(pageDto);
        List<HospitalDto> list = hospitalService.Hslist(pageDto);

        model.addAttribute("list", list);
        model.addAttribute("page", pageDto);
        return "admin/hospital/admin_hospital_hsearch";
    }

    /* 병원 메인 페이지 */
    @GetMapping("hospital_list/{page}/")
    public String hospital_list(@PathVariable String page,HospitalDto hospitalDto, Model model){
        PageDto pageDto = pageService.getPageResult(new PageDto(page, "hospital"));

        if(hospitalDto.getAuth() == "auth"){
            model.addAttribute("list", hospitalService.AuthList(pageDto));
        } else if (hospitalDto.getAuth() == "unauth") {
            model.addAttribute("list", hospitalService.unAuthList(pageDto));
        }else {
            model.addAttribute("list", hospitalService.Hlist(pageDto));
        }
        model.addAttribute("page", pageDto);

        return "/admin/hospital/admin_hospital_list";
    }
}
