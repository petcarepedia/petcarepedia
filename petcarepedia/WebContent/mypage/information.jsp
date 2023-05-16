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
</head>
<body>
	<!-- header -->
	 <jsp:include page="../header.jsp"></jsp:include>
			
	<div id = "content">
		<section id = "information">
			<h1 id = "title">나의 회원정보</h1>
			<hr>
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
							<label>1987년 08월 27일</label>
						</li>
						<li>
							<label>이메일</label>
							<label>petcarepedia@gmail.com</label>
						</li>
						<li>
							<label>휴대폰</label>
							<label>010-1234-5678</label>
						</li>
						<li>
							<label>주소</label>
							<label>서울시 강남구 강남대로 78길 8, 한국빌딩 4F</label>
						</li>
					</ul>
				</section>
				<section id = "section3">
					<button type = "button" id = "btn_style1">수정하기</button>
				</section>
			</div>
		</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>