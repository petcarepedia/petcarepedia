<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="http://localhost:9000/css/manager_reserve_list.css">
	<script src="https://kit.fontawesome.com/4ed285928f.js" crossorigin="anonymous"></script>
	<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
	<script src="http://localhost:9000/js/am-pagination.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script src="http://localhost:9000/js/manager_reserve_list.js"></script>
	<link href="http://localhost:9000/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
	<title>펫캐어피디아 | 예약 관리</title>
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
				$(location).attr('href', "http://localhost:9000/manager_reserve_content/${page}/${booking.bid}/${member.mid}/"+ e.page);
			});
		});
	</script>
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
						<img src = "http://localhost:9000/upload/${member.msfile}/" id="profile">
					</div>

					<div id="info">
						<p>${member.mid}</p>

						<div id="infoName">
							<span>이름 : ${member.name}</span>
							<span>생년월일 : ${member.birth}</span>
						</div>

						<div id="infoProfile">
							<span>휴대폰 : ${member.phone}</span>
							<span>이메일 : ${member.email}</span>
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
						<span>날짜 : ${booking.vdate}</span>
						<span>시간 : ${booking.vtime}</span>
					</div>

					<div class="reserveDate">
						<span>예약상태 : ${booking.bstate}</span>
						<span>접수일 : ${booking.bdate}</span>
					</div>

					<div class="change">
						<c:if test="${booking.bstate eq '예약중'}">
							<button class="stateBtn" id="change">예약 변경</button>
							<button class="stateBtn" id="cancel" value="${booking.bid}">예약 취소</button>
						</c:if>
					</div>
				</div>
			</section>

			<h1 class="title">이전 예약 내역</h1>
			<hr class="bar">

			<section id="section5">
				<table class="booking_table">
					<tr>
						<th>번호</th>
						<th>예약일</th>
						<th>예약시간</th>
						<th>상태</th>
					</tr>

					<c:forEach var="list" items="${list}">
						<tr>
							<td>${list.rno}</td>
							<td>${list.vdate}</td>
							<td>${list.vtime}</td>
							<td class="state">${list.bstate}</td>
						</tr>
					</c:forEach>

					<tr>
						<td colspan="4"><div id="ampaginationsm"></div></td>
					</tr>
				</table>
			</section>
		</section>
	</div>
	<!-- footer -->
		<jsp:include page="../footer_manager.jsp"></jsp:include>
</body>
</html>