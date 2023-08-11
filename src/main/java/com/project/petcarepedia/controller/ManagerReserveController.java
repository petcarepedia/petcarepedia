package com.project.petcarepedia.controller;

import com.project.petcarepedia.dto.HospitalDto;
import com.project.petcarepedia.dto.PageDto;
import com.project.petcarepedia.dto.SessionDto;
import com.project.petcarepedia.service.BookingService;
import com.project.petcarepedia.service.HospitalService;
import com.project.petcarepedia.service.PageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpSession;

@Controller
public class ManagerReserveController {
    @Autowired
    PageService pageService;
    @Autowired
    BookingService bookingService;
    @Autowired
    HospitalService hospitalService;

    /* 병원 관리 예약 하기 - 회원 아이디 검색 */
    @GetMapping("manager_reserve_msearch/{page}/{mid}")
    public String hospital_reserve_msearch(HttpSession session ,@PathVariable String page, @PathVariable String mid, Model model){
        SessionDto svo =  (SessionDto) session.getAttribute("svo");

        HospitalDto mh = hospitalService.selectMh(svo.getMid());
        String hid = "";
        if(mh != null) { // 병원 등록 시
            hid = mh.getHid();
        } else { // 병원 미등록 시
            hid = "H_0000";
        }

        PageDto pageDto = new PageDto(page, "manager_reserve_search");
        pageDto.setHid(hid);
        pageDto.setMid(mid);
        pageDto = pageService.getPageResult(pageDto);

        model.addAttribute("list", bookingService.HBslist(pageDto));
        model.addAttribute("page", pageDto);

        return "manager/manager_reserve_msearch";
    }

    /* 병원 관리 예약하기 */
    @GetMapping("manager_reserve_list/{page}")
    public String hospital_reserve_list(HttpSession session, @PathVariable String page, Model model){
        SessionDto svo =  (SessionDto) session.getAttribute("svo");

        HospitalDto mh = hospitalService.selectMh(svo.getMid());
        String hid = "";
        if(mh != null) { // 병원 등록 시
            hid = mh.getHid();
        } else { // 병원 미등록 시
            hid = "H_0000";
        }

        PageDto pageDto = new PageDto(page, "manager_reserve");
        pageDto.setHid(hid);
        pageDto = pageService.getPageResult(pageDto);

        model.addAttribute("list", bookingService.HBlist(pageDto));
        model.addAttribute("page", pageDto);
        return "manager/manager_reserve_list";
    }

    /*병원 관리 예약하기 - 상세보기*/
    @GetMapping("manager_reserve_content")
    public String reserve_content(Model model){
        return "manager_reserve_content";
    }


}
