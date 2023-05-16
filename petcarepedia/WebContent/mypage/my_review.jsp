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
	 <jsp:include page="../header.jsp"></jsp:include>
	<div id = "content2">
		<section id = "my_review">
			<h1 id = "title">내가 쓴 리뷰</h1>
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
					<div id = "aside1">
						<span>더조은 동물병원</span>
						<span>02-1234-1234</span>
						<span>
							<span>강남구</span>
						</span>
						<img src = "http://localhost:9000/petcarepedia/images/cat.png">
						<span>과테말라 냥이</span>
					</div>
					<div id = "aside2">
						<img src = "http://localhost:9000/petcarepedia/images/hos.png">
					</div>
					<div id = "aside3">
						<span>동물 종류 : 고양이</span>
						<span>교정상담 받았습니다. 선생님이 친절하세요. 선생님이 친절하세요.교정상담 받았습니다. 선생님이 친절하세요. 선생님이 친절하세요.교정상담 받았습니다. 선생님이 친절하세요. 선생님이 친절하세요.
								교정상담 받았습니다. 선생님이 친절하세요. 선생님이 친절하세요.교정상담 받았습니다. 선생님이 친절하세요. 선생님이 친절하세요.교정상담 받았습니다.
						</span>
						<span>진료 일자 : 2023-04-26</span>
					</div>
					<div id = "aside4">
						<button type = "button" id = "btnReview_revise">리뷰수정</button>
						<button type = "button" id = "btnReview_delete">리뷰삭제</button>
					</div>
				</section>
				<section id = "section2">
					<div id = "aside1">
						<span>더조은 동물병원</span>
						<span>02-1234-1234</span>
						<span>
							<span>강남구</span>
						</span>
						<img src = "http://localhost:9000/petcarepedia/images/cat.png">
						<span>과테말라 냥이</span>
					</div>
					<div id = "aside2">
						<img src = "http://localhost:9000/petcarepedia/images/hos.png">
					</div>
					<div id = "aside3">
						<span>동물 종류 : 고양이</span>
						<span>교정상담 받았습니다. 선생님이 친절하세요. 선생님이 친절하세요.교정상담 받았습니다. 선생님이 친절하세요. 선생님이 친절하세요.교정상담 받았습니다. 선생님이 친절하세요. 선생님이 친절하세요.
								교정상담 받았습니다. 선생님이 친절하세요. 선생님이 친절하세요.교정상담 받았습니다. 선생님이 친절하세요. 선생님이 친절하세요.교정상담 받았습니다.
						</span>
						<span>진료 일자 : 2023-04-26</span>
					</div>
					<div id = "aside4">
						<button type = "button" id = "btnReview_revise">리뷰수정</button>
						<button type = "button" id = "btnReview_delete">리뷰삭제</button>
					</div>
				</section>
				
			</div>
		</section>
	</div>	
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>