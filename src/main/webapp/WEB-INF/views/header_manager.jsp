<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/css/petcarepedia_song.css">
<link rel="stylesheet" href="http://localhost:9000/js/petcarepedia_jquery_song.js">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>
    <header>
        <div class="header-menu mhm">
            <div class="header-content">
                <a href="/">
                    <div class="header-logo">
                        <img src="http://localhost:9000/images/logo_white.png" width="60px" height="60px">
                        <span>PetCare Pedia</span>
                    </div>
                </a>
                
                <form name="headerSearchForm" action="/main_search" method="post">
                    <div class="header-search">
                        <div>
                            <input type="text" placeholder="동물병원명 검색" name="hname" id="hname-header">
                            <button type="button" id="btnMainSearch-header"><img src="http://localhost:9000/images/foot_pink.png" width="30px" height="30px"></button>
                        </div>
                    </div>
                </form>
                
                <div class="header-nav">
                	<c:choose>
						<c:when test="${sessionScope.svo == null}">
		                    <ul>
		                        <li>
		                            <a href="http://localhost:9000/search_main/">병원검색</a>
		                        </li>
		                        <li>
		                            <a href="http://localhost:9000/review_main/서울전체/1">리뷰사전</a>
		                        </li>
		                        <li>
		                            <a href="http://localhost:9000/login">로그인</a>
		                        </li>
		                        <li>
		                            <a href="http://localhost:9000/join_step1/">회원가입</a>
		                        </li>
		                        <li>
		                            <a href="http://localhost:9000/notice/1">공지사항</a>
		                        </li>
		                    </ul>
		                </c:when>
						<c:otherwise>
							<ul>
		                        <li>
		                            <a href="http://localhost:9000/search_main/">병원검색</a>
		                        </li>
		                        <li>
		                            <a href="http://localhost:9000/review_main/서울전체/1">리뷰사전</a>
		                        </li>
		                        <li>
									<c:choose>
										<c:when test="${sessionScope.svo.grade == 'user' || sessionScope.svo.grade == 'admin'}">
											<a href="http://localhost:9000/mypage_member_information/">마이페이지</a>
										</c:when>
										<c:otherwise>
											<a href="http://localhost:9000/manager_hospital_list/">마이페이지</a>
										</c:otherwise>
									</c:choose>
		                        </li>
		                        <li>
		                            <a id="logout">로그아웃</a>
		                        </li>
		                        <li>
		                            <a href="http://localhost:9000/notice/1">공지사항</a>
		                        </li>
		                    </ul>
						</c:otherwise>
					</c:choose>
                </div>
            </div>
        </div>
    </header>
    
    <script>
	    $("#btnMainSearch-header").click(function(){
			if($("#hname-header").val()==""){
				Swal.fire({
		            icon: 'info',                         
		            title: '검색어 미입력',         
		            text: '찾고싶은 동물병원의 이름을 입력해주세요', 
		            confirmButtonColor:'#98dfff',
		      	  	confirmButtonText:'확인'
		        });
			} else {
				headerSearchForm.submit();
			}
		});
	    
	    $(".header-menu").css("width",window.innerWidth).css("left","0").css("right","0");

	    $("#logout").click(function(){
	    	Swal.fire({
                title: '로그아웃하시겠습니까?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#FFB3BD',
                cancelButtonColor: '#98dfff',
                confirmButtonText: '로그아웃',
                cancelButtonText: '취소'
            }).then((result) => {
                if (result.isConfirmed) {
					$.ajax({
						url : "/logout",
						success : function(result){
							if(result=="success"){
								Swal.fire({
									icon: 'success',
									title: '로그아웃 성공',
									text: '다음에 다시 만나요!',
									confirmButtonColor:'#98dfff',
									confirmButtonText:'확인'
								}).then((result) => {
									if (result.isConfirmed) {
										location.href = "/";
									}//if
								});//swal
							}
						}//success
					});//ajax
                }
            })
	    })
    </script>
</body>
</html>