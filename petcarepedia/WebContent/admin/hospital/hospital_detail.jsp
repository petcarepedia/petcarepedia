<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Hospital - List</title>
	<link rel="stylesheet" href="http://localhost:9000/animal/css/admin.css">
</head>
<body>
<!-- header -->
	<iframe width="100%" height="100px" frameborder=0></iframe>
	<div class="d1">
		<section id="hospital_data">
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
				<table class="table">
					<tr>
						<th>병원명</th>
						<td><input type="text" name="name" id = "name"></td>
					</tr>
					<tr>
						<th>위치</th>
						<td><input type="text" name="address" id="address"></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="text" name="phone" id="phone"> </td>
					</tr>
					<tr>
						<th>영업시간</th>
						<td>
							<textarea name="time" id="time" placeholder="영업시간 : 00:00 ~ 00:00 
																		점심시간 : 00:00 ~ 00:00
																		야간근무시간 : 00:00 ~ 00:00"
																		></textarea>
						</td>
					</tr>
					<tr>
						<th>휴무일</th>
						<td><input type="text" name="close" id="close" placeholder ="매주  요일"> </td>
					</tr>
					<tr>
						<th>취급 동물</th>
						<td><input type="text" name="animal" id="animal"> </td>
					</tr>
					<tr>
						<th>강조사항(선택)</th>
						<td><textarea name="check" id="check"></textarea></td>
					</tr>
					<tr>
						<th>첨부파일<th>
						<input type="file" name="file" id="file">
					</tr>
					<tr>
						<td colspan="2"><button type="button" class="button4">저장하기</button></td>
					</tr>
				</table>
			</section>
		</section>
	</div>
</body>
</html>