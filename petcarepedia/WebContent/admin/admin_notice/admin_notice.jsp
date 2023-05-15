<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Hospital- List </title>
<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/kang_admin.css">
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
								<li><a href = "http://localhost:9000/animal/admin/review/review_list.jsp">신고 리뷰 관리</a></li>
								<li><a href = "http://localhost:9000/animal/admin/reserve/reserve_list.jsp">예약 관리</a></li>
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
							<button type="button" class="button"><a href="admin_notice_write.jsp">등록</a></button>
						</td>
					</tr>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일자</th>
						<th>조회수</th>
					</tr>
					<tr>
					<td>1</td>
					<td><a href="admin_notice_content.jsp">공지사항 입니다.</a></td>
					<td>2023/4/26 18:38</td>
					<td>1000</td>
					</tr>
					<tr>
						<td>2</td>
						<td>공지사항 입니다.</td>
						<td>2023/4/26 18:38</td>
						<td>1000</td>
					</tr>
					<tr>
						<td>3</td>
						<td>공지사항 입니다.</td>
						<td>2023/4/26 18:38</td>
						<td>1000</td>
					</tr>
					<tr>
						<td>4</td>
						<td>공지사항 입니다.</td>
						<td>2023/4/26 18:38</td>
						<td>1000</td>					
					</tr>
					<tr>
						<td>5</td>
						<td>공지사항 입니다.</td>
						<td>2023/4/26 18:38</td>
						<td>1000</td>					
					</tr>
					<tr>
						<td>6</td>
						<td>공지사항 입니다.</td>
						<td>2023/4/26 18:38</td>
						<td>1000</td>					
					</tr>
					<tr>
						<td>7</td>
						<td>공지사항 입니다.</td>
						<td>2023/4/26 18:38</td>
						<td>1000</td>					
					</tr>
					<tr>
						<td>8</td>
						<td>공지사항 입니다.</td>
						<td>2023/4/26 18:38</td>
						<td>1000</td>					
					</tr>
					<tr>
						<td>9</td>
						<td>공지사항 입니다.</td>
						<td>2023/4/26 18:38</td>
						<td>1000</td>					
					</tr>
					<tr>
						<td>10</td>
						<td>공지사항 입니다.</td>
						<td>2023/4/26 18:38</td>
						<td>1000</td>					
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