<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://localhost:9000/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
<title>펫캐어피디아 | 나의 회원정보</title>
<link rel="stylesheet" href="http://localhost:9000/css/mypage.css">
<link rel="stylesheet" href="http://localhost:9000/css/petcarepedia_song.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/petcarepedia_jquery_yeol.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
const autoHyphen = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	}
</script>
	<script>
		$(document).ready(function () {
			$(".header-menu").css('background','#FFB3BD');
			$(".footer-menu").css('background','#FFF2F4');
			$("#btnMainSearch-header > img").attr("src",'http://localhost:9000/images/foot_pink.png');
		});
	</script>
<script>
	function readURL(input) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('profile').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	    
	}
</script>
</head>
<body>
<div id="pageOverlay" class="page-overlay"></div>
	<div id="emailModal" class="modal">
	  <div class="modal-content">
	    <h2 class = "title">이메일 인증</h2>
	    <p><span>*</span>이메일 인증 후 확인버튼을 눌러주세요</p>
	    <input type = "text" placeholder = "변경하실 이메일을 입력해주세요!" name = "email" id = "confirm_email" class = "email">
		<button type="button" class="btn-short" id="btnAuthEmail">인증번호 전송</button>
	    <span id="emailcheck_msg"></span>
		
		<input type="hidden" id="data">
		
		<input type="text" name="cemail" id="cemail" placeholder="인증번호 입력" class="input-short" style = "display:none">
		<button type="button" class="btn-short" id="btnCheckEmail" style = "display:none">인증번호 확인</button>
		<span id="emailauthcheck_msg"></span>
		<button type = "button" class = "btnModalClose" id = "btnConfirm" disabled>확인</button>
		<button type = "button" class = "btnModalClose" id = "btnModalClose">닫기</button>
	  </div>
	</div>

	<!-- header -->
	 <jsp:include page="../header.jsp"></jsp:include>
	<div id = "content">
		<section class = "hospital_info" id = "information" >
			<h1 id = "title">나의 회원정보</h1>
			<hr>
			<section  class = "section1" id = "section1">
				<div>
					<nav>
						<ul>
							<li>마이페이지</li>
							<li><a href = "/manager_hospital_list">병원 정보 관리</a></li>
							<li><a href = "/manager_reserve_list">예약 관리</a></li>
							<li><a href = "/mypage_my_review/1/">리뷰 관리</a></li>
							<li><a href = "/manager_information">회원 정보</a></li>
							<li><a href = "/mypage_signout">회원 탈퇴</a></li>
						</ul>
					</nav>
				</div>
			</section>
			<div id = "aside">
					<section id = "section2">
						<div id = "hospital_picture">
							<label>병원 사진</label>
						</div>
						<div id = "profileBoxOut" class = "hospital_box">
							<input type="file" name="file1" id = "file1" onchange = "readURL(this)" accept="image/*" style = "display : none">
							<div id = "hos_profileBox">
								<c:choose>
									<c:when test = "${member.hsfile1  != null}">
										<img src = "http://localhost:9000/upload/${member.hsfile1}/" id = "hos_profile">
									</c:when>
									<c:otherwise>
										<img src = "hos.png">
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div id = "hospital_information">
							<label>선택 정보</label>
						</div>
							<ul>
								<li>
									<label>이름</label>
									<input type = "text" value = "${member.name}" name = "name"  id = "name" disabled>
									<%--									<button type = "button" id = "update_nickname"><img id = "img2" src = "http://localhost:9000/images/편집2.png"></button>--%>
									<%--									<span id="nickcheck_msg"></span>--%>
								</li>
								<li>
									<label>병원명</label>
									<input type = "text" value = "${member.hname}" name = "hname"  id = "hname" disabled>
<%--									<button type = "button" id = "update_nickname"><img id = "img2" src = "http://localhost:9000/images/편집2.png"></button>--%>
<%--									<span id="nickcheck_msg"></span>--%>
								</li>
								<li>
									<label>병원주소</label>
									<input type = "text" value = "${member.loc}" name = "loc" id = "loc" disabled>
<%--									<button type = "button" id = "update_addr"><img id = "img5" src = "http://localhost:9000/images/편집2.png"></button>--%>
								</li>
								<form name="updateForm" id = "updateForm" action="/manager_info_update" method="post" enctype = "multipart/form-data">
									<input type = "hidden" name = "mid" value = "${sessionScope.svo.mid}">
									<li>
										<label>휴대폰</label>
										<input type="text" value = "${member.phone}" name = "phone" id = "phone" oninput="autoHyphen(this)" maxlength="13" placeholder="전화번호를 입력해보세요!" disabled>
										<button type = "button" id = "update_phone"><img id = "img4" src = "http://localhost:9000/images/편집2.png"></button>
									</li>
									<li>
										<label>이메일</label>
										<input type = "text" value = "${member.email}" name = "email" id = "email" disabled>
										<button type = "button" id = "update_email"><img id = "img3" src = "http://localhost:9000/images/편집2.png"></button>
									</li>
								</form>
								<li>
									<label>가입일</label>
									<input type = "text" value = "${member.mdate}" name = "mdate" id = "mdate" disabled>
<%--									<button type = "button" id = "update_addr"><img id = "img5" src = "http://localhost:9000/images/편집2.png"></button>--%>
								</li>
							</ul>
					</section>
					<ul id = "pass_revise">
						<li><a href="http://localhost:9000/find_pw" target="_parent" style = "color : #FFB3BD">비밀번호 재설정</a></li>
					</ul>
					<section id = "section3">
						<!-- <a href = "mypage_member_revise.do"> -->
							<button type = "button" id = "btnHosUpdate" style = "background : #FFB3BD">수정완료</button>
						<!-- </a> -->
					</section>
			</div>
		</section>
	</div>
	<div class="back"></div>
	<div class="term-box">
		<div class="term-modal">
			<div class="title">
				이메일 인증
			</div>
		</div>
	</div>
	<%-- <jsp:include page="../footer.jsp"></jsp:include> --%>
</body>
</html>