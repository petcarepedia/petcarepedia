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
		<section id = "review_revise">
			<h1 id = "title">리뷰수정</h1>
			<hr>
			<form name="review_writeForm" action="#" method="get">
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
					<section>
						<img src = "http://localhost:9000/petcarepedia/images/cat.png">
						<span>과테말라 냥이</span>
						<span>의사의 진료는 어떠셨나요?</span>
						<span>별점을 선택해주세요</span>
						<!-- <img src = "http://localhost:9000/petcarepedia/images/star.png">
						<img src = "http://localhost:9000/petcarepedia/images/star.png">
						<img src = "http://localhost:9000/petcarepedia/images/star.png">
						<img src = "http://localhost:9000/petcarepedia/images/star.png">
						<img src = "http://localhost:9000/petcarepedia/images/star.png"> -->
						<div id = "star">
							<fieldset>
								<input type="radio" name="reviewStar" value="5" id="rate1"><label
									for="rate1">★</label>
								<input type="radio" name="reviewStar" value="4" id="rate2"><label
									for="rate2">★</label>
								<input type="radio" name="reviewStar" value="3" id="rate3"><label
									for="rate3">★</label>
								<input type="radio" name="reviewStar" value="2" id="rate4"><label
									for="rate4">★</label>
								<input type="radio" name="reviewStar" value="1" id="rate5"><label
									for="rate5">★</label>
							</fieldset>
						</div>
						<!-- <span>치료에 대한 자세한 설명</span> -->
						<!-- <img src = "http://localhost:9000/petcarepedia/images/star.png">
						<img src = "http://localhost:9000/petcarepedia/images/star.png">
						<img src = "http://localhost:9000/petcarepedia/images/star.png">
						<img src = "http://localhost:9000/petcarepedia/images/star.png">
						<img src = "http://localhost:9000/petcarepedia/images/star.png"> -->
					</section>
					<textarea name="review" placeholder="진료에 대한 경험을 진솔하게 작성해주세요(30~50자내)"></textarea>
					<button type = "button" id = "cancle">취소</button>
					<button type = "submit" id = "write_finish">작성완료</button>
				</div>
			</form>
		</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>