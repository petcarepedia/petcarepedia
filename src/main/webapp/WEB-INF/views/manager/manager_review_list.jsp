<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link href="http://localhost:9000/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
    <title>펫캐어피디아 | 리뷰 관리</title>
    <link rel="stylesheet" href="http://localhost:9000/css/manager_review_list.css">
    <script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
    <script src="http://localhost:9000/js/am-pagination.js"></script>
    <script src="http://localhost:9000/js/manager_review_list.js"></script>
    <script>
        $(document).ready(function(){
            var pager = jQuery('#ampaginationsm').pagination({

                maxSize: '${page.pageCount}', // max page size
                totals: '${page.dbCount}',	// total pages
                page: '${page.reqPage}', // initial page
                pageSize: '${page.pageSize}', // max number items per page

                // custom labels
                lastText: '&raquo;&raquo;',
                firstText: '&laquo;&laquo;',
                prevText: '&laquo;',
                nextText: '&raquo;',

                btnSize:'sm'	// 'sm'  or 'lg'
            });

            jQuery('#ampaginationsm').on('am.pagination.change',function(e){
                jQuery('.showlabelsm').text('The selected page no: '+e.page);
                $(location).attr('href', "http://localhost:9000/manager_review_list/"+e.page+"/");
            });

            /*호버 효과*/
            var allCells = $("td:nth-child(3)");

            allCells.on("mouseover", function() {
                var el = $(this);
                var row = el.closest('tr');

                // 해당 행의 모든 td 요소와 th 요소에 스타일 적용
                row.find('td, th').css({ "background": "#FFF2F4"});
            }).on("mouseout", function() {
                var el = $(this);
                var row = el.closest('tr');

                // 해당 행의 모든 td 요소와 th 요소의 스타일을 원래대로 복원
                row.find('td, th').css({ "background": "", "color": "" });
            });

        });
    </script>

    <script>
        $(document).ready(function () {
            $(".header-menu").css('background','#FFB3BD');
            $(".footer-menu").css('background','#FFF2F4');
            $("#btnMainSearch-header > img").attr("src",'http://localhost:9000/images/foot_pink.png');
        });
    </script>
</head>
<body>
<!-- header -->
    <jsp:include page="../header.jsp"></jsp:include>

    <div id = "content">
        <section id = "information">
            <h1 class="title">리뷰 관리</h1>
            <hr class="bar">
            <section id = "section1">
                <div>
                    <nav>
                        <ul>
                            <li>마이페이지</li>
                            <li><a href = "http://localhost:9000/manager_hospital_list">병원 정보 관리</a></li>
                            <li><a href = "http://localhost:9000/manager/reserve_list/1/">예약 관리</a></li>
                            <li><a href = "http://localhost:9000/manager_review_list/1/">리뷰 관리</a></li>
                            <li><a href = "http://localhost:9000/mypage_member_information">회원 정보</a></li>
                            <li><a href = "http://localhost:9000/mypage_signout">회원 탈퇴</a></li>
                        </ul>
                    </nav>
                </div>
            </section>

            <section id="section2">
                    <c:choose>
                        <c:when test="${auth eq 'auth'}">
                        <button type="button" class="stateBtn" data-hid="${hid}">신고접수 중</button>
                        <table class="reviewTable">
                            <tr>
                                <th>번호</th>
                                <th>아이디</th>
                                <th>내용</th>
                                <th>작성일</th>
                                <th>신고여부</th>
                            </tr>
                            <c:forEach var="reivew" items="${list}">
                                <tr>
                                    <td>${reivew.rno}</td>
                                    <td title="${reivew.mid}">${reivew.mid}</td>
                                    <td><a href="/manager_review_content/${reivew.rid}/">${reivew.rcontent}</a></td>
                                    <td>${reivew.rdate}</td>

                                    <c:choose>
                                        <c:when test="${reivew.likeresult == 0}">
                                            <td></td>
                                        </c:when>
                                        <c:when test="${reivew.likeresult != 0}">
                                            <td class="state">신고 접수 중</td>
                                        </c:when>
                                    </c:choose>
                                </tr>
                            </c:forEach>
                            <tr>
                                <td colspan="5">
                                    <div id="ampaginationsm"></div>
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <div id = "aside">
                                <section id = "section3">
                                    <div class="mhbox unauth">
                                        <i class="fa-solid fa-circle-check fa-3x" style="color: #ffb3bd;"></i>
                                        <p>병원 등록이 완료되지 않았습니다. <br>
                                            병원 등록 후 이용 가능합니다.</p>
                                    </div>
                                </section>
                            </div>
                        </c:otherwise>
                    </c:choose>


                </table>
            </section>
        </section>
    </div>

    <!-- footer -->
    <jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
