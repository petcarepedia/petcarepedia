<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="http://localhost:9000/css/admin1.css">
	<link rel="stylesheet" href="http://localhost:9000/css/kang_style.css">
	<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
		<link href="http://localhost:9000/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
	<title>펫캐어피디아 | 관리자</title>
	<script>
	$(document).ready(function(){
		$("#btn_report").click(function(){
			Swal.fire({
				icon: 'warning',
				title: '신고를 취소하시겠습니까?',
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
					title: '취소가 완료되었습니다.'
				}).then(() => {
					ReportDeleteForm.submit();

				});
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
			<div class="content">
			<section class="review_content">
				<section id = "section1">
					<div>
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

					<div class="review_detail">
						<form name="ReportDeleteForm" action="/admin/review_report_delete" method="post">
							<div id = "table" >
								<input type="hidden" id="rid" name="rid" value="${review.rid }">
								<input type="hidden" id="rrid" name="rrid" value="${review_report.rrid }">
								<table class="rv_detail_menu">
									<tr>
										<th>병원이름</th>
										<td>
											${review_report.hname }
										</td>

									</tr>
									<tr>
										<th>작성자</th>
										<td>${review_report.msfile}${review_report.mid}</td>
									</tr>
									<tr>
										<th>상세내용</th>
										<td colspan='3'>
											${review_report.rcontent }
										</td>
									</tr>
								</table>
							</div>
						</form>
						<div class="table_right">
							<div id="right_top">
								<button type="button" id="btnLike" disabled>
										♥️${review_report.rlike }
								</button>
							</div>
							<div id="star">
								<div class="score" id="score_l">
									평점
								</div>
								<div id="avg" class="score">
									⭐ ${review_report.rstar } / 5.0
								</div>
							</div>
							<table>
								<tr>
									<td>작성일자</td>
									<td>${review_report.rdate}</td>
								</tr>
							</table>

							<div id="dButton">
								<a href="http://localhost:9000/admin/review_delete2/1/${review_report.rid}/">
									<button type="submit" class="button5" id="btn_delete">삭제하기</button>
								</a>
								<button type="submit" class="button5" id="btn_report">신고취소</button>
								<a href="http://localhost:9000/admin/review_list/1/">
									<button type="button" class="button5" id="btn_before">이전으로</button>
								</a>
							</div>
						</div>
					</div>
				</section>
			</section>
		</div>
	</div>
<!-- footer -->
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>