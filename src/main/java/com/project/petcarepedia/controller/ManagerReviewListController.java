package com.project.petcarepedia.controller;

import com.project.petcarepedia.dto.HospitalDto;
import com.project.petcarepedia.dto.PageDto;
import com.project.petcarepedia.dto.ReviewDto;
import com.project.petcarepedia.dto.SessionDto;
import com.project.petcarepedia.service.HospitalService;
import com.project.petcarepedia.service.PageService;
import com.project.petcarepedia.service.ReviewReportService;
import com.project.petcarepedia.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ManagerReviewListController {
    @Autowired
    ReviewService reviewService;
    @Autowired
    PageService pageService;
    @Autowired
    ReviewReportService reviewReportService;
    @Autowired
    HospitalService hospitalService;

    /*리뷰 리스트*/
    @GetMapping("manager_review_list/{page}/")
    public String manager_review_list(@PathVariable String page, HttpSession session, Model model) {
        SessionDto svo = (SessionDto) session.getAttribute("svo");

        HospitalDto mh = hospitalService.selectMh(svo.getMid());
        String hid = "";

        if(mh != null) { // 병원 등록 시
            hid = mh.getHid();
            model.addAttribute("auth", mh.getAuth());
            
        } else { // 병원 미등록 시
            hid = "H_0000";
        }

        PageDto pageDto = new PageDto(page, "manager_review");
        pageDto.setHid(hid);
        pageDto = pageService.getPageResult(pageDto);
        List<ReviewDto> list = reviewService.MRlist(pageDto);

        /* string rid */
        for(ReviewDto review : list) {
            String targetRid = review.getRid();
            int state = reviewReportService.MRRlist(targetRid);
            review.setLikeresult(state);
        }

        model.addAttribute("list", list);
        model.addAttribute("page", pageDto);

        return "/manager/manager_review_list";
    }

}
