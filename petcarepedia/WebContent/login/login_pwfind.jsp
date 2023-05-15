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
			
			<form name="pwFindForm" action="login_pwfindProc.jsp" method="post">
				<div class="find-box">
					<div class="find-pw">
						<div id="btnMenuIdFind">아이디 찾기</div>
						<div id="btnMenuPwFind">비밀번호 재설정</div>
					</div>
					
					<p>비밀번호를 재설정하려면 계정 정보를 입력해주세요.</p>
					
					<ul>
						<li>
							<label>아이디</label>
							<input type="text" name="id" id="id" placeholder="아이디 입력">
						</li>
						<li>
							<label>성명</label>
							<input type="text" name="name" id="name" placeholder="성명 입력">
						</li>
						<li>
							<label>휴대폰</label>
							<select name="phone1" id="phone1">
								<option value="default">선택</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="017">017</option>
							</select>
							<input type="text" name="phone2" id="phone2" placeholder="1234" class="input-short2">
							<input type="text" name="phone3" id="phone3" placeholder="5678" class="input-short2">
						</li>
						<li><button type="button" id="btnPwFind" class="btn-submit" disabled>계정 정보 확인</button></li>
					</ul>
				</div>
			</form>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>