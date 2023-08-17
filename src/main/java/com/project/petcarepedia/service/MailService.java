package com.project.petcarepedia.service;

import com.project.petcarepedia.dto.MemberDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.util.Random;

@Service
public class MailService {
    @Autowired
    private JavaMailSender mailSender;

    private int authNumber;

    public void makeRandomNumber() {
        Random r = new Random();
        int checkNum = r.nextInt(888888) + 111111;
        authNumber = checkNum;
    }

    public String joinEmail(String email) {
        makeRandomNumber();
        String setFrom = "petcarepediaofficial@gmail.com";
        String toMail = email;
        String title = "펫케어피디아 회원 가입 인증 이메일 입니다.";
        String content =
                "<div style='width:410px; margin:0 auto; padding:30px 0;  text-align: center; '>" +
                        "        <h1 style='display: inline-block; vertical-align: top; color:#636363; '><span style='color:#FFB3BD'>펫</span>캐어<span style='color:#98DFFF'>피디아 </span></h1>" +
                        "        <img style='margin-top: 20px;' src='https://postfiles.pstatic.net/MjAyMzA2MTBfMTg4/MDAxNjg2NDA4OTM5MjE3.xeooMm_uyeWMiVyrIZgDk0YbHnGanlh1hrVfrspq7Xkg.L1aOIomPKf9fdWnDnuGmNGojChaLbGizj84F5nT_G9og.PNG.slee272/foot_blue.png?type=w966' width='30px'>" +
                        "        <div style='width:100%; margin:0 auto; padding:20px 0; border:1px solid #7AB2CC; border-left: none; border-right: none;'>" +
                        "            <h2 style='color:#7AB2CC'>이메일 인증 코드</h2>" +
                        "            <p style='font-size:13px; margin-bottom: 20px;'>" +
                        "                우리 동네 동물병원 리뷰 사전 <strong style='color:#7AB2CC'>펫캐어피디아</strong>에 오신 것을 환영합니다.<br>" +
                        "                아래의 인증코드를 입력하시면 이메일 인증이 정상적으로 완료됩니다." +
                        "            </p>" +
                        "            <h2 style='text-align: center; width:100%; background-color: #7AB2CC; margin: auto; padding: 10px 0; color:white; margin-bottom: 30px;'>"+authNumber+"</h2>" +
                        "        </div>" +
                        "        <div style='width:100%; margin:20px auto; text-align: left;'>" +
                        "            <p style='font-size:10px; color:gray; line-height: 16px;'>" +
                        "                본 메일은 발신 전용이며, 문의에 대한 회신은 처리되지 않습니다." +
                        "                <br>펫캐어피디아와 관련하여 궁금하신 점이나 불편한 사항은 사이트를 참고해주세요." +
                        "                <br>(주)펫캐어피디아 | 대표: 김연주 | 주소: 서울특별시 강남구 강변로 242" +
                        "                <br>문의: <a href='#'>petcarepedia@petcarepedia.com</a>" +
                        "                <br>Copyright <strong>PetCarePedia Inc.</strong> All rights reserved" +
                        "            </p>" +
                        "        </div>" +
                        "    </div>";
        mailSend(setFrom, toMail, title, content);
        return Integer.toString(authNumber);
    }

    public String idFindEmail(MemberDto memberDto, String mid) {
        String setFrom = "petcarepediaofficial@gmail.com";
        String toMail = memberDto.getEmail();
        String title = "펫케어피디아 아이디 확인 이메일 입니다.";
        String content =
                "<div style='width:410px; margin:0 auto; padding:30px 0;  text-align: center; '>" +
                        "        <h1 style='display: inline-block; vertical-align: top; color:#636363; '><span style='color:#FFB3BD'>펫</span>캐어<span style='color:#98DFFF'>피디아 </span></h1>" +
                        "        <img style='margin-top: 20px;' src='https://postfiles.pstatic.net/MjAyMzA2MTBfMTg4/MDAxNjg2NDA4OTM5MjE3.xeooMm_uyeWMiVyrIZgDk0YbHnGanlh1hrVfrspq7Xkg.L1aOIomPKf9fdWnDnuGmNGojChaLbGizj84F5nT_G9og.PNG.slee272/foot_blue.png?type=w966' width='30px'>" +
                        "        <div style='width:100%; margin:0 auto; padding:20px 0; border:1px solid #7AB2CC; border-left: none; border-right: none;'>" +
                        "            <h2 style='color:#7AB2CC'>아이디 찾기 결과</h2>" +
                        "            <p style='font-size:13px; margin-bottom: 20px;'>" +
                        "                우리 동네 동물병원 리뷰 사전 <strong style='color:#7AB2CC'>펫캐어피디아</strong>에 오신 것을 환영합니다.<br>" +
                        memberDto.getName()+"님께서 회원 가입 시 사용한 아이디는 아래와 같습니다." +
                        "            </p>" +
                        "            <h2 style='text-align: center; width:100%; background-color: #7AB2CC; margin: auto; padding: 10px 0; color:white; margin-bottom: 30px;'>"+mid+"</h2>" +
                        "        </div>" +
                        "        <div style='width:100%; margin:20px auto; text-align: left;'>" +
                        "            <p style='font-size:10px; color:gray; line-height: 16px;'>" +
                        "                본 메일은 발신 전용이며, 문의에 대한 회신은 처리되지 않습니다." +
                        "                <br>펫캐어피디아와 관련하여 궁금하신 점이나 불편한 사항은 사이트를 참고해주세요." +
                        "                <br>(주)펫캐어피디아 | 대표: 김연주 | 주소: 서울특별시 강남구 강변로 242" +
                        "                <br>문의: <a href='#'>petcarepedia@petcarepedia.com</a>" +
                        "                <br>Copyright <strong>PetCarePedia Inc.</strong> All rights reserved" +
                        "            </p>" +
                        "        </div>" +
                        "    </div>";
        mailSend(setFrom, toMail, title, content);
        return Integer.toString(authNumber);
    }

    public void mailSend(String setFrom, String toMail, String title, String content){
        MimeMessage message = mailSender.createMimeMessage();

        try {
            message.addRecipients(Message.RecipientType.TO, toMail);
            message.setSubject(title);
            message.setText(content, "utf-8", "html");
            message.setFrom(new InternetAddress(setFrom, "petcarepedia"));
            mailSender.send(message);
        } catch (MailException es){
            es.printStackTrace();
            throw new IllegalArgumentException();
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }

    }
}
