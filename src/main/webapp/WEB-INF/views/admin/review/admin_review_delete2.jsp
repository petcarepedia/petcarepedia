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
	
	<!-- content -->
	<div class="d1">
		<section id="review_delete2">
				<section id = "section1">
					<div id="d2">
						<nav>
							<ul>
								<li>신고리뷰관리</li>
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
						<form name="deleteForm" action="/admin/review_delete" method="post">
							<input type = "hidden" name = "rid" value = "${review.rid}">
							<input type = "hidden" name = "rrid" value = "${review.rrid}">
							<table class="table">
								<tr>
									<th>병원이름</th>
									<td>
										${review.hname }
									</td>
								</tr>
								<tr>
									<th>작성자</th>
									<td>
										<input type = "hidden" id = "msfile" name = "msfile" value = "${review.msfile}">
										<div id = profileBox>
											<img src = "http://localhost:9000/upload/${review.msfile}/" id = "profile">
										</div>
										${review.mid}
									</td>

								</tr>
								<tr>
									<th>상세내용</th>
									<td colspan='3'>
										${review.rcontent }
									</td>
								</tr>
								<tr>
									<td colspan="5"> 
										<button type="submit" class="button5" id="btn_delete">삭제완료</button>
										<a href="/admin/review_detail/1/${review.rrid}/">
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