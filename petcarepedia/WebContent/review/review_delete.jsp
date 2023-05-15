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
				<h1 class="title">리뷰삭제</h1>
			</div>
			<form name="deleteForm" action="#" method="get">
				<table class="notice_delete">
					<tr>					
						<td>정말로 삭제 하시겠습니까?</td>
					</tr>				
					<tr>
						<td colspan="2">
							<button type="button" class="ad_button">삭제</button>
							<a href="review_content.jsp"><button type="button" class="ad_button">취소</button></a>
							<a href="review_main.jsp"><button type="button" class="ad_button">목록</button></a>							
						</td>				
					</tr>
				</table>
			</form>
		</section>
	</div>
	<iframe src="http://localhost:9000/mycgv/footer.html" 
				scrolling="no" width="100%" height="400px" frameborder="0"></iframe>
</body>
</html>