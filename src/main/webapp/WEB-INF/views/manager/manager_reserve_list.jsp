<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	<script>
	$(document).ready(function(){
		var mid = "${mid}";
		var hid = "${hid}";

		var pager = jQuery('#ampaginationsm').pagination({

			maxSize: '${page.pageCount}',
			totals: '${page.dbCount}',
			page: '${page.reqPage}',
			pageSize: '${page.pageSize}',

			lastText: '&raquo;&raquo;',
			firstText: '&laquo;&laquo;',
			prevText: '&laquo;',
			nextText: '&raquo;',

			btnSize:'sm'
		});
		
		jQuery('#ampaginationsm').on('am.pagination.change',function(e){
			   jQuery('.showlabelsm').text('The selected page no: '+e.page);
			   if(mid!=null && mid!=""){
				   $(location).attr('href', "http://localhost:9000/manager_reserve_msearch/"+e.page+"/"+mid+"/");
			   } else {
				   $(location).attr('href', "http://localhost:9000/manager_reserve_list/"+e.page+"/");
			   }
	    });

		var allCells = $("td:nth-child(3)");

		allCells.on("mouseover", function() {
			var el = $(this);
			var row = el.closest('tr');

			row.find('td, th').css({ "background": "#FFF2F4"});
		}).on("mouseout", function() {
			var el = $(this);
			var row = el.closest('tr');

			row.find('td, th').css({ "background": "", "color": "" });
		});
 	});
	</script>
</head>
<body>
	<jsp:include page="../header_manager.jsp"></jsp:include>

	<div class="d1">
		<section class="reserve">
			<h1 class="title">예약 관리</h1>
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

			<section id="section2">
				<input type="hidden" name="hid" id="hid" value="${svo.hid}" >

				<c:choose>
					<c:when test="${auth eq 'auth'}">
						<c:if test="${fn:length(list) != 0}">

							<div class="d2" id = "d2">
								<input type="text"  class="search_bar" id ="Hreserve_bar" placeholder="회원아이디 입력">
								<button type="submit" class="button1" id="Hreserve_btn">
									<img src="http://localhost:9000/images/foot_pink.png">
								</button>
							</div>

							<button class="bookingChange">예약상태 새로고침</button>

							<select name="filter" id="filter" class="filter">
								<option value="basic" selected>예약 상태</option>
								<option value="all">전체보기</option>
								<option value="booking">예약중</option>
								<option value="cancel">예약취소</option>
								<option value="completed">진료완료</option>
							</select>
						</c:if>

				<table class="reserve_table">
					<tr>
						<th>번호</th>
						<th>이름</th>
						<th>아이디</th>
						<th>전화번호</th>
						<th>예약일</th>
						<th>예약시간</th>
						<th>상태</th>
					</tr>

					<c:choose>
						<c:when test="${fn:length(list) != 0}">
							<c:forEach var="booking" items="${list}">
								<tr>
									<td>${booking.rno}</td>
									<td>${booking.name}</td>
									<td title="${booking.mid}"><a href="/manager_reserve_content/${page.reqPage}/${booking.bid}/${booking.mid}/1">${booking.mid}</a></td>
									<td>${booking.phone}</td>
									<td>${booking.vdate}</td>
									<td>${booking.vtime}</td>
									<td class="state">${booking.bstate}</td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="7"><div id="ampaginationsm"></div></td>
							</tr>
						</c:when>

						<c:otherwise>
							<tr>
								<td colspan="7">
									<div class="review_no">
										<div class="review_no_img">
											<img id="review_no_img" src="http://localhost:9000/images/walkingCat.gif">
										</div>
										<p>등록된 예약이 없습니다.</p>
									</div>
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
			</c:when>

			<c:otherwise>
				<div id = "asideUnauth">
					<section id = "sectionUnauth">
						<div class="mhbox unauth">
							<i class="fa-solid fa-circle-check fa-3x" style="color: #ffb3bd;"></i>
							<p>병원 등록이 완료되지 않았습니다. <br>
								병원 등록 후 이용 가능합니다.</p>
						</div>
					</section>
				</div>
			</c:otherwise>
		</c:choose>
	</section>
</section>
</div>

		<jsp:include page="../footer_manager.jsp"></jsp:include>
</body>
</html>