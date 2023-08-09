<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="http://localhost:9000/css/admin1.css">
	<link rel="stylesheet" href="http://localhost:9000/css/am-pagination.css">
	<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
	<script src="http://localhost:9000/js/petcarepedia_jquery_serin.js"></script>
	<link href="http://localhost:9000/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
	<title>펫캐어피디아 | 관리자</title>
</head>
<body>
<!-- header -->
	<jsp:include page="../admin_header.jsp"></jsp:include>
	<div class="d1">
		<section id="hospital_content">
				<section id = "section1">
					<div id="d2">
						<nav>
							<ul>
								<li>병원관리</li>
								<li><a href = "http://localhost:9000/admin/hospital_list/1/">병원 관리</a></li>
								<li><a href = "http://localhost:9000/admin/member_list/1/">회원 관리</a></li>
								<li><a href = "http://localhost:9000/admin/reserve_list/1/">예약 관리</a></li>
								<li><a href = "http://localhost:9000/admin/review_list/1/">신고 리뷰 관리</a></li>
								<li><a href = "http://localhost:9000/admin/notice/1/">공지 사항 관리</a></li>
							</ul>
						</nav>
					</div>
				</section>
				<section id="section2">
					<div id="d3">
						<form name="updateForm" action="/hospital_update" method="post">
						<input type = "hidden" name = "hid" value = "${hospital.hid}">
						<input type = "hidden" name = "hsfile" value = "${hospital.hsfile}">
							<table class="table">
								<tr>
									<th>병원명</th>
									<td><input type="text" name="hname" id = "hname" value="${hospital.hname}" disabled></td>
								</tr>
								<tr>
									<th>주소</th>
									<td><input type="text" name="loc" id="loc" value="${hospital.loc}" disabled></td>
								</tr>
								<tr>
									<th>좌표</th>
									<td>
										<input type="text" name="x" id="x" value="${hospital.x}" placeholder="위도" disabled>
										<input type="text" name="y" id="y" value="${hospital.y}" placeholder="경도" disabled>
									</td>
								</tr>
								<tr>
									<th>지역 구</th>
									<td><input type="text" name="gloc" id="gloc" value="${hospital.gloc}" disabled></td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td><input type="text" name="tel" id="tel" value="${hospital.tel}" disabled></td>
								</tr>
								<tr>
									<th>영업시간</th>
									<td>
										<input type="text" name="htime" id="htime" placeholder="영업시간 : 00:00 ~ 00:00" value="${hospital.htime}" disabled>
									</td>
								</tr>
								<tr>
									<th>특수동물 진료 여부</th>
									<td><input type="text" name="animal" id="animal" placeholder="O / X " value="${hospital.animal}" disabled> </td>
								</tr>
								<tr>
									<th>야간 근무 여부</th>
									<td><input type="text" name="ntime" id="ntime" placeholder="O / X " value="${hospital.ntime}" disabled> </td>
								</tr>
								<tr>
									<th>공휴일 진료 여부</th>
									<td><input type="text" name="holiday" id="holiday" placeholder="O / X " value="${hospital.holiday}" disabled> </td>
								</tr>
								<tr>
									<th>홈페이지 링크</th>
									<td><input type="text" name="hrink" id="hrink" value="${hospital.hrink}" disabled> </td>
								</tr>
								<tr>
									<th>승인 여부</th>
									<td>
										<input type="radio" name="auth" value="#{hospital.auth}">
										<input type="radio" name="unauth" value="#{hospital.auth}">
									</td>
								</tr>
								<tr>
									<th>강조사항(선택)</th>
									<td><textarea name="intro" id="intro"  disabled>${hospital.intro}</textarea></td>
								</tr>
								<tr>
									<th>파일 업로드</th>
									<td colspan ="2">
										<input type="hidden" name="hfile1" value="${hospital.hfile1}">
										<input type="hidden" name="hfile2" value="${hospital.hfile2}">
										<input type="file" name="files" id ="files" disabled>
										<c:choose>
											<c:when test="${hospital.hfile1 != null}">
												<span id="update_file1">${hospital.hfile1}</span>
											</c:when>
											<c:otherwise>
												<span id="update_file1"></span>
											</c:otherwise>
										</c:choose>

										<input type="file" name="files" id ="files2" disabled>
										<c:choose>
											<c:when test="${hospital.hfile2 != null}">
												<span id="update_file2">${hospital.hfile2}</span>
											</c:when>
											<c:otherwise>
												<span id="update_file2"></span>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								<tr>
									<td colspan="2"> 
										<button type="button" class="button5" id="btn_content">승인 완료</button>
										<button type="button" class="button5" id="btn_delete">승인 거부</button>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</section>
		</section>
	</div>
	<!-- footer -->
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>