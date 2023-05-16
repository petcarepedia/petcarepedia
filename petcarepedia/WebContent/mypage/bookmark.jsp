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
	
	<div id = "content2">
		<section id = "bookmark">
			<h1 id = "title">즐겨찾기</h1>
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
			<section id = "section2">
				<div id = "aside1">
					<span>더좋은동물병원</span>
					<span>강남구</span>
					<a href = "http://localhost:9000/petcarepedia/mypage/information.jsp">병원 상세보기 ></a>
					<button type = "button"><img src = "http://localhost:9000/petcarepedia/images/bookmark2.png"></button>
				</div>
				<div id = "aside1">
					<span>더좋은동물병원</span>
					<span>강남구</span>
					<a href = "http://localhost:9000/petcarepedia/mypage/information.jsp">병원 상세보기 ></a>
					<button type = "button"><img src = "http://localhost:9000/petcarepedia/images/bookmark2.png"></button>
				</div>
				<div id = "aside1">
					<span>더좋은동물병원</span>
					<span>강남구</span>
					<a href = "http://localhost:9000/petcarepedia/mypage/information.jsp">병원 상세보기 ></a>
					<button type = "button"><img src = "http://localhost:9000/petcarepedia/images/bookmark2.png"></button>
				</div>
				<div id = "aside1">
					<span>더좋은동물병원</span>
					<span>강남구</span>
					<a href = "http://localhost:9000/petcarepedia/mypage/information.jsp">병원 상세보기 ></a>
					<button type = "button"><img src = "http://localhost:9000/petcarepedia/images/bookmark2.png"></button>
				</div>
			</section>
		</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	
</body>
</html>