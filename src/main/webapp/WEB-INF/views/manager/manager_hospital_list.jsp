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
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/petcarepedia_jquery_song.js"></script>
<script src="http://localhost:9000/js/petcarepedia_jquery_yeol.js"></script>
<script src="https://kit.fontawesome.com/4ed285928f.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.1/css/fontawesome.min.css" integrity="sha384-QYIZto+st3yW+o8+5OHfT6S482Zsvz2WfOzpFSXMF9zqeLcFV0/wlZpMtyFcZALm" crossorigin="anonymous">
<script>
	$(document).ready(function () {
		$(".header-menu").css('background','#FFB3BD');
		$(".footer-menu").css('background','#FFF2F4');
		$("#btnMainSearch-header > img").attr("src",'http://localhost:9000/images/foot_pink.png');

		$(".manager-menu > ul > li:first-child").css('color','#FFB3BD').css('border-color','#FFB3BD');
		$(".manager-menu > ul > li > a").mouseover(function (){$(this).css('color','#FFB3BD');});
		$(".manager-menu > ul > li > a").mouseleave(function (){$(this).css('color','#3d3d3d');});

		$(".manager-menu > ul > li:nth-child(2) > a").css('font-weight','bold');
		$(".manager-menu > ul > li:nth-child(3) > a").css('font-weight','normal');

		$("#aside1").css("border","1px solid #FFB3BD");
		$("#aside1 > div > a > span").mouseover(function (){$(this).css('color','#FFB3BD');});
		$("#aside1 > div > a > span").mouseleave(function (){$(this).css('color','#3d3d3d');});

		$("#btnMhWrite").click(function () {
			location.href = "/manager_hospital_write";
		})
	});
</script>
<style>
	.mhbox {
		background: #F2F2F2;
		padding: 30px;
		border-radius: 10px;
		width: 717px; height: 90px;
		display: flex; align-items: center;
	}
	.unauth {
		background: #FFF4F6;
	}
	.reject {
		background: #FFF4F3;
	}
	.null:hover {
		opacity: 0.7;
		cursor: pointer;
	}
	.mhbox > i {
		margin-right: 30px;
	}
	.mhbox > p {
		font-weight: bold; font-size: 20px;
		color: #3D3D3D;
		flex: 2;
	}

	.mhex {
		padding: 10px 20px; width: 717px;
		font-size: 14px;
		color: #989898; line-height: 20px;
		margin-bottom: 30px;
	}
	.mhexreject {
		color:red;
	}

	.btn-mh {
		background: #ffb3bd;
		color: white;
		font-size: 14px; font-weight: bold;
		text-align: center;
		padding: 10px;
		border-radius: 5px;
	}
	.btn-mh:hover {
		cursor: pointer;
		opacity: 0.7;
	}
	.bre {
		background: #f95f5c;
	}

	#aside, #section2 {width: 777px}
</style>
<body>
	<!-- header -->
	 <jsp:include page="../header.jsp"></jsp:include>
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
							<li>마이페이지</li>
							<li><a href = "/manager_hospital_list">병원 정보 관리</a></li>
							<li><a href = "/mypage_reservation">예약 관리</a></li>
							<li><a href = "/manager_review_list/1/">리뷰 관리</a></li>
							<li><a href = "/mypage_member_information">회원 정보</a></li>
							<li><a href = "/mypage_signout">회원 탈퇴</a></li>
						</ul>
					</nav>
				</div>
			</section>
			<div id = "aside">
				<section id = "section2">
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
								<div class="btn-mh" id="btnUnauth">등록 정보 확인</div>
							</div>
							<ul class="mhex">
								<li>병원 등록 후 승인 완료까지 1~2일 소요될 수 있으며, 허위나 부적절한 정보 입력 시 승인이 거부될 수 있습니다. </li>
								<li>승인 완료 후 병원검색 페이지에 해당 정보가 게시되며, 예약 및 리뷰 관리 서비스를 이용하실 수 있습니다. </li>
							</ul>
						</c:when>
						<c:when test="${hospital.auth == 'auth'}">
							<div id = "aside1">
								<img src = "http://localhost:9000/upload/${hospital.hsfile1}">
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
								<button type = "button" id = "btn_cancle1">정보 수정</button></a>
						</c:when>
						<c:otherwise>
							<div class="mhbox reject">
								<i class="fa-solid fa-circle-xmark fa-3x" style="color: #f95f5c;"></i>
								<p>승인 거부</p>
								<div class="btn-mh bre" id="btnReject">정보 재등록</div>
							</div>
							<ul class="mhex mhexreject">
								<li>부적절한 병원 정보 등록으로 승인이 거부되었습니다. 사유 확인 후 정보를 다시 재등록해주세요.</li>
								<li>정확한 거부 사유 및 기타 사항에 대한 문의는 이메일 혹은 카카오톡 일대일 채팅으로 상담이 가능합니다. (상담 운영 시간: 10:00 ~ 19:00)</li>
							</ul>
						</c:otherwise>
					</c:choose>
				</section>
			</div>
		</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>