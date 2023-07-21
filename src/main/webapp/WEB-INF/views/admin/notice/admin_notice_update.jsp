<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://localhost:9000/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
<title>펫캐어피디아 | 관리자 공지사항</title>
<link rel="stylesheet" href="http://localhost:9000/css/kang_style.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/petcarepedia_jsp_jquery_kang.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.10/dist/sweetalert2.all.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.10/dist/sweetalert2.min.css" rel="stylesheet">
</head>
<body>
	<!-- header -->
	<jsp:include page="../admin_header.jsp"></jsp:include>
	<div class="content">
		<section class="notice">
			<div id="title_l">
				<h1 class="title">공지사항 수정</h1>
			</div>
			<form name="updateForm" action="/admin_notice_update" method="post">
				<input type="hidden" name="nid" value="${nvo.nid }">
				<input type="hidden" name="page" value="${page }">
				<table class="notice_content">
					<tr>
						<td>
							<input type="text" name="title" id="title" value="${nvo.title }">
						</td>
					</tr>
					<tr>
						<td>
							<textarea name="ncontent" class="ncontent" id="ncontent">${nvo.ncontent }</textarea>
						</td>
					</tr>						
				</table>
				<div class="nw_button_r">
					<button type="button" class="ad_button" id="BTN_update">수정</button>
					<a href="/admin_notice_content/${nvo.nid }/${page }"><button type="button" class="ad_button">취소</button></a>
				</div>
			</form>
		</section>
	</div>
	<!-- footer -->
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>