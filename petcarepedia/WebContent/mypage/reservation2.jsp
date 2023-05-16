<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/mypage.css">
<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/petcarepedia_song.css">
<script src="http://localhost:9000/petcarepedia/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/petcarepedia/js/petcarepedia_jquery_song.js"></script>
<script src="http://localhost:9000/petcarepedia/js/petcarepedia_jquery_yeol.js"></script>
<body>
	<!-- header -->
	 <jsp:include page="../header.jsp"></jsp:include>
	<div id = "content2">
		<section id = "reservation">
			<div id = "btn_box">
				<h1 id = "title">예약 내역</h1>
				<div id = "btn_reservation">
					<button type = "button" id = "btn3">예약중</button>
					<button type = "button" id = "btn4">진료 완료</button>
				</div>
				<hr>
			</div>
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
					<div id = "aside1">
						<img src = "http://localhost:9000/petcarepedia/images/hos.png">
						<div>
							<span>서울 > 강남구</span>
							<span>더조은 동물병원</span>
							<span>⭐5.0 | 리뷰 60</span>
							<img src = "http://localhost:9000/petcarepedia/images/위치.png">
							<span>서울특별시 강남구 강남대로78길 8, 한국빌딩 4F</span>
							<img src = "http://localhost:9000/petcarepedia/images/홈.png">
							<a href = "http://localhost:9000/petcarepedia/mypage/information.jsp">병원 홈페이지 가기</a>
							<img src = "http://localhost:9000/petcarepedia/images/전화.png">
							<span>010-1234-1234</span>
							<span>예약날짜 2023-04-23</span>
							<span>예약시간 17:50</span>
						</div>
					</div>
					<div id = "btn_review">
						<button type = "button" id = "btn_write_review">리뷰쓰기</button>
						<button type = "button" id = "btn_watch_review">리뷰보기</button>
					</div>
					<div id = "aside2">
						<img src = "http://localhost:9000/petcarepedia/images/hos.png">
						<div>
							<span>서울 > 강남구</span>
							<span>더조은 동물병원</span>
							<span>⭐5.0 | 리뷰 60</span>
							<img src = "http://localhost:9000/petcarepedia/images/위치.png">
							<span>서울특별시 강남구 강남대로78길 8, 한국빌딩 4F</span>
							<img src = "http://localhost:9000/petcarepedia/images/홈.png">
							<a href = "http://localhost:9000/petcarepedia/mypage/information.jsp">병원 홈페이지 가기</a>
							<img src = "http://localhost:9000/petcarepedia/images/전화.png">
							<span>010-1234-1234</span>
							<span>예약날짜 2023-04-23</span>
							<span>예약시간 17:50</span>
						</div>
					</div>
					<div id = "btn_review">
						<button type = "button" id = "btn_write_review">리뷰쓰기</button>
						<button type = "button" id = "btn_watch_review">리뷰보기</button>
					</div>
				</section>
			</div>
		</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>