<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://localhost:9000/petcarepedia/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
<title>펫캐어피디아 | 아이디,비밀번호 찾기</title>
<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/petcarepedia_song.css">
<script src="http://localhost:9000/petcarepedia/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/petcarepedia/js/petcarepedia_jquery_song.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	
	<!-- content -->
	<div class="content">
		<div class="find-content">
			<div class="content-logo">
				<img src="http://localhost:9000/petcarepedia/images/contentlogo.png" width="300px">
			</div>
			
			<form name="pwUpdateForm" action="login_pwupdateProc.jsp" method="post">
				<div class="find-box">
					<div class="find-pw">
						<div id="btnMenuIdFind">아이디 찾기</div>
						<div id="btnMenuPwFind">비밀번호 재설정</div>
					</div>
					
					<p>hong**** 계정의 비밀번호를 재설정해주세요.</p>
					
					<ul>
						<li>
							<label>새 비밀번호</label>
							<input type="password" name="pass" id="pass" placeholder="8~16자리 영문, 숫자, 특수문자 조합">
							<span id="pwcheck_msg"></span>
						</li>
						<li>
							<label>새 비밀번호 확인</label>
							<input type="password" name="cpass" id="cpass" placeholder="비밀번호를 다시 입력해주세요">
							<span id="cpwcheck_msg"></span>
						</li>
						<li><button type="button" id="btnPwUpdate" class="btn-submit" disabled>비밀번호 재설정</button></li>
					</ul>
				</div>
			</form>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>