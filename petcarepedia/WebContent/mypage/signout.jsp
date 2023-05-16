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
		<section id = "signout">
			<h1 id = "title">회원 탈퇴하기</h1>
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
				<div>
					<span>주의</span>
					<span>회원 탈퇴시 개인정보는 7일 후 삭제됩니다. 7일 안에 재가입을 원하실 경우 가능합니다. 만약, 7일 이후에 재가입을 원하실 경우 고객센터로 전화문의시 재가입을 도와드리겠습니다.</span>
				</div>
			</section>
			<section id = "section3">
				<span>비밀번호를 입력해주세요</span>
				<input type = "text" placeholder = "비밀번호 입력">
				<button type = "button">회원탈퇴</button>
			</section>
		</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>