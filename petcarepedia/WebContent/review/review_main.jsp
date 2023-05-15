<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://localhost:9000/petcarepedia/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/petcarepedia/js/petcarepedia_jsp_jquery_kang.js"></script>
<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/kang_style.css">
</head>
<body>
	<!-- header -->
	<iframe src="http://localhost:9000/mycgv/header.html" 
				scrolling="no" width="100%" height="100px" frameborder="0"></iframe>
				
	<form name="reviewForm" action="#" method="get">			
	<div id="best_review" class="review">
		<p>사용자 추천 리뷰</p>
		<ul>
			<li>
				<a href="review_content.jsp">
					<div class=review_top>
						<span class="h_name">
							더조은동물병원
						</span>
						<span class="star">
							⭐ 5.0 
						</span>
					</div>
					<div class="tag">
						<ul>
							<li class="location_tag">강남구</li>
							<li class="animal_tag">강아지</li>
						</ul>
					</div>
					<div class="review_text">
						<p class="sub_title">친절하고 과잉진료 없는 병원!</p>
						벌써 몇 년간 믿고 다니는 병원입니다. 원장님부터 카운터 선생님들까지 모두 친절하시고 아이들도 좋아해주세요~
						<br>동물병원 과잉진료 정말 심하잖아요? 여기 다니기 전에는 저도 바가지 참 많이 썼었는데... 원장님이 항상 진심을 가지고 진료를 봐주시는게 느껴져셔 항상 감사해요!
					</div>
					<div class=review_bottom>
						<span class="review_like">
							♥️
						</span>
						<span class="review_like_count">
							100
						</span>
						<span class="review_date">
							2023-04-20
						</span>
					</div>
				</a>
			</li>
			<li><a href="#">리뷰</a></li>
			<li><a href="#">리뷰</a></li>
		</ul>
	</div>
	<div id="filter_page" class="review">
	<p>상세검색</p>
		<table id="filter_lo" class="filter">
			<tr>
				<th rowspan='3'>지역구분</th>
				<td><input type="checkbox" name="filter_location" value="서울전체"> 서울전체</td>
				<td><input type="checkbox" name="filter_location" value="강남구"> 강남구</td>
				<td><input type="checkbox" name="filter_location" value="강북구"> 강북구</td>
				<td><input type="checkbox" name="filter_location" value="강서구"> 강서구</td>
				<td><input type="checkbox" name="filter_location" value="관악구"> 관악구</td>
				<td><input type="checkbox" name="filter_location" value="광진구"> 광진구</td>
				<td><input type="checkbox" name="filter_location" value="구로구"> 구로구</td>
				<td><input type="checkbox" name="filter_location" value="금천구"> 금천구</td>
				<td><input type="checkbox" name="filter_location" value="노원구"> 노원구</td>
				<td><input type="checkbox" name="filter_location" value="도봉구"> 도봉구</td>
			</tr>
			<tr>
				<td><input type="checkbox" name="filter_location" value="동대문구"> 동대문구</td>
				<td><input type="checkbox" name="filter_location" value="동작구"> 동작구</td>
				<td><input type="checkbox" name="filter_location" value="마포구"> 마포구</td>
				<td><input type="checkbox" name="filter_location" value="서대문구"> 서대문구</td>
				<td><input type="checkbox" name="filter_location" value="서초구"> 서초구</td>
				<td><input type="checkbox" name="filter_location" value="성동구"> 성동구</td>
				<td><input type="checkbox" name="filter_location" value="성북구"> 성북구</td>
				<td><input type="checkbox" name="filter_location" value="송파구"> 송파구</td>
				<td><input type="checkbox" name="filter_location" value="양천구"> 양천구</td>
				<td><input type="checkbox" name="filter_location" value="영등포구"> 영등포구</td>
			</tr>
			<tr>
				<td><input type="checkbox" name="filter_location" value="용산구"> 용산구</td>
				<td><input type="checkbox" name="filter_location" value="은평구"> 은평구</td>
				<td><input type="checkbox" name="filter_location" value="종로구"> 종로구</td>
				<td><input type="checkbox" name="filter_location" value="중구"> 중구</td>
				<td><input type="checkbox" name="filter_location" value="중량구"> 중량구</td>
				<td> </td>
				<td> </td>
				<td> </td>
				<td> </td>
				<td> </td>
			</tr>
		</table>
		<table id="filter_ani" class="filter">
			<tr>
				<th>반려동물 유형</th>
				<td><input type="checkbox" name="filter_animal" value="강아지"> 강아지</td>
				<td><input type="checkbox" name="filter_animal" value="고양이"> 고양이</td>
				<td><input type="checkbox" name="filter_animal" value="파충류"> 파충류</td>
				<td><input type="checkbox" name="filter_animal" value="조류"> 조류</td>
				<td><input type="checkbox" name="filter_animal" value="기타"> 기타</td>
				<td> </td>
				<td> </td>
				<td> </td>
				<td> </td>
				<td> </td>
			</tr>
		</table>
	</div>
	<div id="review" class="review">
		<div id="title">
			<span>리뷰</span>
			<span><a href="#">리뷰쓰기 ></a></span>
		</div>
		<ul>
			<li id="result_sort">
				<span>2개의 결과</span>
			</li>
			<% for(int i=0; i<20; i++) {%>
					<li class="review_list">
						<ul>
							<li id="list_left" class="list">
								<p><img src="#">과테말라냥이</p>
								<div id="star">
									<div id="avg">
										⭐ 5 / 5
									</div>
									<div id="rating">
										<ul>
											<li>친절  ⭐⭐⭐⭐⭐</li>
											<li>위생  ⭐⭐⭐⭐⭐</li>
										</ul>
									</div>
								</div>
							</li>
								<li id="list_middle" class="list">
									<a href="review_content.jsp">	
										<p>동물 종류 : 고양이</p>
										<div>
											벌써 몇 년간 믿고 다니는 병원입니다. 원장님부터 카운터 선생님들까지 모두 친절하시고 아이들도 좋아해주세요~
											<br>동물병원 과잉진료 정말 심하잖아요? 여기 다니기 전에는 저도 바가지 참 많이 썼었는데... 원장님이 항상 진심을 가지고 진료를 봐주시는게 느껴져셔 항상 감사해요!
										</div>
									</a>
								</li>
							<li id="list_right" class="list">
								<table>
									<tr>
										<td>작성일자</td>
										<td>2023/4/28</td>
									</tr>
									<tr>
										<td>진료일자</td>
										<td>2023/4/28</td>
									</tr>
								</table>
								<button type="button">
									도움이 되었어요
									<span>
										♥️
									</span>
									100
								</button>
								<button type="button" class="report">신고하기</button>
								<table id="main_hits">
									<tr>
										<td>조회수</td>
										<td>150</td>
									</tr>
								</table>
							</li>
						</ul>
					</li>
			<% } %>
			<li><a href="#" id="load">더 보기</a></li>
		</ul>
	</div>
	</form>
	
	<!-- footer -->
	<iframe src="http://localhost:9000/mycgv/footer.html" 
				scrolling="no" width="100%" height="400px" frameborder="0"></iframe>
</body>
</html>