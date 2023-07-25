<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="http://localhost:9000/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
    <title>펫캐어피디아 | 관리자 공지 관리</title>
    <link rel="stylesheet" href="http://localhost:9000/css/kang_manager_review_content.css">
    <script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/css/lightbox.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/js/lightbox.min.js"></script>
</head>
<body>

    <!-- header -->
    <jsp:include page="../header.jsp"></jsp:include>
    <div id = "content">
        <section id = "information">
            <h1 id = "title">리뷰 상세보기</h1>
            <hr>
            <section id = "section1">
                <div>
                    <nav>
                        <ul>
                            <li>마이페이지</li>
                            <li><a href = "/mypage_member_information">병원 관리</a></li>
                            <li><a href = "/mypage_reservation">예약 관리</a></li>
                            <li><a href = "/mypage_my_review/1/">리뷰 보기</a></li>
                            <li><a href = "/mypage_bookmark">정보 관리</a></li>
                            <li><a href = "/mypage_signout">회원 탈퇴</a></li>
                        </ul>
                    </nav>
                </div>
            </section>
            <section id="section2">
                <button type="button" id="review_manage">리뷰 관리 요청</button>
                <div class="review_detail">
                    <table class="rv_detail_menu">
                        <tr>
                            <th>병원이름</th>
                            <td>
                                <a href="/search_result.do/${rvo.hid }">
                                    ${rvo.hname }
                                </a>
                            </td>

                        </tr>
                        <tr>
                            <th>작성자</th>
                            <td><img src="http://localhost:9000/images/cat.png"><p>${rvo.nickname }</p></td>
                        </tr>
                        <tr>
                            <th>상세내용</th>
                            <td colspan='3'>
                                ${rvo.rcontent }
                            </td>
                        </tr>
                    </table>
                    <div class="table_right">
                        <div id="right_top">
                            <button type="button" id="btnLike" disabled>
                            <span class="review_like">
                                <!-- ♥️ -->
                                <img src="https://cdn-icons-png.flaticon.com/512/803/803087.png" alt="찜하기" style="height:14px; display: inline-block; vertical-align: -2px;">
                            </span>
                                    ${rvo.rlike }
                            </button>
                        </div>
                        <div id="star">
                            <div class="score" id="score_l">
                                평점
                            </div>
                            <div id="avg" class="score">
                                ⭐ ${rvo.rstar } / 5.0
                            </div>
                        </div>
                        <div id="imgArea">
                            <c:if test="${rvo.rsfile1 != null && rvo.rsfile1 != ''}">
                                <a href="http://localhost:9000/upload/${rvo.rsfile1 }" data-title="사진" data-lightbox="example-set"><img src="http://localhost:9000/upload/${rvo.rsfile1 }" alt=""></a>
                            </c:if>
                            <c:if test="${rvo.rsfile2 != null && rvo.rsfile2 != ''}">
                                <a href="http://localhost:9000/upload/${rvo.rsfile2 }" data-title="사진" data-lightbox="example-set"><img src="http://localhost:9000/upload/${rvo.rsfile2 }" alt=""></a>
                            </c:if>
                        </div>
                        <table>
                            <tr>
                                <td>작성일자</td>
                                <td>${rvo.rdate }</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="rc_button_r">
                    <a href="#"><button type="button" class="button">이전으로</button></a>
                </div>
            </section>
        </section>
    </div>

    <!-- footer -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>