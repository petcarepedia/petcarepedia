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
			<form name="updateForm" action="#" method="get">
				<table class="notice_content">
					<tr>
						<td>
							<input type="text" name="ntitle" value="CGV 공지사항 입니다.">
						</td>
					</tr>
					<tr>
						<td>
							<textarea name="ncontent" class="ncontent">2023년 4월 기준 전체 시스템 점검 예정입니다.참고해주세요.</textarea>
						</td>
					</tr>						
				</table>
				<div class="nw_button_r">
					<button type="button" class="ad_button">수정</button>
					<a href="admin_notice_content.jsp"><button type="button" class="ad_button">취소</button></a>									
				</div>
			</form>
		</section>
	</div>
	<iframe src="http://localhost:9000/mycgv/footer.html" 
				scrolling="no" width="100%" height="400px" frameborder="0"></iframe>
</body>
</html>