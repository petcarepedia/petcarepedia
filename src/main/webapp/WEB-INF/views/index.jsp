<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://localhost:9000/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
<title>우리 동네 동물병원 리뷰 사전, 펫캐어피디아</title>
<link rel="stylesheet" href="http://localhost:9000/css/petcarepedia_song.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/petcarepedia_jquery_song.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=krftgsruiz"></script>
<script>
	$(document).ready(function (){

		$(".inner > img").css("width",document.documentElement.clientWidth);
		$(".main-door").css("width",document.documentElement.clientWidth).css("height",$(".inner > img").height());

		//메인페이지 베너슬라이드
		/*
		  div사이즈 동적으로 구하기
		*/
		const outer = document.querySelector('.main-door');
		const innerList = document.querySelector('.inner-list');
		const inners = document.querySelectorAll('.inner');
		let currentIndex = 0; // 현재 슬라이드 화면 인덱스

		inners.forEach((inner) => {
			inner.style.width = outer.clientWidth+'px'; // inner의 width를 모두 outer의 width로 만들기
		})

		innerList.style.width = (outer.clientWidth * inners.length)+'px'; // innerList의 width를 inner의 width * inner의 개수로 만들기
		/*
		  주기적으로 화면 넘기기
		*/
		const getInterval = () => {
			return setInterval(() => {
				currentIndex++;
				currentIndex = currentIndex >= inners.length ? 0 : currentIndex;
				innerList.style.marginLeft = (-outer.clientWidth * currentIndex)+'px';
			}, 3500);
		}

		let interval = getInterval(); // interval 등록
	});
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="header.jsp"></jsp:include>
	
	<!-- content -->
	<div class="main-door">
		<div class="inner-list">
	      <div class="inner"><img src="http://localhost:9000/images/banner1_b.png"></div>
	      <div class="inner"><img src="http://localhost:9000/images/banner2_b.png"></div>
	      <div class="inner"><img src="http://localhost:9000/images/banner3_b.png"></div>
	      <div class="inner"><img src="http://localhost:9000/images/banner4_b.png"></div>
	    </div>
	</div>
	
	<div class="content main">


		<form name="indexSearchForm" action="/main_search" method="post">
			<div class="main-search">
				<input type="text" placeholder="찾고싶은 동물병원의 이름을 검색해보세요!" name="hname" id="hname-index">
				<button type="button" id="btnMainSearch-index"><img src="http://localhost:9000/images/foot_white.png" width="30px" height="30px"></button>
			</div>
		</form>

		<div id="brbox">
			<jsp:include page="/best_review_list/1"></jsp:include>
		</div>


		<jsp:include page="/main_map"></jsp:include>
		
	</div>
	
	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>