<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/kang_style.css">
</head>
<body>
	<!-- header -->
	<iframe src="http://localhost:9000/mycgv/header.html" 
				scrolling="no" width="100%" height="100px" frameborder="0"></iframe>
	<div class="content">
		<section class="review_content">
			<div id="title_l">
				<h1 class="title">리뷰상세</h1>
			</div>
			<div class="review_detail">
				<table class="rv_detail_menu">
					<tr>
						<th>병원이름</th>
						<td>더조은동물병원</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><img src="#">과테말라냥이</td>
						<th>동물 종류</th>
						<td>고양이</td>
					</tr>
					<tr>
						<th>상세내용</th>
						<td colspan='3'>교정상담 받았습니다. 선생님이 친절하세요. 선생님이 친절하세요.교정상담 받았습니다. 선생님이 친절하세요. 선생님이 친절하세요.교정상담 받았습니다. 선생님이 친절하세요. 선생님이 친절하세요.
교정상담 받았습니다. 선생님이 친절하세요. 선생님이 친절하세요.교정상담 받았습니다. 선생님이 친절하세요. 선생님이 친절하세요.교정상담 받았습니다. 선생님이 친절하세요. 선생님이 친절하세요.
						</td>
					</tr>
				</table>
				<div class="table_right">
					<div id="right_top">
						<button>
							<span class="review_like">
								♥️
							</span>
							100
						</button>
						<img src="#">
					</div>
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
					<table>
						<tr>
							<td rowspan="2" class="td">조회수</td>
							<td rowspan="2" class="td" id="tdc">100</td>
							<td>작성일자</td>
							<td>2023-05-13</td>
						</tr>
						<tr>
							<td>진료일자</td>
							<td>2023-05-13</td>
						</tr>
					</table>
				</div>
				<button type="button" class="report">신고하기</button>
			</div>
			<div class="rc_button_r">
				<a href="review_update.jsp"><button type="button" class="button">수정</button></a>
				<a href="review_delete.jsp"><button type="button" class="button">삭제</button></a>
				<a href="review_main.jsp"><button type="button" class="button">목록</button></a>
			</div>
		</section>
	</div>
	<!-- footer -->
	<iframe src="http://localhost:9000/mycgv/footer.html" 
				scrolling="no" width="100%" height="400px" frameborder="0"></iframe>
</body>
</html>