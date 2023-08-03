package com.project.petcarepedia.controller;

import com.project.petcarepedia.dto.PageDto;
import com.project.petcarepedia.dto.SessionDto;
import com.project.petcarepedia.service.BookingService;
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

    /* 병원 관리 예약 하기 - 회원 아이디 검색 */
    @GetMapping("manager_reserve_msearch/{page}/{hid}/{mid}")
    public String hospital_reserve_msearch(HttpSession session , @PathVariable String page, @PathVariable String hid, @PathVariable String mid, Model model){
        SessionDto svo =  (SessionDto) session.getAttribute("svo");
        PageDto pageDto = pageService.getPageResult(new PageDto(page, mid));

        pageDto.setHid(hid);
        pageDto.setMid(mid);
        System.out.println(pageDto.getHid());
        System.out.println(pageDto.getMid());

        model.addAttribute("list", bookingService.HBslist(pageDto));
        model.addAttribute("page", pageDto);

        return "manager/manager_reserve_msearch";
    }

    /* 병원 관리 예약하기 */
    @GetMapping("manager_reserve_list/{page}/{hid}")
    public String hospital_reserve_list(@PathVariable String page,@PathVariable String hid, Model model){
        PageDto pageDto = pageService.getPageResult(new PageDto(page, hid));
        pageDto.setHid(hid);
        model.addAttribute("list", bookingService.HBlist(pageDto));
        model.addAttribute("page", pageDto);
        return "manager/manager_reserve_list";
    }
}
