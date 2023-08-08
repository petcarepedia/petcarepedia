<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://localhost:9000/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
<title>펫캐어피디아 | 즐겨찾기</title>
<link rel="stylesheet" href="http://localhost:9000/css/mypage.css">
<link rel="stylesheet" href="http://localhost:9000/css/petcarepedia_song.css">
<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
<script src="http://localhost:9000/js/petcarepedia_jquery_yeol.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
function bookmark(bmid) {
	Swal.fire({
        title: '즐겨찾기를 해제하시겠습니까?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#FFB3BD',
    	cancelButtonColor: '#98DFFF',
        confirmButtonText: '승인',
        cancelButtonText: '취소'
	}).then((result) => {
        if (result.isConfirmed) {
        	Swal.fire({
  			  icon: 'success',                         
  			  text: '해제가 완료되었습니다.',  
  			  confirmButtonColor:'#98dfff',
  			  confirmButtonText:'확인'
  			}).then(() => {
                location.href = "/bookmark_delete/" + bmid + "/";
            });
        }
    });
}

</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	
	<div id = "content2" style = "margin-top:140px" >
		<section id = "bookmark">
			<h1 id = "title">즐겨찾기</h1>
			<hr>
			<section id = "section1">
				<div>
					<nav>
						<ul>
							<li>마이페이지</li>
							<li><a href = "/mypage_member_information">회원 정보</a></li>
							<li><a href = "/mypage_reservation">예약 내역</a></li>
							<li><a href = "/mypage_my_review/1/">내가 쓴 리뷰</a></li>
							<li><a href = "/mypage_bookmark">즐겨찾기</a></li>
							<li><a href = "/mypage_signout">회원 탈퇴</a></li>
						</ul>
					</nav>
				</div>
			</section>
			<section id = "section2">
				<c:choose>
					<c:when test = "${list.size() == 0}">
						<div class="review_card_no">
							<img id="review_img"
								src="http://localhost:9000/images/review.png">
							<span>즐겨찾기 내역이 존재하지 않습니다.</span>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach var = "bookmark" items = "${list}">
								<%-- <input type = "hidden" name = "bmid" id = "bmid" value = "${bookmark.bmid}"> --%>
								<div id = "aside1">
									<span>${bookmark.hname}</span>
									<span>${bookmark.gloc}</span>
									<a href = "http://localhost:9000/search_result.do?hid=${bookmark.hid}">병원 상세보기 ></a>
									<button type = "button" id = "btnBookmarkDelete" onclick = "bookmark('${bookmark.bmid}')">
										<img src = "http://localhost:9000/images/bookmark_yellow.png">
									</button>
			<%-- 						<a href = "bookmark_delete.do?bmid=${bookmark.bmid}">
										<img src = "http://localhost:9000/images/bookmark2.png">
									</a> --%>
								</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</section>
		</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>

</html>