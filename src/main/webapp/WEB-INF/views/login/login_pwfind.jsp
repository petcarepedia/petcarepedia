<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://localhost:9000/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
<title>펫캐어피디아 | 아이디,비밀번호 찾기</title>
<link rel="stylesheet" href="http://localhost:9000/css/petcarepedia_song.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/petcarepedia_jquery_song.js"></script>
	<script>
		$(document).ready(function () {
			if("${sessionScope.svo}"!=null){
				if("${sessionScope.svo.grade}"=='manager'){
					$("input:radio[value='user']").prop('checked',false).prop('disabled',true);
					$("input:radio[value='manager']").prop('checked',true);

					$(".header-menu").css('background', '#FFB3BD');
					$(".footer-menu").css('background', '#FFF2F4');
					$("#btnMainSearch-header > img").attr("src", 'http://localhost:9000/images/foot_pink.png');
				} else {
					$("input:radio[value='manager']").prop('disabled',true);
				}
			}
		});
	</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	
	<!-- content -->
	<div class="content">
		<div class="find-content">
			<div class="content-logo">
				<img src="http://localhost:9000/images/contentlogo.png" width="300px">
			</div>
			
			<form name="pwFindForm" action="/find_pw" method="post">
				<div class="find-box">
					<div class="find-pw">
						<c:choose>
							<c:when test="${sessionScope.svo == null}">
								<div id="btnMenuIdFind">아이디 찾기</div>
								<div id="btnMenuPwFind">비밀번호 재설정</div>
							</c:when>
							<c:otherwise>
								<div id="btnMenuPwFind" style="width:100%; border:none; border-bottom:1px solid #98dfff">비밀번호 재설정</div>
							</c:otherwise>
						</c:choose>
						
					</div>
					
					<p>비밀번호를 재설정하려면 계정 정보를 입력해주세요.</p>
					
					<ul>
						<li class="cgrade">
							<label>회원구분</label>
							<input type="radio" name="grade" value="user" style="width:15px;height:15px;" checked>
							<p style="margin:0px 20px 0px 5px;font-size: 14px;display: inline-block;">개인회원</p>
							<input type="radio" name="grade" value="manager" style="width:15px;height:15px;">
							<p style="margin:0px 20px 0px 5px;font-size: 14px;display: inline-block;">사업자회원</span>
						</li>
						<li>
							<label>아이디</label>
							<c:choose>
								<c:when test="${sessionScope.svo == null}">
									<input type="text" name="mid" id="id" placeholder="아이디 입력">
								</c:when>
								<c:otherwise>
									<input type="text" name="mid" id="id" placeholder="아이디 입력" value="${sessionScope.svo.mid}" disabled>
								</c:otherwise>
							</c:choose>
						</li>
						<li>
							<label>성명</label>
							<input type="text" name="name" id="name" placeholder="성명 입력">
						</li>
						<li>
							<label>이메일</label>
							<input type="text" name="email" id="email" placeholder="이메일 입력">
							<span id="emailcheck_msg"></span>
						</li>
						<li><button type="submit" id="btnPwFind" class="btn-submit" disabled>계정 정보 확인</button></li>
					</ul>
				</div>
			</form>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>