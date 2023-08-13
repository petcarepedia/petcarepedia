<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
</head>
<body>

<!-- header -->
	<jsp:include page="../admin_header.jsp"></jsp:include>
	<div class="d1">
	  <section class="member_detail">
	    <section id="section1">
	      <div>
	        <nav>
	          <ul>
				  <li>예약관리</li>
				  <li><a href = "http://localhost:9000/admin/hospital_list/1/">병원 관리</a></li>
				  <li><a href = "http://localhost:9000/admin/member_list/1/">회원 관리</a></li>
				  <li><a href = "http://localhost:9000/admin/reserve_list/1/">예약 관리</a></li>
				  <li><a href = "http://localhost:9000/admin/review_list/1/">신고 리뷰 관리</a></li>
				  <li><a href = "http://localhost:9000/admin/notice/1/">공지 사항 관리</a></li>
			</ul>
	        </nav>
	      </div>
	    </section>
	    <section id="section2">
			<input type="hidden" name="bid" id="bid" value="${booking.bid}">
	      <div>
		        <ul>
		          <li>
		            <label>아이디</label>
		            <input type="text" name="mid" id="mid" value="${booking.mid}" disabled>
		          </li>
		          <li>
		            <label>예약한 병원명</label>
		            <input type="text" name="hname" id="hname" value="${booking.hname}" disabled>
		          </li>
		          <li>
		            <label>예약 날짜</label>
		            <input type="text" name="vdate" id="vdate" value="${booking.vdate}" disabled>
		          </li>
					<li>
						<label>예약 시간</label>
						<input type="text" name="vtime" id="vtime" value="${booking.vtime}" disabled>
					</li>
		          <li>
		            <label>예약 상태</label>
		            <input type="text" name="bstate" id="bstate" value="${booking.bstate}" disabled>
		          </li>
		        </ul>
		        <div id="d4">
		       	 <a href="http://localhost:9000/admin/reserve_list/1">
	       	 	 	<button type="button" class="button5">이전으로</button>
	       	 	 </a>
		        </div>
	      </div>
	    </section>
	  </section>
	</div>

	<!-- footer -->
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>