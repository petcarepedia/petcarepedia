<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="http://localhost:9000/css/admin1.css">
	<link rel="stylesheet" href="http://localhost:9000/css/am-pagination.css">
	<script src="http://localhost:9000/js/jquery-3.6.4.min.js"></script>
	<script src="http://localhost:9000/js/petcarepedia_jquery_serin.js"></script>
	<script src="http://localhost:9000/js/am-pagination.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<link href="http://localhost:9000/images/foot_98DFFF.png" rel="shortcut icon" type="image/x-icon">
	<title>펫캐어피디아 | 관리자</title>
	<script>
		$(document).ready(function(){
			var mid = "${mid}";
			var pager = jQuery('#ampaginationsm').pagination({

				maxSize: '${page.pageCount}',	    		// max page size
				totals: '${page.dbCount}',	// total pages
				page: '${page.reqPage}',		// initial page
				pageSize: '${page.pageSize}',			// max number items per page

				// custom labels
				lastText: '&raquo;&raquo;',
				firstText: '&laquo;&laquo;',
				prevText: '&laquo;',
				nextText: '&raquo;',

				btnSize:'sm'	// 'sm'  or 'lg'
			});

			jQuery('#ampaginationsm').on('am.pagination.change',function(e){
				jQuery('.showlabelsm').text('The selected page no: '+e.page);
				if(mid!=null && mid!=""){
					$(location).attr('href', "http://localhost:9000/admin/member_msearch/"+e.page+"/"+mid);
				} else {
					$(location).attr('href', "http://localhost:9000/admin/member_list/"+e.page+"/");
				}

			});

		});
	</script>
</head>
<body>

<!-- header -->
<jsp:include page="../admin_header.jsp"></jsp:include>
<div class="d1">
	<section class="member">
		<section id = "section1">
			<div>
				<nav>
					<ul>
						<li>회원관리</li>
						<li><a href = "http://localhost:9000/admin/hospital_list/1/">병원 관리</a></li>
						<li><a href = "http://localhost:9000/admin/member_list/1/">회원 관리</a></li>
						<li><a href = "http://localhost:9000/admin/reserve_list/1/">예약 관리</a></li>
						<li><a href = "http://localhost:9000/admin/review_list/1/">신고 리뷰 관리</a></li>
						<li><a href = "http://localhost:9000/admin/notice/1/">공지 사항 관리</a></li>
					</ul>
				</nav>
			</div>
		</section>
		<section id="section2">
			<div class="d2" id = "d2">
				<input type="text"  class="search_bar" id ="member_search_bar"placeholder="회원아이디 입력">
				<button type="submit" class="button1" id="member_search_btn">
					<img src="http://localhost:9000/images/foot_sky.png">
				</button>
			</div>
			<table class="table">
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>성명</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>가입일자</th>
				</tr>
				<c:forEach var="member" items="${list}">
					<tr>
						<td>${member.rno}</td>
						<td><a href="admin_member_detail/${member.mid}">${member.mid}</a></td>
						<td>${member.name}</td>
						<td>${member.email}</td>
						<td>${member.phone}</td>
						<td>${member.mdate}</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="6"><div id="ampaginationsm"></div></td>
				</tr>
			</table>
		</section>
	</section>
</div>
<!-- footer -->
<jsp:include page="../../footer.jsp"></jsp:include>

</body>
</html>