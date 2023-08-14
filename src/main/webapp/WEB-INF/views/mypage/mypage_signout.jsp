<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://localhost:9000/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
<title>펫캐어피디아 | 회원탈퇴</title>
<link rel="stylesheet" href="http://localhost:9000/css/mypage.css">
<link rel="stylesheet" href="http://localhost:9000/css/petcarepedia_song.css">
<link rel="stylesheet" href="http://localhost:9000/css/petcarepedia_song_manager.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/petcarepedia_jquery_yeol.js"></script>
	<script>
		$(document).ready(function () {
			if($("#grade").val()=='manager'){
				$(".manager-menu > ul > li > a").mouseover(function (){$(this).css('color','#FFB3BD');});
				$(".manager-menu > ul > li > a").mouseleave(function (){$(this).css('color','#3d3d3d');});
			}
		})
	</script>
</head>
<body>
	<!-- header -->
	<c:choose>
		<c:when test="${sessionScope.svo.grade=='manager'}">
	 		<jsp:include page="../header_manager.jsp"></jsp:include>
		</c:when>
		<c:otherwise>
			<jsp:include page="../header.jsp"></jsp:include>
		</c:otherwise>
	</c:choose>
	<div id = "content2" style="margin-top: 140px;">
		<section id = "signout">
			<h1 id = "title">회원 탈퇴하기</h1>
			<hr>
			<form name="deleteForm" action="member_delete" method="post">
				<input type="hidden" name="grade" id="grade" value="${sessionScope.svo.grade}">
					<section id = "section1">
						<div>
						<c:choose>
							<c:when test="${sessionScope.svo.grade=='manager'}">
								<nav class="manager-menu">
									<ul>
										<li style = "color: #ffb3bd; border-color: #ffb3bd">마이페이지</li>
										<li><a href = "/manager_hospital_list">병원 정보 관리</a></li>
										<li><a href = "/manager_reserve_list/1/">예약 관리</a></li>
										<li><a href = "/manager_review_list/1/">리뷰 관리</a></li>
										<li><a href = "/manager_information">회원 정보</a></li>
										<li><a href = "/mypage_signout">회원 탈퇴</a></li>
									</ul>
								</nav>
							</c:when>
							<c:otherwise>
								<nav>
									<ul>
										<li>마이페이지</li>
										<li><a href = "/mypage_member_information">회원 정보</a></li>
										<li><a href = "/mypage_pet_information">반려동물 정보</a></li>
										<li><a href = "/mypage_reservation">예약 내역</a></li>
										<li><a href = "/mypage_my_review/1/">내가 쓴 리뷰</a></li>
										<li><a href = "/mypage_bookmark" style="font-weight: normal">즐겨찾기</a></li>
										<li><a href = "/mypage_signout" style="font-weight: bold">회원 탈퇴</a></li>
									</ul>
								</nav>
							</c:otherwise>
						</c:choose>
						</div>
					</section>

					<div class="outbox">
						<div class="outexbox">
							<div class="outtitle">
								<i class="fa-solid fa-circle-exclamation fa-xl" style="color: #f95f5c;margin-right: 5px; "></i>
								<c:choose>
									<c:when test="${sessionScope.svo.grade=='manager'}">사업자</c:when>
									<c:otherwise>개인</c:otherwise>
								</c:choose>
								회원 탈퇴 전 확인해주세요
							</div>

							<ul class="outex">
								<li>회원 탈퇴 시 <span>개인정보는 즉시 파기</span>되며, <span>복구가 불가</span>합니다.</li>
								<li>회원 탈퇴 시 해당 계정의 모든 <span>예약 내역</span> 및 <span>스크랩 정보</span>가 사라지며, <span>작성하셨던 후기</span> 또한 <span>삭제</span>됩니다.</li>
								<li>회원 탈퇴 후 <span>3일 간 재가입이 불가</span>합니다.</li>
							</ul>

							<c:if test="${sessionScope.svo.grade=='manager'}">
								<div class="outdelhos">
									<div class="outtitle subtitle">
										<i class="fa-solid fa-square-minus" style="color: #599ebf;margin-right: 5px; "></i>
										병원 정보 삭제 여부 선택
									</div>
									<ul class="outradio">
										<li>
											<input type="radio" name="deletemh" value="t" checked><p>병원 정보 함께 삭제</p>
										</li>
										<li>
											<input type="radio" name="deletemh" value="f"><p>회원 정보만 삭제</p>
										</li>
									</ul>
								</div>
							</c:if>

						</div>

						<div class="outpwbox">
							<div class="outpw">
								<i class="fa-solid fa-lock" style="color: #41c8a6;"></i>
								<p>회원 탈퇴 처리를 위해 비밀번호를 다시 한번 입력해주세요.</p>
								<input type = "hidden" name = "mid" id = "mid" value = "${sessionScope.svo.mid}">
								<input type = "password" name = "pass" id = "pass" placeholder = "비밀번호 입력">
								<button type = "button" id = "btnMemberDelete">회원탈퇴</button>
							</div>
						</div>

					</div>
			</form>
		</section>
	</div>
	<c:choose>
		<c:when test="${sessionScope.svo.grade=='manager'}">
			<jsp:include page="../footer_manager.jsp"></jsp:include>
		</c:when>
		<c:otherwise>
			<jsp:include page="../footer.jsp"></jsp:include>
		</c:otherwise>
	</c:choose>
</body>
</html>