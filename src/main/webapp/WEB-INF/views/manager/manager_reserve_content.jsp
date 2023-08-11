<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="http://localhost:9000/css/manager_reserve_list.css">
	<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
	<script src="http://localhost:9000/js/am-pagination.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script src="http://localhost:9000/js/manager_reserve_list.js"></script>
	<link href="http://localhost:9000/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
	<title>펫캐어피디아 | 예약 관리</title>
</head>
<body>
<!-- header -->
	<jsp:include page="../header_manager.jsp"></jsp:include>

	<div class="d1">
		<section class="reserve">
			<h1 class="title">예약 회원 정보</h1>
			<hr class="bar">
			<section id = "section1">
				<div>
					<nav>
						<ul>
							<li>마이페이지</li>
							<li><a href = "/manager_hospital_list">병원 정보 관리</a></li>
							<li><a href = "/manager_reserve_list/1/">예약 관리</a></li>
							<li><a href = "/manager_review_list/1/">리뷰 관리</a></li>
							<li><a href = "/manager_information">회원 정보</a></li>
							<li><a href = "/mypage_signout">회원 탈퇴</a></li>
						</ul>
					</nav>
				</div>
			</section>

			<section id="section3">
				<div class="infoBox">
					<div id="profileBox">
						<img src = "http://localhost:9000/upload/1.png/" id="profile">
					</div>

					<div id="info">
						<p>hong</p>

						<div id="infoName">
							<span>이름 : 홍길동</span>
							<span>생년월일 : 2023-06-13</span>
						</div>

						<div id="infoProfile">
							<span>휴대폰 : 010-1234-1234</span>
							<span>이메일 : test@naver.com</span>
						</div>
					</div>
				</div>
			</section>

			<h1 class="title">예약 내역</h1>
			<hr class="bar">

			<section id="section4">
				<div class="reserveBox">
					<div class="mhbox">
						<i class="fa-solid fa-circle-check fa-3x" style="color: #ffb3bd;"></i>
					</div>


					<div class="visitDate">
						<span>날짜 : 2023-09-09</span>
						<span>시간 : 18:00</span>
					</div>

					<div class="reserveDate">
						<span></span>
						<span>접수일 : 2023-09-01</span>
					</div>

					<div class="change">
						<button class="stateBtn">예약 변경</button>
						<button class="stateBtn">예약 취소</button>
					</div>
				</div>
			</section>

			<h1 class="title">이전 예약 내역</h1>
			<hr class="bar">

			<section id="section5">
				<table class="reserve_table">
				<tr>
					<th>번호</th>
					<th>전화번호</th>
					<th>예약일</th>
					<th>예약시간</th>
					<th>상태</th>
				</tr>
				<%--<c:forEach var="booking" items="${list}">
					<tr>
						<td>${booking.rno}</td>
						<td>${booking.phone}</td>
						<td>${booking.vdate}</td>
						<td>${booking.vtime}</td>
						<td class="state">${booking.bstate}</td>
					</tr>
				</c:forEach>--%>
				</table>
			</section>
		</section>
	</div>
	<!-- footer -->
		<jsp:include page="../footer_manager.jsp"></jsp:include>
</body>
</html>