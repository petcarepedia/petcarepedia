<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="http://localhost:9000/css/admin1.css">
	<link rel="stylesheet" href="http://localhost:9000/css/am-pagination.css">
	<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
	<script src="http://localhost:9000/js/petcarepedia_jquery_serin.js"></script>
	<script src="http://localhost:9000/js/am-pagination.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<link href="http://localhost:9000/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
	<title>펫캐어피디아 | 관리자</title>
	<script>
		$(document).ready(function(){
			var mid = "${mid}";
			var hid = "${hid}";
			var pager = jQuery('#ampaginationsm').pagination({

				maxSize: '${page.pageCount}',	    		// max page size
				totals: '${page.dbCount}',	// total pages
				page: '${page.reqPage}',		// initial page
				pageSize: '${page.pageSize}',				// max number items per page

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
					$(location).attr('href', "http://localhost:9000/manager_reserve_msearch/"+e.page+"/" +hid+"/" +mid +"/");
				} else {
					$(location).attr('href', "http://localhost:9000/manager_reserve_list/"+e.page+"/"+ hid);
				}

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
<div class="d1">
	<section class="reserve">
		<section id = "section3">
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
		<h2>예약 관리</h2>
		<p id="p"></p>
		<section id="section2">
			<input type="hidden" name="hid" id="hid" value="${booking.hid}">
			<div class="d2" id = "d2">
				<input type="text"  class="search_bar" id ="Hreserve_bar"placeholder="회원아이디 입력">
				<button type="submit" class="button1" id="Hreserve_btn">
					<img src="http://localhost:9000/images/foot_pink.png">
				</button>
			</div>
			<table class="reserve_table">
				<tr>
					<th>번호</th>
					<th>병원명</th>
					<th>아이디</th>
					<th>예약일</th>
					<th>상태</th>
				</tr>
				<c:forEach var="booking" items="${list}">
					<tr>
						<td>${booking.rno}</td>
						<td>${booking.hname}</td>
						<td>${booking.mid}</td>
						<td class="date">${booking.vdate}</td>
						<td class="state">${booking.bstate}</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="5"><div id="ampaginationsm"></div></td>
				</tr>
			</table>
		</section>
	</section>
</div>
<!-- footer -->
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>