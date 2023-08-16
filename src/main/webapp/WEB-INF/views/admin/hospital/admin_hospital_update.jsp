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
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=7reerlqgi2&submodules=geocoder"></script>
	<link href="http://localhost:9000/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
	<title>펫캐어피디아 | 관리자</title>
</head>
<body>
<!-- header -->
	<jsp:include page="../admin_header.jsp"></jsp:include>
	<div class="d1">
		<section id="hospital_update">
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
						<form name="updateForm" action="/admin/hospital_update" method="post" enctype="multipart/form-data">
						<input type = "hidden" name = "hid" value = "${hospital.hid}">
							<table class="table">
								<tr>
									<th>병원명</th>
									<td><input type="text" name="hname" id = "hname" value="${hospital.hname}"></td>
								</tr>
								<tr>
									<th>주소</th>
									<td>
										<input type="text" name="loc" id="loc" value="${hospital.loc}">
										<button type="button" class="button4" id="search_loc" >주소 찾기</button>
									</td>
								</tr>
								<tr>
									<th>좌표</th>
									<td>
										<input type="text" name="x" id="x" placeholder="위도" value="${hospital.x}">
										<input type="text" name="y" id="y" placeholder="경도" value="${hospital.y}">
									</td>
								</tr>
								<tr>
									<th>지역 구</th>
									<td><input type="text" name="gloc" id="gloc" value="${hospital.gloc}"></td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td><input type="text" name="tel" id="tel" value="${hospital.tel}"></td>
								</tr>
								<tr>
									<th>영업시간</th>
									<td>
										<input type="text" name="htime" id="htime" placeholder="영업시간 : 00:00 ~ 00:00" value="${hospital.htime}">
									</td>
								</tr>
								<tr>
									<th>특수동물 진료 여부</th>
									<td><input type="text" name="animal" id="animal" placeholder="O / X " value="${hospital.animal}"> </td>
								</tr>
								<tr>
									<th>야간 근무 여부</th>
									<td><input type="text" name="ntime" id="ntime" placeholder="O / X " value="${hospital.ntime}"> </td>
								</tr>
								<tr>
									<th>공휴일 진료 여부</th>
									<td><input type="text" name="holiday" id="holiday" placeholder="O / X " value="${hospital.holiday}"> </td>
								</tr>
								<tr>
									<th>홈페이지 링크</th>
									<td><input type="text" name="hrink" id="hrink" placeholder="O / X " value="${hospital.hrink}"> </td>
								</tr>
								<tr>
									<th>강조사항(선택)</th>
									<td><textarea name="intro" id="intro" >${hospital.intro}</textarea></td>
								</tr>
								<tr>
									<th>파일 업로드</th>
									<td colspan ="2">
										<c:choose>
											<c:when test = "${hospital.hfile1 != null}">
													<span id="update_file1">${hospital.hfile1}</span>
													<input type="file" name="files" class = "file_first" id = "file1" accept="image/*">
													<input type = "hidden" name = "hfile1" value = "${hospital.hfile1}">
													<input type = "hidden" name = "hsfile1" value = "${hospital.hsfile1}">
											</c:when>
											<c:otherwise>
												<span id="update_file1"> 선택된 파일 없음</span>
												<input type="file" name="files" class = "file_first" id = "file1" accept="image/*">
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test = "${hospital.hfile2 != null}">
													<span id="update_file2">${hospital.hfile2}</span>
													<input type="file" name="files" class = "file_first" id = "file2" accept="image/*">
													<input type = "hidden" name = "hfile2" value = "${hospital.hfile2}">
													<input type = "hidden" name = "hsfile2" value = "${hospital.hsfile2}">
											</c:when>
											<c:otherwise>
												<span id="update_file2">선택된 파일 없음</span>
												<input type="file" name="files" class = "file_first" id = "file2" accept="image/*">
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								<tr>
									<td colspan="5"> 
										<button type="button" class="button5" id="btn_update">수정완료</button>
										<a href="/admin/hospital_content/1/${hospital.hid}/">
											<button type="button" class="button5" id="btn_before">이전으로</button>
										</a>
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