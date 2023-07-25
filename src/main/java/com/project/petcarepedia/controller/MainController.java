package com.project.petcarepedia.controller;

import com.project.petcarepedia.dto.HospitalDto;
import com.project.petcarepedia.dto.PageDto;
import com.project.petcarepedia.dto.SessionDto;
import com.project.petcarepedia.service.HospitalService;
import com.project.petcarepedia.service.PageService;
import com.project.petcarepedia.service.ReviewService;
import com.project.petcarepedia.service.SPWordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MainController {
    @Autowired
    ReviewService reviewService;

    @Autowired
    HospitalService hospitalService;

    @Autowired
    SPWordService spWordService;

    @Autowired
    PageService pageService;

    @PostMapping("main_search")
    public String main_search_proc(String hname, Model model){
        spWordService.insert(hname);
        List<Object> list = hospitalService.search(hname);

        model.addAttribute("list", list);
        model.addAttribute("size", list.size());
        model.addAttribute("shname", hname);

        return "search/search_main";
    }

    @GetMapping("best_review_list/{page}")
    public String best_review_list(@PathVariable String page, Model model){
        PageDto pageDto = pageService.getPageResult(new PageDto(page, "best_review"));
        model.addAttribute("list", reviewService.bestList(pageDto));
        model.addAttribute("page", pageDto);

        return "best_review_list";
    }

    @GetMapping("main_map")
    public String main_map(){
        return "main_map";
    }

    @GetMapping("error")
    public String error() {
        return "error";
    }

    @GetMapping("manager_hospital_list")
    public String manager_hospital_list(HttpSession session, Model model) {
        SessionDto svo = (SessionDto) session.getAttribute("svo");
//        model.addAttribute("hospital", hospitalService.selectMh(svo.getMid()));
        model.addAttribute("hospital", new HospitalDto());
        return "manager/manager_hospital_list";
    }
}
