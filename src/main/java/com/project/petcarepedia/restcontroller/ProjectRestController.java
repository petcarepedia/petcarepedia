package com.project.petcarepedia.restcontroller;

import com.project.petcarepedia.dto.*;
import com.project.petcarepedia.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class ProjectRestController {
    @Autowired
    MemberService memberService;
    @Autowired
    HospitalService hospitalService;
    @Autowired
    BookingService bookingService;
    @Autowired
    BookmarkService bookmarkService;
    @Autowired
    ReviewService reviewService;
    @Autowired
    ReviewLikeService reviewLikeService;
    @Autowired
    ReviewReportService reviewReportService;
    @Autowired
    SPWordService spWordService;
    @Autowired
    MailService mailService;

    @GetMapping("pass_check/{mid}/{pass}")
    public String pass_check(@PathVariable String mid, @PathVariable String pass) {
        MemberDto memberDto = new MemberDto();
        memberDto.setMid(mid);
        memberDto.setPass(pass);
        return String.valueOf(memberService.checkPass(memberDto));
    }


    @GetMapping("search_main_map/{gloc}")
    public Map search_main_map(@PathVariable String gloc) {
        Map map = new HashMap();
        if(gloc.equals("*")) {
            map.put("list", hospitalService.select());
        } else {
            map.put("list", hospitalService.searchGloc(gloc));
        }

        return  map;
    }


    /** search_result_map - 병원 상세 지도 정보 **/
    @GetMapping("search_result_map/{hid}")
    public Map search_result_map(@PathVariable String hid) {
        Map map = new HashMap();
        map.put("list", hospitalService.content(hid));

        return map;
    }


    /** 리뷰 정렬 **/
    @GetMapping("search_result/{hid}/{filter}/")
    public Map search_result(@PathVariable String hid, @PathVariable String filter, HttpSession session) {
        Map map = new HashMap();

        //session
        SessionDto svo = (SessionDto) session.getAttribute("svo");

        String mid;
        if(svo == null) {
            mid = "";
        } else {
            mid = svo.getMid();
        }

        ArrayList<ReviewDto> RM_select = new ArrayList<>();

        if(filter.equals("basic")) {
            RM_select = (ArrayList<ReviewDto>) reviewService.RM_select(hid);
        } else if(filter.equals("like")) {
            RM_select = (ArrayList<ReviewDto>) reviewService.RM_select2(hid);
        } else if(filter.equals("totalUp")) {
            RM_select = (ArrayList<ReviewDto>) reviewService.RM_select3(hid);
        } else if(filter.equals("totalDown")) {
            RM_select = (ArrayList<ReviewDto>) reviewService.RM_select4(hid);
        }

        //check like
        ReviewLikeDto reviewLikeDto = new ReviewLikeDto();
        reviewLikeDto.setMid(mid);

        for(ReviewDto review : RM_select) {
            String targetRid = review.getRid();
            reviewLikeDto.setRid(targetRid);
            int likeResult = reviewLikeService.idCheck(reviewLikeDto);
            review.setLikeresult(likeResult);
        }

        map.put("card", RM_select);

        return map;
    }


    /** reservationProc - 예약 처리 **/
    @GetMapping("reservation/{hid}")
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


    /** bookmark - 북마크 처리 **/
    @GetMapping("bookmark")
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


    /** like - 좋아요 처리 **/
    @GetMapping("like")
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


    /** rstate - 신고하기 처리 -> 신고테이블 처리 **/
    @GetMapping("rstate")
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

    /**
     * splist_data
     */
    @GetMapping("splist_data")
    public Map splist_data() {
        Map map = new HashMap();

        List<SPWordDto> list = spWordService.select();
        if(list != null && list.size() != 0) {
            map.put("list", list);
        } else {
            map.put("data", null);
        }

        return map;
    }

    /**
     * main_map_data
     */
    @GetMapping("main_map_data/{gloc}")
    public Map main_map_data(@PathVariable String gloc) {
        Map map = new HashMap();
        map.put("list", hospitalService.searchGloc(gloc));

        return map;
    }

    /**
     * pass_mulcheck - 비밀번호 중복체크
     */
    @GetMapping("pass_mulcheck/{mid}/{pass}")
    public String pass_mulcheck(@PathVariable String mid, @PathVariable String pass) {
        MemberDto memberDto = new MemberDto();
        memberDto.setMid(mid);
        memberDto.setPass(pass);
        return String.valueOf(memberService.checkPass(memberDto));
    }

    /**
     * id_check - 아이디 중복체크
     */
    @GetMapping("id_check/{mid}")
    public String id_check(@PathVariable String mid) {
        return String.valueOf(memberService.checkId(mid));
    }

    /**
     * mail_mulcheck - 이메일 중복체크
     */
    @GetMapping("mail_mulcheck/{email}")
    public String mail_mulcheck(@PathVariable String email) {
        return String.valueOf(memberService.checkMail(email));
    }

    /**
     * mail_check - 이메일 인증
     */
    @GetMapping("/mail_check/{email}")
    public String mail_check(@PathVariable String email) {
        return mailService.joinEmail(email);
    }

    /**
     * join_term_data - 회원가입 약관 상세보기
     */
    @GetMapping(value="join_term_data/{term}")
    @ResponseBody
    public Map join_term_data(@PathVariable String term) {
        Map map = new HashMap();

        String[] termNameList = {"서비스 이용약관", "개인정보 수집 및 이용약관", "위치기반 서비스 이용약관", "마케팅 정보 활용 및 수신"};
        String[] termList = {"< 팻케어피디아 >('http://localhost:9000/petcarepedia/index.do'이하 '팻케이피디아')은(는) 「개인정보 보호법」 제30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리방침을 수립·공개합니다.<br><br>○ 이 개인정보처리방침은 2023년 6월 12부터 적용됩니다.<br><br><br>제1조(개인정보의 처리 목적)<br><br>< 팻케어피디아 >('http://localhost:9000/petcarepedia/index.do'이하 '팻케이피디아')은(는) 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며 이용 목적이 변경되는 경우에는 「개인정보 보호법」 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.<br><br>1. 홈페이지 회원가입 및 관리<br>회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 서비스 부정이용 방지, 만14세 미만 아동의 개인정보 처리 시 법정대리인의 동의여부 확인 목적으로 개인정보를 처리합니다.<br><br>2. 재화 또는 서비스 제공<br>서비스 제공, 맞춤서비스 제공, 본인인증을 목적으로 개인정보를 처리합니다.<br><br>3. 마케팅 및 광고에의 활용<br>신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회 제공 등을 목적으로 개인정보를 처리합니다.<br><br><br>제2조(개인정보의 처리 및 보유 기간)<br><br>① < 팻케어피디아 >은(는) 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의받은 개인정보 보유·이용기간 내에서 개인정보를 처리·보유합니다.<br><br>② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.<br>1.<홈페이지 회원가입 및 관리><br><홈페이지 회원가입 및 관리>와 관련한 개인정보는 수집.이용에 관한 동의일로부터<3년>까지 위 이용목적을 위하여 보유.이용됩니다.<br>보유근거 : 홈페이지 회원가입 및 관리<br>관련법령 : 1)표시/광고에 관한 기록 : 6개월<br>2) 계약 또는 청약철회 등에 관한 기록 : 5년<br>3) 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년<br><br><br>제3조(처리하는 개인정보의 항목)<br><br>① < 팻케어피디아 >은(는) 다음의 개인정보 항목을 처리하고 있습니다.<br>1< 재화 또는 서비스 제공 ><br>필수항목 : 이름, 로그인ID, 비밀번호, 휴대전화번호, 쿠키, 접속 로그, 서비스 이용 기록<br>선택항목 : 생년월일, 이메일<br><br><br>제4조(개인정보의 제3자 제공에 관한 사항)<br>① < 팻케어피디아 >은(는) 개인정보를 제1조(개인정보의 처리 목적)에서 명시한 범위 내에서만 처리하며, 정보주체의 동의, 법률의 특별한 규정 등 「개인정보 보호법」 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.<br><br>② < 팻케어피디아 >은(는) 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.<br>1. < 동물병원 ><br>개인정보를 제공받는 자 : 동물병원<br>제공받는 자의 개인정보 이용목적 : 이름, 휴대전화번호",
                "제6조(개인정보의 파기절차 및 파기방법)<br><br>① < 팻케어피디아 > 은(는) 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.<br><br>② 정보주체로부터 동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.<br>1. 법령 근거 : 제 6조 개인정보 파기절차<br>2. 보존하는 개인정보 항목 : 계좌정보, 거래날짜<br><br>③ 개인정보 파기의 절차 및 방법은 다음과 같습니다.<br>1. 파기절차<br>< 팻케어피디아 > 은(는) 파기 사유가 발생한 개인정보를 선정하고, < 팻케어피디아 > 의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.<br>2. 파기방법<br>전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다<br><br><br>제7조(정보주체와 법정대리인의 권리·의무 및 그 행사방법에 관한 사항)<br>① 정보주체는 팻케어피디아에 대해 언제든지 개인정보 열람·정정·삭제·처리정지 요구 등의 권리를 행사할 수 있습니다.<br>② 제1항에 따른 권리 행사는팻케어피디아에 대해 「개인정보 보호법」 시행령 제41조제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 팻케어피디아은(는) 이에 대해 지체 없이 조치하겠습니다.<br>③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다.이 경우 “개인정보 처리 방법에 관한 고시(제2020-7호)” 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.<br>④ 개인정보 열람 및 처리정지 요구는 「개인정보 보호법」 제35조 제4항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.<br>⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.<br>⑥ 팻케어피디아은(는) 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.<br><br><br>제8조(개인정보의 안전성 확보조치에 관한 사항)<br>< 팻케어피디아 >은(는) 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다.<br><br>1. 개인정보 취급 직원의 최소화 및 교육<br>개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.<br><br>2. 정기적인 자체 감사 실시<br>개인정보 취급 관련 안정성 확보를 위해 정기적(분기 1회)으로 자체 감사를 실시하고 있습니다.<br><br>3. 개인정보에 대한 접근 제한<br>개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.<br><br>4. 접속기록의 보관 및 위변조 방지<br>개인정보처리시스템에 접속한 기록을 최소 1년 이상 보관, 관리하고 있으며,다만, 5만명 이상의 정보주체에 관하여 개인정보를 추가하거나, 고유식별정보 또는 민감정보를 처리하는 경우에는 2년이상 보관, 관리하고 있습니다.<br>또한, 접속기록이 위변조 및 도난, 분실되지 않도록 보안기능을 사용하고 있습니다.<br><br>5. 개인정보의 암호화<br>이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.<br><br>6. 해킹 등에 대비한 기술적 대책<br><팻케어피디아>('팻케이피디아')은 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신·점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다.<br><br><br>제9조(개인정보를 자동으로 수집하는 장치의 설치·운영 및 그 거부에 관한 사항)<br><br>① 팻케어피디아 은(는) 이용자에게 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용합니다.<br><br>② 쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC 컴퓨터내의 하드디스크에 저장되기도 합니다.<br>가. 쿠키의 사용 목적 : 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다.<br>나. 쿠키의 설치•운영 및 거부 : 웹브라우저 상단의 도구>인터넷 옵션>개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다.<br>다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.<br><br><br>제10조(행태정보의 수집·이용·제공 및 거부 등에 관한 사항)<br>행태정보의 수집·이용·제공 및 거부등에 관한 사항<br><개인정보처리자명>은(는) 온라인 맞춤형 광고 등을 위한 행태정보를 수집·이용·제공하지 않습니다.",
                "제1조(목적) <br>본 약관은 회원 (팻케어피디아의 서비스 약관에 동의한 자를 말하며 이하 '회원'이라고 합니다)이 팻케어피디아(이하 '회사'라고 합니다)가 제공하는 웹페이지의 서비스를 이용함에 있어 회원과 회사의 권리 및 의무, 기타 제반 사항을 정하는 것을 목적으로 합니다. <br><br><br>제2조(가입자격)<br>서비스에 가입할 수 있는 회원은 위치기반서비스를 이용할 수 있는 이동전화 단말기의 소유자 본인이어 야 합니다. <br><br><br>제3조(서비스 가입) <br>회사는 다음 각 호에 해당하는 가입신청을 승낙하지 않을 수 있습니다. <br>1. 실명이 아니거나 타인의 명의를 사용하는 등 허위로 신청하는 경우 <br>2. 고객 등록 사항을 누락하거나 오기하여 신청하는 경우 <br>3. 공공질서 또는 미풍양속을 저해하거나 저해할 목적을 가지고 신청하는 경우 <br>4. 기타 회사가 정한 이용신청 요건이 충족되지 않았을 경우 <br><br><br>제4조(서비스 해지) <br>회원은 회사가 정한 절차를 통해 서비스 해지를 신청할 수 있습니다. <br><br><br>제5조(이용약관의 효력 및 변경) <br>1. 본 약관은 서비스를 신청한 고객 또는 개인위치정보주체가 회사가 정한 소정의 절차에 따라 회원으로 등록함으로써 효력이 발생합니다. <br>2. 서비스를 신청한 고객 또는 개인위치정보주체가 온라인에서 본 약관을 모두 읽고 '동의하기' 버튼을 클릭 하였을 경우 본 약관의 내용을 모두 읽고 이를 충분히 이해하였으며, 그 적용에 동의한 것으로 봅니다. <br>3. 본 약관에 대하여 동의하지 않은 경우, 회사가 개인위치정보를 기반으로 제공하는 각종 혜택 및 편의제공에 일부 제한이 발생할 수 있습니다. <br>4. 회사는 필요한 경우 '위치 정보의 보호 및 이용 등에 관한 법률', '콘텐츠산업 진흥법', '전자상거래 등에서의 소비자보호에 관한 법률', '소비자기본법', '약관의 규제에 관한 법률 등 관계법령(이하 '관계법령'이라 합니다)의 범위 내에서 본 약관을 개정할 수 있습니다. <br>5. 회사가 약관을 개정할 경우 기존약관과 개정약관 및 개정약관의 적용일자와 개정사유를 명시하여 현행약관과 함께 그 적용일자 10일 전부터 적용일 이후 상당한 기간 동안 회사의 웹페이지를 통해 공지합니다. 다만, 개정약관의 내용이 회원에게 새로운 의무를 부과하거나 권리를 제한하는 내용인 경우 그 적용일자 30일 전부터 상당한 기간 동안 이를 회사의 웹페이지를 통해 공지하고, 회원에게 전자적 형태로 약관의 개정사실을 발송하여 고지합니다. <br><br><br>제6조(약관 외 준칙) <br>본 약관은 신의성실의 원칙에 따라 공정하게 적용하며, 본 약관에 명시되지 아니한 사항에 대하여는 관계법령 및 건전한 거래관행에 따릅니다. <br><br><br>제7조(서비스의 내용)<br>회사가 제공하는 서비스는 아래와 같습니다. <br>1. 위치기반 컨텐츠 분류를 위한 지오태깅(GeoTagging) <br>2. 회사 및 제휴사의 상품 및 서비스 정보 제공 <br>3. 길 안내 등 생활편의 서비스 제공 <br><br><br>제8조(서비스 이용요금) <br>1. 회사의 서비스는 무료제공을 원칙으로 합니다. 다만, 회원이 별도로 유료서비스를 이용하고자 할 경우 해당 서비스 화면에 명시된 요금을 지불하여야 사용할 수 있습니다. <br>2. 회사는 유료서비스 이용요금을 회사와 계약한 전자지불업체에서 정한 방법에 의하거나 회사가 정한 청구서에 합산하여 청구할 수 있습니다. <br>3. 유료서비스 이용을 위하여 결제된 대금에 대한 취소 및 환불은 관계법령과회사의 운영정책에 따릅니다. <br>4. 무선 서비스 이용시 발생하는 데이터 통신료는 별도이며, 이 때 부과되는 데이터 통신료는 회원이 가입한 각 이동통신사의 정책에 따릅니다. <br>5. 멀티미디어 메시지 서비스(MMS) 등으로 게시물을 등록할 경우 발생하는 요금은 각 이동통신사의 요금 정책에 따라 회원이 부담합니다. <br><br><br>제9조(서비스내용 변경 통지 등) <br>1. 회사가 서비스 내용을 변경하거나 종료하는 경우 회사는 회원이 등록한 전자우편 주소로 이메일을 발송하여 서비스 내용의 변경 사항 또는 종료를 사전 일주일 전에 통지합니다. <br>2. 전항의 경우 불특정 다수의 회원을 상대로 통지하는 때에는 회사의 웹페이지 등을 통해 공지함으로써 회원들에게 통지할 수 있습니다. <br><br><br>제10조(서비스이용의 제한 및 중지) <br><br>1. 회사는 아래 각 호에 해당하는 사유가 발생한 경우에는 회원의 서비스 이용을 제한하거나 중지시킬 수 있습니다. <br>가. 회원이 회사의 서비스 운영을 고의 또는 과실로 방해하는 경우 <br>나. 서비스용 설비 점검, 보수 또는 공사로 인하여 부득이한 경우 <br>다. 전기통신사업법에 규정된 기간통신사업자가 서비스를 중지했을 경우 <br>라. 국가비상사태, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 서비스 이용에 지장이 있는 때 마. 기타 중대한 사유로 회사가 서비스 제공을 지속하는 것이 곤란한 경우 <br><br>2. 회사가 전항에 따라 서비스의 이용을 제한하거나 중지한 때에는 해당사실을 인터넷 등에 공지하거나 고객에게 통지합니다. 다만 회사가 통제할 수 없는 사유로 인하여 서비스를 중단하게 되는 경우 이를 사후에 통지할 수 있습니다. <br>가. 개인위치정보를 수집한 통신단말장치가 문자, 음성 또는 영상 수신기능을 갖추지 아니한 경우 <br>나. 회원이 다른 방법을 요청한 경우 <br><br><br>제11조(개인위치정보 주체의 권리) <br><br>1. 회원은 회사에 대하여 언제든지 개인위치정보를 이용한 위치기반서비스 제공 및 개인위치정보의 제3자 제공에 대한 동의의 전부 또는 일부를 철회할 수 있습니다. 이 경우 회사는 수집한 개인위치정보 및 위치 정보 이용, 제공사실 확인자료를 파기합니다. <br><br>2. 회원은 회사에 대하여 언제든지 개인위치정보의 수집, 이용 또는 제공의 일시적인 중지를 요구할 수 있습니다. <br><br>3. 회원은 회사에 대하여 아래 각 호의 자료에 대한 열람 또는 고지를 요구할 수 있고, 당해 자료에 오류가 있 는 경우에는 그 정정을 요구할 수 있습니다. 이 경우 회사는 정당한 사유 없이 회원의 요구를 거절할 수 없 습니다. <br>가. 본인에 대한 위치정보 이용, 제공사실 확인자료 <br>나. 본인의 위치정보가 제3자에게 제공된 이유 및 내용 <br><br>4. 회원은 회사가 정한 절차에 따라 제1항 내지 제3항의 권리를 행사할 수 있습니다. <br><br><br>제12조(법정대리인의 권리) <br><br>1.회사는 14세 미만 회원에 대해서는 당해 회원과 회원의 법정대리인으로부터 모두 동의를 받은 경우에만 개인위치정보를 이용한 서비스를 제공합니다. 이 경우 법정대리인은 본 약관에 의한 회원의 권리를 모두 가지며 회사는 법정대리인을 회원으로 봅니다.<br><br>2. 회사는 14세 미만 회원의 개인위치정보 및 위치정보 이용, 제공사실에 관한 확인자료를 본 약관에 명시 또 는 고지한 범위를 넘어 이용하거나 제3자에게 제공하고자 하는 경우 당해 회원과 회원의 법정대리인에게 모두 동의를 받아야합니다. 다만 다음 각호의 경우는 제외합니다. <br>가. 개인위치정보 및 위치기반서비스 제공에 따른 요금정산을 위하여 위치정보 이용, 제공사실 확인자료가 필요한 경우 <br>나. 통계작성, 학술연구 또는 시장조사를 위하여 특정 개인을 알아볼 수 없는 형태로 가공하여 제공하는 경우 <br>다. 기타 관계법령에 특별한 규정이 있는 경우 <br><br><br>제13조(위치정보관리책임자의 지정) <br>1. 회사는 위치정보를 적절히 관리, 보호하고 개인위치정보주체의 불만을 원활히 처리할 수 있도록 실질적인 책임을 질 수 있는 지위에 있는 자를 위치정보의 관리책임자로 지정하고 운영합니다. <br>2. 회사의 위치정보관리책임자는 위치기반서비스의 제공에 관한 제반 사항을 담당·관리하는 부서의 총괄 팀장으로서, 구체적인 사항은 본 약관의 부칙에 따릅니다. <br><br><br>제14조(손해배상) <br>1. 회사가 위치정보의 보호 및 이용 등에 관한 법률 제15조 내지 제26조의 규정을 위반한 행위를 하여 회원에게 손해가 발생한 경우 회원은 회사에 대하여 손해배상 청구를 할 수 있습니다. <br>2. 회원이 고의 또는 과실로 본 약관의 규정을 위반하여 회사에 손해가 발생한 경우 회원은 회사에 발생한 모든 손해를 배상해야 합니다. <br><br><br>제15조(면책) <br><br>1. 회사는 다음 각 호의 사유로 서비스를 제공할 수 없는 경우 이로 인하여 회원에게 발생한 손해에 대한 책임을 부담하지 않습니다. <br>가. 천재지변 또는 이에 준하는 불가항력의 상태가 있는 경우 <br>나. 제3자의 고의적인 서비스 방해가 있는 경우 <br>다. 회원의 귀책사유로 서비스 이용에 장애가 있는 경우 <br>라. 기타 회사의 고의 또는 과실이 없는 사유에 해당하는 경우 <br><br>2. 회사는 서비스 및 서비스에 게재된 정보, 자료, 사실의 신뢰도 및 정확성 등에 대한 보증을 하지 않으며 이로 인하여 회원에게 발생한 손해에 대하여 책임을 부담하지 않습니다. <br><br>3. 회사는 회원이 서비스를 이용하며 기대하는 수익을 상실한 것에 대한 책임과, 그 밖의 서비스를 통하여 얻은 자료로 인하여 회원에게 발생한 손해에 대한 책임을 부담하지 않습니다. <br><br><br>제16조(분쟁의 조정) <br>1. 회사는 위치정보와 관련된 분쟁에 대해 당사자간 협의가 이루어지지 아니하거나 협의를 할 수 없는 경우 에는 '위치정보의 보호 및 이용 등에 관한 법률' 제28조의 규정에 따라 방송통신위원회에 재정을 신청할 수 있습니다. <br>2. 회사 또는 고객은 위치정보와 관련된 분쟁에 대해 당사자간 협의가 이루어지지 아니하거나 협의를 할 수 없는 경우에는 '개인정보보호법' 제43조의 규정에 따라 개인정보분쟁조정위원회에 조정을 신청할 수 있습 니다. <br><br><br>제17조(회사의 연락처) <br>회사의 상호 및 주소 등은 다음과 같습니다. <br>부칙 <br>1. 법인명: 팻케어피디아 <br>2. 대표이사 : 김연주 <br>3. 소재지 : <br>4. 연락처: <br><br><br>제1조(시행일) <br>본 약관은 2023.06.12부터 시행합니다. <br><br><br>제2조(위치정보관리책임자) <br>위치정보관리책임자는 2023.05.01를 기준으로 다음과 같이 지정합니다. <br>1. 소속: 팻케어피디아 <br>2. 성명 : 김연주 <br>3. 직위: 총괄팀장 <br>4. 전화 : 02-1234-5678",
                "제11조(추가적인 이용·제공 판단기준)<br>< 팻케어피디아 > 은(는) ｢개인정보 보호법｣ 제15조제3항 및 제17조제4항에 따라 ｢개인정보 보호법 시행령｣ 제14조의2에 따른 사항을 고려하여 정보주체의 동의 없이 개인정보를 추가적으로 이용·제공할 수 있습니다. 이에 따라 < 팻케어피디아 > 가(이) 정보주체의 동의 없이 추가적인 이용·제공을 하기 위해서 다음과 같은 사항을 고려하였습니다.<br>▶ 개인정보를 추가적으로 이용·제공하려는 목적이 당초 수집 목적과 관련성이 있는지 여부<br>▶ 개인정보를 수집한 정황 또는 처리 관행에 비추어 볼 때 추가적인 이용·제공에 대한 예측 가능성이 있는지 여부<br>▶ 개인정보의 추가적인 이용·제공이 정보주체의 이익을 부당하게 침해하는지 여부<br>▶ 가명처리 또는 암호화 등 안전성 확보에 필요한 조치를 하였는지 여부<br>※ 추가적인 이용·제공 시 고려사항에 대한 판단기준은 사업자/단체 스스로 자율적으로 판단하여 작성·공개함<br><br><br>제12조(가명정보를 처리하는 경우 가명정보 처리에 관한 사항)<br>< 팻케어피디아 > 은(는) 다음과 같은 목적으로 가명정보를 처리하고 있습니다.<br>▶ 가명정보의 처리 목적<br>▶ 가명정보의 처리 및 보유기간<br>▶ 가명정보의 제3자 제공에 관한 사항(해당되는 경우에만 작성)<br>▶ 가명정보 처리의 위탁에 관한 사항(해당되는 경우에만 작성)<br>▶ 가명처리하는 개인정보의 항목<br>▶ 법 제28조의4(가명정보에 대한 안전조치 의무 등)에 따른 가명정보의 안전성 확보조치에 관한 사항<br><br><br>제13조 (개인정보 보호책임자에 관한 사항)<br>① 팻케어피디아 은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.<br>▶ 개인정보 보호책임자<br>성명 :김연주<br>직책 :팀장<br>직급 :팀장<br>연락처 :02-0000-0000, owner@petcarepedia.com,<br>※ 개인정보 보호 담당부서로 연결됩니다.<br><br><br>제16조(정보주체의 권익침해에 대한 구제방법)<br>정보주체는 개인정보침해로 인한 구제를 받기 위하여 개인정보분쟁조정위원회, 한국인터넷진흥원 개인정보침해신고센터 등에 분쟁해결이나 상담 등을 신청할 수 있습니다. 이 밖에 기타 개인정보침해의 신고, 상담에 대하여는 아래의 기관에 문의하시기 바랍니다.<br>1. 개인정보분쟁조정위원회 : (국번없이) 1833-6972 (www.kopico.go.kr)<br>2. 개인정보침해신고센터 : (국번없이) 118 (privacy.kisa.or.kr)<br>3. 대검찰청 : (국번없이) 1301 (www.spo.go.kr)<br>4. 경찰청 : (국번없이) 182 (ecrm.cyber.go.kr)<br>「개인정보보호법」제35조(개인정보의 열람), 제36조(개인정보의 정정·삭제), 제37조(개인정보의 처리정지 등)의 규정에 의한 요구에 대 하여 공공기관의 장이 행한 처분 또는 부작위로 인하여 권리 또는 이익의 침해를 받은 자는 행정심판법이 정하는 바에 따라 행정심판을 청구할 수 있습니다.<br>※ 행정심판에 대해 자세한 사항은 중앙행정심판위원회(www.simpan.go.kr) 홈페이지를 참고하시기 바랍니다.<br><br><br>제18조(개인정보 처리방침 변경)<br>① 이 개인정보처리방침은 2023년 6월 12부터 적용됩니다.<br>② 이전의 개인정보 처리방침은 아래에서 확인하실 수 있습니다."};

        map.put("name", termNameList[Integer.parseInt(term)-1]);
        map.put("content", termList[Integer.parseInt(term)-1]);

        return map;
    }

    /**
     * 로그인
     */
    @PostMapping("login")
    public Map login_proc(@RequestParam("mid") String mid, @RequestParam("pass") String pass, @RequestParam("rememberMid") String rememberMid, HttpSession session, HttpServletResponse response){
        MemberDto memberDto = new MemberDto();
        memberDto.setMid(mid);
        memberDto.setPass(pass);

        Map map = new HashMap();
        SessionDto sessionDto = memberService.login(memberDto);
        if(sessionDto != null) {
            if(sessionDto.getLoginResult() == 1){
                session.setAttribute("svo", sessionDto);

                Cookie cookie = new Cookie("user_check", sessionDto.getMid());
                if(rememberMid.equals("true")){
                    response.addHeader("result", "true");
                    response.addCookie(cookie);
                } else {
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                }

                map.put("name", sessionDto.getName());
                map.put("result", "1");
            }
        } else map.put("result", "0");

        return map;
    }

    /**
     * 로그아웃
     */
    @GetMapping("logout")
    public String logout(HttpSession session) {
        SessionDto sessionDto = (SessionDto)session.getAttribute("svo");
        if(sessionDto != null) {
            session.invalidate();
        }
        return "success";
    }
}
