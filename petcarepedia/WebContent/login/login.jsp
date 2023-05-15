<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://localhost:9000/petcarepedia/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
<title>펫캐어피디아 | 로그인</title>
<link rel="stylesheet" href="http://localhost:9000/petcarepedia/css/petcarepedia_song.css">
<script src="http://localhost:9000/petcarepedia/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/petcarepedia/js/petcarepedia_jquery_song.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	
	<!-- content -->
	<div class="content">
		<div class="login-content">
			<div class="content-logo">
				<img src="http://localhost:9000/petcarepedia/images/contentlogo.png" width="300px">
			</div>
			
			<form name="loginForm" action="loginProc.jsp" method="post">
				<ul>
					<li><input type="text" name="id" id="id" placeholder="아이디"></li>
					<li><input type="password" name="pass" id="pass" placeholder="비밀번호"></li>
					<li><button type="button" id="btnLogin" class="btn-submit" disabled>로그인</button></li>
					<li>
						<a href="http://localhost:9000/petcarepedia/join/join.jsp">회원가입</a>
						<a href="http://localhost:9000/petcarepedia/login/login_idfind.jsp">아이디 / 비밀번호 찾기</a>
					</li>
				</ul>
			</form>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>