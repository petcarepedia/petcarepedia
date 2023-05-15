<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member - List</title>
<link rel="stylesheet" href="http://localhost:9000/animal/css/admin.css">
</head>
<body>

<!-- header -->
	<iframe width="100%" height="100px" frameborder=0></iframe>
	<div class="d1">
	  <section id="member_write">
	    <h1>회원 정보</h1>
	    <section id="section1">
	      <div>
	        <nav>
	          <ul>
	            <li>회원관리</li>
	            <li><a href="http://localhost:9000/animal/admin/hospital/hospital_list.jsp">병원 관리</a></li>
	            <li><a href="http://localhost:9000/animal/admin/member/member_list.jsp">회원 관리</a></li>
	            <li><a href="http://localhost:9000/animal/admin/reserve/reserve_list.jsp">예약 관리</a></li>
	            <li><a href="http://localhost:9000/animal/admin/review/review_list.jsp">신고 리뷰 관리</a></li>
	            <li><a href="http://localhost:9000/animal/admin/review/review_list.jsp">공지 사항 관리</a></li>
	            <li><a href="#">나가기</a></li>
	          </ul>
	        </nav>
	      </div>
	    </section>
	    <section id="section2">
	      <div class="d2">
	        <ul>
	          <li>
	            <label>아이디</label>
	            <input type="text" name="id" id="id">
	          </li>
	          <li>
	            <label>성명</label>
	            <input type="text" name="name" id="name">
	          </li>
	          <li>
	            <label>생년월일</label>
	            <input type="text" name="birth" id="birth">
	          </li>
	          <li>
	            <label>이메일</label>
	            <input type="text" name="email" id="email">
	          </li>
	          <li>
	            <label>휴대폰</label>
	            <input type="text" name="phone" id="phone">
	          </li>
	          <li>
	            <label>주소</label>
	            <input type="text" name="address" id="address">
	          </li>
	        </ul>
	        <button type="button" class="button4"><a href="http://localhost:9000/animal/admin/member/member_list.jsp">이전으로</a></button>
	      </div>
	    </section>
	  </section>
	</div>

<!-- footer -->
	<iframe  width="100%" height="350px" frameborder=0></iframe>
</body>
</html>