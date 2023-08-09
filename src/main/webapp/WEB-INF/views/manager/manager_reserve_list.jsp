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
			   if(mid!=null && mid!=""){
				   $(location).attr('href', "http://localhost:9000/manager_reserve_msearch/"+e.page+"/"+mid+"/");
			   } else {
				   $(location).attr('href', "http://localhost:9000/manager_reserve_list/"+e.page+"/");
			   }
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
</head>
<body>
<!-- header -->
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
				<input type="text" name="hid" id="hid" value="${svo.hid}" >

				<div class="d2" id = "d2">
					<input type="text"  class="search_bar" id ="Hreserve_bar" placeholder="회원아이디 입력">
					<button type="submit" class="button1" id="Hreserve_btn">
						<img src="http://localhost:9000/images/foot_pink.png">
					</button>
				</div>

				<select name="filter" id="filter" class="filter">
					<option value="basic" selected>예약 상태</option>
					<option value="all">전체보기</option>
					<option value="booking">예약중</option>
					<option value="cancel">예약취소</option>
					<option value="completed">진료완료</option>
				</select>

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
					<c:forEach var="booking" items="${list}">
						<tr>
							<td>${booking.rno}</td>
							<td>${booking.name}</td>
							<td title="${booking.mid}">${booking.mid}</td>
							<td>${booking.phone}</td>
							<td>${booking.vdate}</td>
							<td>${booking.vtime}</td>
							<td class="state">${booking.bstate}</td>
					    </tr>
					</c:forEach>
					<tr>
						<td colspan="7"><div id="ampaginationsm"></div></td>
					</tr>
				</table>
			</section>
		</section>
	</div>
	<!-- footer -->
		<jsp:include page="../footer_manager.jsp"></jsp:include>
</body>
</html>