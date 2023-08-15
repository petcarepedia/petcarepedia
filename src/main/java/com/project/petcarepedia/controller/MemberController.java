package com.project.petcarepedia.controller;

import com.project.petcarepedia.dto.MemberDto;
import com.project.petcarepedia.dto.PetDto;
import com.project.petcarepedia.dto.SessionDto;
import com.project.petcarepedia.service.FileUploadService;
import com.project.petcarepedia.service.MailService;
import com.project.petcarepedia.service.MemberService;
import com.project.petcarepedia.service.PetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class MemberController {
    @Autowired
    MemberService memberService;

    @Autowired
    MailService mailService;

    @Autowired
    PetService petService;

    @Autowired
    FileUploadService fileService;

    /**
     * 로그인
     */
    @GetMapping("login")
    public String login(){ return "login/login"; }

    /**
     * 회원가입
     */
    @GetMapping("join_step1")
    public String join_step1(){ return "join/join_step1"; }

    @GetMapping("join_step2/{grade}")
    public String join_step2(@PathVariable String grade, Model model){
        model.addAttribute("grade", grade);
        return "join/join_step2";
    }

    @GetMapping("join_step3/{grade}")
    public String join_step3(@PathVariable String grade, Model model){
        model.addAttribute("grade", grade);
        return "join/join_step3";
    }

    @GetMapping("join_step4/{grade}/{email}")
    public String join_step4(@PathVariable String grade, @PathVariable String email, Model model){
        model.addAttribute("grade", grade);
        model.addAttribute("email", email);
        return "join/join_step4";
    }

    @PostMapping("join")
    public String join_proc(MemberDto memberDto, Model model){
        String viewName = "";

        if(memberService.join(memberDto) == 1){
            model.addAttribute("join_result", "success");
            viewName = "login/login";
        } else {
            model.addAttribute("join_result", "fail");
            viewName = "error";
        }

        return viewName;
    }

    /**
     * 아이디찾기
     */
    @GetMapping("find_id")
    public String find_id(){ return "login/login_idfind"; }
    @PostMapping("find_id")
    public String find_id_proc(MemberDto memberDto){
        String viewName = "";

        String mid = memberService.find(memberDto);
        if(mid != "" && mid != null) {
            mailService.idFindEmail(memberDto, mid);
            viewName = "login/login_idfind_success";
        } else viewName = "login/login_idfind_fail";

        return viewName;
    }

    @GetMapping("find_id_success")
    public String find_id_success(){ return "login/login_idfind_success"; }
    @GetMapping("find_id_fail")
    public String find_id_fail(){ return "login/login_idfind_fail"; }

    /**
     * 비밀번호찾기
     */
    @GetMapping("find_pw")
    public String find_pw(){ return "login/login_pwfind"; }
    @PostMapping("find_pw")
    public String find_pw_proc(MemberDto memberDto, Model model){
        String viewName = "";

        String mid = memberService.find(memberDto);
        if(mid != "" && mid != null) {
            model.addAttribute("mid", mid);
            viewName = "login/login_pwupdate";
        } else viewName = "login/login_pwfind_fail";

        return viewName;
    }

    @GetMapping("find_pw_fail")
    public String find_pw_fail(){ return "login/login_pwfind_fail"; }

    /**
     * 비밀번호 재설정
     */
    @GetMapping("update_pw")
    public String update_pw(){ return "login/login_pwupdate"; }
    @PostMapping("update_pw")
    public String update_pw_proc(MemberDto memberDto, HttpSession session, Model model){
        String viewName = "";

        if(memberService.updatePass(memberDto) == 1){
            session.invalidate();
            model.addAttribute("pwupdate_result", "success");
            viewName = "login/login";
        } else {
            model.addAttribute("pwupdate_result", "fail");
            viewName = "error";
        }

        return viewName;
    }

    @GetMapping("mypage_pet_information")
    public String mypage_pet_information(HttpSession session, Model model) {
        SessionDto svo = (SessionDto) session.getAttribute("svo");
        model.addAttribute("list", petService.list(svo.getMid()));
        return "mypage/mypage_pet_information";
    }

    @PostMapping("pet_write")
    public String pet_write(PetDto petDto) throws Exception{
        String viewName = "";
        int result = petService.insert(fileService.pfileCheck(petDto));
        if(result == 1) {
            if(!petDto.getFile1().isEmpty()) {
                fileService.pfileSave(petDto);
            }
            viewName = "redirect:/mypage_pet_information";
        } else {
            viewName = "error";
        }
        return viewName;
    }

    @PostMapping("pet_update")
    public String pet_update(PetDto petDto) throws Exception {
        String viewName = "";
        String oldFileName = petDto.getPsfile();
        int result = petService.update(fileService.pfileCheck(petDto));
        if(result == 1) {
            if(!petDto.getFile1().isEmpty()) {
                fileService.pfileSave(petDto);
                fileService.pfileDelete(petDto, oldFileName);
            }
            viewName = "redirect:/mypage_pet_information";
        } else {
            viewName = "error";
        }
        return viewName;
    }

    @GetMapping("pet_delete/{pid}/{psfile}")
    public String pet_delete(@PathVariable String pid, @PathVariable String psfile) throws Exception {
        String viewName = "";
        int result = petService.delete(pid);
        if(result == 1) {
            if(!psfile.equals("") || psfile != null){
                fileService.fileDelete(psfile);
            }
            viewName = "redirect:/mypage_pet_information";
        } else {
            viewName = "error";
        }
        return viewName;
    }
}
