<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://localhost:9000/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
<title>펫캐어피디아 | 예약내역</title>
</head>
<link rel="stylesheet" href="http://localhost:9000/css/mypage.css">
<link rel="stylesheet" href="http://localhost:9000/css/petcarepedia_song.css">
<link rel="stylesheet" href="http://localhost:9000/css/petcarepedia_song_manager.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/petcarepedia_jquery_song.js"></script>
<script src="http://localhost:9000/js/petcarepedia_jquery_song_manager.js"></script>
<script src="http://localhost:9000/js/petcarepedia_jquery_yeol.js"></script>
<script src="https://kit.fontawesome.com/4ed285928f.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.1/css/fontawesome.min.css" integrity="sha384-QYIZto+st3yW+o8+5OHfT6S482Zsvz2WfOzpFSXMF9zqeLcFV0/wlZpMtyFcZALm" crossorigin="anonymous">
<body>
	<!-- header -->
	 <jsp:include page="../header_manager.jsp"></jsp:include>
	<div id = "content2" style="margin-top: 140px;">
		<section id = "reservation">
			<div id = "btn_box">
				<h1 id = "title">병원 정보 관리</h1>
				<hr>
			</div>
			<section id = "section1">
				<div>
					<nav class="manager-menu">
						<ul>
							<li style = "color: #ffb3bd; border-color: #ffb3bd">마이페이지</li>
							<li><a href = "/manager_hospital_list" style = "font-weight:bold;">병원 정보 관리</a></li>
							<li><a href = "/manager_reserve_list/1/" style = "font-weight:500;">예약 관리</a></li>
							<li><a href = "/manager_review_list/1/">리뷰 관리</a></li>
							<li><a href = "/manager_information">회원 정보</a></li>
							<li><a href = "/mypage_signout">회원 탈퇴</a></li>
						</ul>
					</nav>
				</div>
			</section>
			<div id = "aside">
				<section id = "section2">
					<input type="hidden" name="auth" id="mhAuth" value="${hospital.auth}">
					<c:choose>
						<c:when test="${hospital == null || hospital.auth == null}">
							<div class="mhbox null" id="btnMhWrite">
								<i class="fa-solid fa-circle-plus fa-3x" style="color: #989898;"></i>
								<p>병원 등록하기</p>
							</div>
							<ul class="mhex">
								<li>병원 등록 후 승인 완료까지 1~2일 소요될 수 있으며, 허위나 부적절한 정보 입력 시 승인이 거부될 수 있습니다. </li>
								<li>승인 완료 후 병원검색 페이지에 해당 정보가 게시되며, 예약 및 리뷰 관리 서비스를 이용하실 수 있습니다. </li>
							</ul>
						</c:when>
						<c:when test="${hospital.auth == 'unauth'}">
							<div class="mhbox unauth">
								<i class="fa-solid fa-circle-check fa-3x" style="color: #ffb3bd;"></i>
								<p>승인 대기중</p>
								<div class="btn-mh btnMhUpdate" id="btnMhUpdate">등록 정보 확인</div>
							</div>
							<ul class="mhex">
								<li>병원 등록 후 승인 완료까지 1~2일 소요될 수 있으며, 허위나 부적절한 정보 입력 시 승인이 거부될 수 있습니다. </li>
								<li>승인 완료 후 병원검색 페이지에 해당 정보가 게시되며, 예약 및 리뷰 관리 서비스를 이용하실 수 있습니다. </li>
							</ul>
						</c:when>
						<c:when test="${hospital.auth == 'auth'}">
							<div id = "aside1" style = "border: 1px solid #d8d8d8;">
								<img src = "http://localhost:9000/upload/${hospital.hsfile1}" style="object-fit: cover;">
								<div>
									<span>서울시 > ${hospital.gloc}</span>
									<a href = "http://localhost:9000/search_result/${hospital.hid}"><span>${hospital.hname}</span></a>
									<span></span>
									<img src = "http://localhost:9000/images/위치.png">
									<span>${hospital.loc}</span>
									<c:if test = "${hospital.hrink ne 'X'}">
										<img src = "http://localhost:9000/images/홈.png">
										<a href = "${hospital.hrink}">병원 홈페이지 가기</a>
									</c:if>
									<div class = "box">
										<img src = "http://localhost:9000/images/전화.png">
										<span>${hospital.tel}</span>
									</div>
								</div>
							</div>
							<button type = "button" id = "btn_cancle1" class="btnMhUpdate">정보 수정</button></a>

						</c:when>
						<c:otherwise>
							<div class="mhbox reject">
								<i class="fa-solid fa-circle-xmark fa-3x" style="color: #f95f5c;"></i>
								<p>승인 거부</p>
								<div class="btn-mh bre btnMhUpdate">정보 재등록</div>
							</div>
							<ul class="mhex mhexreject">
								<li>부적절한 병원 정보 등록으로 승인이 거부되었습니다. <a id="btnReject">사유 확인</a> 후 정보를 다시 재등록해주세요.</li>
								<li>정확한 거부 사유 및 기타 사항에 대한 문의는 이메일 혹은 카카오톡 일대일 채팅으로 상담이 가능합니다. (상담 운영 시간: 10:00 ~ 19:00)</li>
							</ul>
						</c:otherwise>
					</c:choose>
				</section>
			</div>
		</section>
	</div>
	<jsp:include page="../footer_manager.jsp"></jsp:include>
</body>
</html>