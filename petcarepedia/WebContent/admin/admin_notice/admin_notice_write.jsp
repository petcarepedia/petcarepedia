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
	<div class="content">
		<section class="notice">
			<div id="title_l">
				<h1 class="title">관리자 - 공지사항</h1>
			</div>
			<form name="writeForm" action="#"  method="get">
				<table class="notice_content">
					<tr>
						<td>
							<input type="text" name="ntitle">
						</td>
					</tr>
					<tr>
						<td>
							<textarea name="ncontent" class="ncontent"></textarea>
						</td>
					</tr>					
				</table>
					<div class="nw_button_r">
						<button type="button" class="ad_button">등록</button>
						<a href="admin_notice.jsp"><button type="button" class="ad_button">취소</button></a>
					</div>
			</form>
		</section>
	</div>
</body>
</html>