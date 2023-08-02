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
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/petcarepedia_jquery_yeol.js"></script>
	<script>
		$(document).ready(function () {
			if($("#grade").val()=='manager'){
				$(".header-menu").css('background', '#FFB3BD');
				$(".footer-menu").css('background', '#FFF2F4');
				$("#btnMainSearch-header > img").attr("src", 'http://localhost:9000/images/foot_pink.png');

				$(".manager-menu > ul > li:first-child").css('color','#FFB3BD').css('border-color','#FFB3BD');
				$(".manager-menu > ul > li > a").mouseover(function (){$(this).css('color','#FFB3BD');});
				$(".manager-menu > ul > li > a").mouseleave(function (){$(this).css('color','#3d3d3d');});
			}

		})
	</script>
	<style>
		/** {border: 1px solid red}*/
		.outbox {
			width: 777px;
			margin: 50px 0 80px 50px;
			float: left;
		}
		.outexbox {
			width: 737px;
			margin-bottom: 60px;
			border-radius: 5px;
			background: #F7FCFE;
			padding: 30px 20px;
		}
		.outtitle {
			font-size: 20px;
			font-weight: bold;
			margin-bottom: 20px;
			color: #3D3D3D;
		}
		.subtitle {
			font-size: 18px;
		}

		.outex {
			margin-left: 70px;
			color: #3D3D3D;
			line-height: 25px;
			font-size: 15px;
		}
		.outex span {
			font-weight: bold;
			color: #636363;
		}

		.outdelhos {margin-left: 50px; margin-top: 20px;}
		.outradio {
			margin-left: 30px;
			list-style: none;
			font-size: 15px;
			font-weight: bold;
			color: #636363;
		}
		.outradio li:first-child {
			margin-bottom: 10px;
		}
		.outradio input {
			width: 18px;
			height: 18px;
			float: left;
			margin-right: 10px;
		}

		.outpwbox {
			width: 400px;
			margin: auto;
			text-align: center;
		}
		.outpw p {
			font-size: 15px;
			font-weight: bold;
			color: #636363;
			margin-bottom: 20px;
			display: inline-block;
		}
		.outpw input {
			width:258px; height:50px;
			padding: 0px 20px;
			border-radius: 5px;
			border: 1px solid lightgray;
		}
		.outpw input:focus {
			outline: 1px solid #7ab2cc;
		}
		.outpw button {
			width:300px; height:50px;
			border:none;
			border-radius: 5px;
			background:#7AB2CC; color:white;
			font-size:15px; font-weight:bold;
			cursor:pointer;
			margin-top: 20px;
		}

		#section1 {
			float: left;
		}

	</style>
</head>
<body>
		<!-- header -->
	 <jsp:include page="../header.jsp"></jsp:include>
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
										<li>마이페이지</li>
										<li><a href = "/manager_hospital_list">병원 정보 관리</a></li>
										<li><a href = "/manager_reserve_list/1/${sessionScope.svo.hid}">예약 관리</a></li>
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
										<li><a href = "/mypage_reservation">예약 내역</a></li>
										<li><a href = "/mypage_my_review/1/">내가 쓴 리뷰</a></li>
										<li><a href = "/mypage_bookmark">즐겨찾기</a></li>
										<li><a href = "/mypage_signout">회원 탈퇴</a></li>
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
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>