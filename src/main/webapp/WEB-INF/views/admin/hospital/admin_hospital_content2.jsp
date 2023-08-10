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
	<link href="http://localhost:9000/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
	<title>펫캐어피디아 | 관리자</title>
	<script>
		$(document).ready(function(){
			$("#btn_noAuth").click(function(){
				Swal.fire({
					icon: 'warning',
					title: '승인을 거부하시겠습니까?',
					html: '	 <input type="radio" name="reject" value="r1"/> <span>병원명 중복 또는 부적절<span><br> ' +
							'<input type="radio" name="reject" value="r2"/> <span >부적절한 주소 및 지역구 불일치<span> <br> ' +
							'<input type="radio" name="reject" value="r3"/> <span>병원 소개 부적절<span> <br>' +
							'<input type="radio" name="reject" value="r4"/> <span>병원 이미지 부적절<span> <br>' +
							'<input type="radio" name="reject" value="r5"/> <span>기타 사유, 문의 바람<span>',
					showCancelButton: true,
					confirmButtonColor: '#FFB3BD',
					cancelButtonColor: '#98DFFF',
					confirmButtonText: '확인',
					cancelButtonText: '취소'
				}).then((result) => {
					if (result.isConfirmed) {
						var reject = $("input[name='reject']:checked").val(); //라디오의 선택된 값을 가져옴
						if(reject == null){
							Swal.fire({
								icon: 'error',
								title: '승인 거부 사유를 선택해주세요',
								showConfirmButton: true,
								confirmButtonColor: '#98DFFF',
								confirmButtonText: '확인'
							});
						}else{
							$.ajax({
								url: "/reject_reson/${hospital.hid}",
								type: "GET",
								success:function(result){
									if (result == "fail") {
										Swal.fire({
											icon: 'error',
											title: '승인 거부된 상태입니다',
											showConfirmButton: true,
											confirmButtonText: '확인',
											confirmButtonColor: '#98dfff'
										}).then(function() {
											location.reload();
										});
									} else if (result == "success") {
										Swal.fire({
											icon: 'success',
											title: '승인 거부가 완료되었습니다',
											showConfirmButton: true,
											confirmButtonText: '확인',
											confirmButtonColor: '#98dfff'
										}).then(function () {

										});
									}
								}
							});//ajax
						}//else
					}
				});
			});
		});
	</script>

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
						<form name="authForm" action="/admin/auth_update" method="post">
							<input type = "hidden" name = "hid" value = "${hospital.hid}">
							<input type = "hidden" name = "hsfile" value = "${hospital.hsfile}">
							<input type = "hidden" name = "auth" value = "${hospital.auth}">

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
										<c:choose>
											<c:when test="${hospital.auth == 'auth'}">
												<input type="text" name="auth" id="auth" value="승인">
											</c:when>
											<c:otherwise>
												<input type="text" name="auth" id="auth" value="미승인">
											</c:otherwise>
										</c:choose>
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
										<button type="submit" class="button5" id="btn_auth">승인 완료</button>
										<button type="button" class="button5" id="btn_noAuth">승인 거부</button>
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