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
		<section class="notice">
			<div id="title_l">
				<h1 class="title">관리자 - 공지사항</h1>
			</div>
			<table class="notice_content" id="nct">
				<tr>
					<td>CGV 공지사항 입니다.</td>
				</tr>
				<tr>
					<td>
						2023년 4월 26일 기준 전체 시스템 점검 예정입니다.<br>
						참고바랍니다.
					</td>
				</tr>
			</table>
			<div id="date">2323/04/26 18:38</div>
			<div class="nc_button_r">
				<a href="notice.jsp"><button type="button" class="button">목록</button></a>
			</div>
		</section>
	</div>
	<!-- footer -->
	<iframe src="http://localhost:9000/mycgv/footer.html" 
				scrolling="no" width="100%" height="400px" frameborder="0"></iframe>
</body>
</html>