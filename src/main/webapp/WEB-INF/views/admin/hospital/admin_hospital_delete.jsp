<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			$("#btn_delete").click(function(){
				event.preventDefault(); // 폼 전송을 막음
		        // 삭제 완료 버튼 클릭 시 실행되는 함수
		        Swal.fire({
		            icon: 'warning',
		            title: '정말로 삭제하시겠습니까?',
		            showCancelButton: true,
		            confirmButtonColor: '#FFB3BD',
		            cancelButtonColor: '#98DFFF',
		            confirmButtonText: '확인',
		            cancelButtonText: '취소'
		        }).then((result) => {
		            if (result.isConfirmed) {
		                // 확인 버튼을 눌렀을 경우 삭제 처리
		                Swal.fire({
		            	icon: 'success',
		            	title:'삭제가 완료되었습니다.'
		            }).then(() => {
		            	document.deleteForm.submit();
		            });
		                 // 폼 전송
		                // 삭제 처리를 위한 코드 작성
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
						<form name="deleteForm" action="/admin/hospital_delete" method="post">
						<input type = "hidden" name = "hid" value = "${hospital.hid}">
						<%--<input type = "hidden" name = "hsfile" value = "${hospital.hsfile}">--%>
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
									<td colspan="5"> 
										<button type="submit" class="button5" id="btn_delete">삭제완료</button>
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