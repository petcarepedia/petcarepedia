<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://localhost:9000/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
<title>펫캐어피디아 | 공지사항</title>
<link rel="stylesheet" href="http://localhost:9000/css/kang_style.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="content">
		<section class="notice">
			<div id="title_l">
				<h1 class="title" id="notice_title">공지사항</h1>
			</div>
			<table class="notice_content" id="nct">
				<tr>
					<td>${nvo.title }</td>
				</tr>
				<tr>
					<td>
						${nvo.ncontent }
					</td>
				</tr>
			</table>
			<div id="notice_date">${nvo.ndate }</div>
			<div class="nc_button_r" id="notice_btn">
				<a href="/notice/${page}"><button type="button" class="button">목록</button></a>
			</div>
		</section>
	</div>
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>