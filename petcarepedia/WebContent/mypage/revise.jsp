<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/mypage.css">
<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/petcarepedia_song.css">
<script src="http://localhost:9000/petcarepedia/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/petcarepedia/js/petcarepedia_jquery_song.js"></script>
<script src="http://localhost:9000/petcarepedia/js/petcarepedia_jquery_yeol.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<!-- header -->
	 <jsp:include page="../header.jsp"></jsp:include>
			
	<div id = "content">
		<section id = "revise">
			<h1 id = "title">수정하기</h1>
			<hr>
			<form name="reviseForm" action="#" method="get">
				<section id = "section1">
				<div>
					<nav>
						<ul>
							<li>마이페이지</li>
							<li><a href = "http://localhost:9000/petcarepedia/mypage/information.jsp">회원 정보</a></li>
							<li><a href = "http://localhost:9000/petcarepedia/mypage/reservation.jsp">예약 내역</a></li>
							<li><a href = "http://localhost:9000/petcarepedia/mypage/my_review.jsp">내가 쓴 리뷰</a></li>
							<li><a href = "http://localhost:9000/petcarepedia/mypage/bookmark.jsp">즐겨찾기</a></li>
							<li><a href = "http://localhost:9000/petcarepedia/mypage/signout.jsp">회원 탈퇴</a></li>
						</ul>
					</nav>
				</div>
				</section>
				<div id = "aside">
					<section id = "section2">
						<ul>
							<li>
								<label >아이디</label>
								<label>hong1234</label>
							</li>
							<li>
								<label>성명</label>
								<label>홍길동</label>
							</li>
							<li>
								<label>생년월일</label>
								<div>
									<input type = "text" name = "year" id = "year" placeholder = "  년(4자)">
									<input type = "text" name = "month" id = "month" placeholder = "  월">
									<input type = "text" name = "date" id = "date" placeholder = "  일">
								</div>
							</li>
							<li>
								<label>이메일</label>
								<input type = "text" name = "email" id = "email" placeholder = "  변경하실 이메일 주소를 입력해주세요">
							</li>
							<li>
								<label>휴대폰</label>
								<div>
									<select name="phone1" id="phone1">
										<option value="default">선택</option>
										<option value="011">011</option>
										<option value="010">010</option>
										<option value="017">017</option>
									</select>
									-<input type = "text" name = "phone2" id = "phone2">
									-<input type = "text" name = "phone3" id = "phone3">
								</div>
							</li>
							<li>
								<label>주소</label>
								<input type = "text" name = "address" id = "address" placeholder = "  변경하실 주소를 입력해주세요">
								<button type="button" class="btn_style2" id="btnSearchAddr">주소찾기</button>
							</li>
						</ul>
					</section>
					<ul id = "pass_revise">
						<li><a href="#" target="_parent">비밀번호 재설정</a></li>
					</ul>
					<section id = "section3">
						<button type = "submit" id = "btn_style1">수정완료</button>
					</section>
				</div>
			</form>
		</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>