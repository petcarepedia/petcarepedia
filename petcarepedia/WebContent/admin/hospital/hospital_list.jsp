<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Hospital- List </title>
<link rel="stylesheet" href="http://localhost:9000/animal/css/admin.css">
</head>
<body>
<!-- header -->
	<iframe width="100%" height="100px" frameborder=0></iframe>
	
	<div class="d1">
		<section class="hospital">
			<section id = "section1">
				<div>
					<nav>
						<ul>
							<li>병원관리</li>
							<li><a href = "http://localhost:9000/animal/admin/hospital/hospital_list.jsp">병원 관리</a></li>
							<li><a href = "http://localhost:9000/animal/admin/member/member_list.jsp">회원 관리</a></li>
							<li><a href = "http://localhost:9000/animal/admin/reserve/reserve_list.jsp">예약 관리</a></li>
							<li><a href = "http://localhost:9000/animal/admin/review/review_list.jsp">신고 리뷰 관리</a></li>
							<li><a href = "http://localhost:9000/animal/admin/review/review_list.jsp">공지 사항 관리</a></li>
							<li><a href = "#">나가기</a></li>
						</ul>
					</nav>
				</div>
			</section>
		<section id="section2">
			<div class="d2">
				<input type="text" class="search_bar" placeholder="병원명 입력">
				<button class="button1"><img src="http://localhost:9000/animal/css/foot_sky.png"></button>
			</div>
				<table class="table">
					<tr>
						<td colspan="5" >
							<button type="button" class="button"><a href="http://localhost:9000/animal/admin/hospital/hospital_detail.jsp">등록</a></button>
							<button type="button" class="button"><a href="#">수정</a></button>
							<button type="button" class="button">삭제</button>
						</td>
					</tr>
					<tr>
						<th>번호</th>
						<th>병원명</th>
						<th>상태</th>
						<th>등록일</th>
						<th>수정일</th>
					</tr>
					<tr>
						<td>1</td>
						<td><a href="hospital_list_detail.jsp">멍멍동물병원</a></td>
						<td>영업중</td>
						<td>2023-01-01</td>
						<td>2023-04-23</td>
					</tr>
					<tr>
						<td>2</td>
						<td>멍멍동물병원</td>
						<td>영업중</td>
						<td>2023-01-01</td>
						<td>2023-04-23</td>
					</tr>
					<tr>
						<td>3</td>
						<td>멍멍동물병원</td>
						<td>영업중</td>
						<td>2023-01-01</td>
						<td>2023-04-23</td>
					</tr>
					<tr>
						<td>4</td>
						<td>멍멍동물병원</td>
						<td>영업중</td>
						<td>2023-01-01</td>
						<td>2023-04-23</td>
					</tr>
					<tr>
						<td>4</td>
						<td>멍멍동물병원</td>
						<td>영업중</td>
						<td>2023-01-01</td>
						<td>2023-04-23</td>
					</tr>
					<tr>
						<td>6</td>
						<td>멍멍동물병원</td>
						<td>영업중</td>
						<td>2023-01-01</td>
						<td>2023-04-23</td>
					</tr>
					<tr>
						<td>7</td>
						<td>멍멍동물병원</td>
						<td>영업중</td>
						<td>2023-01-01</td>
						<td>2023-04-23</td>
					</tr>
					<tr>
						<td>8</td>
						<td>멍멍동물병원</td>
						<td>영업중</td>
						<td>2023-01-01</td>
						<td>2023-04-23</td>
					</tr>
					<tr>
						<td>9</td>
						<td>멍멍동물병원</td>
						<td>영업중</td>
						<td>2023-01-01</td>
						<td>2023-04-23</td>
					</tr>
					<tr>
						<td>10</td>
						<td>멍멍동물병원</td>
						<td>영업중</td>
						<td>2023-01-01</td>
						<td>2023-04-23</td>
					</tr>
					<tr>
						<td colspan ="5" class="text">
							<br><br>
						</td>
					</tr>
					<tr>
						<td colspan="5" class="number"><<  1  2  3  4  5  6  7  8  9  10  >></td>
					</tr>
				</table>
			</section>
		</section>
	</div>
	<!-- footer -->
		<iframe  width="100%" height="350px" frameborder=0></iframe>
</body>
</html>