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
		var pager = jQuery('#ampaginationsm').pagination({

			maxSize: '${page.pageCount}',	    		// max page size
			totals: '${page.dbCount}',	// total pages
			page: '${page.reqPage}',		// initial page
			pageSize: '${page.pageSize}',				// max number items per page
		
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		
		    firstText: '&laquo;&laquo;',		
		    prevText: '&laquo;',		
		    nextText: '&raquo;',
				     
		    btnSize:'sm'	// 'sm'  or 'lg'		
		});
		
		jQuery('#ampaginationsm').on('am.pagination.change',function(e){
			   jQuery('.showlabelsm').text('The selected page no: '+e.page);
	           $(location).attr('href', "http://localhost:9000/admin/review_list/"+e.page + "/");
	    });
		
 	});
</script> 
</head>
<body>
<!-- header -->
	<jsp:include page="../admin_header.jsp"></jsp:include>
	
	<div class="d1">
		 <section class="review">
			 <section id = "section1">
					<div>
						<nav>
							<ul>
								<li>신고리뷰관리</li>
								<li><a href = "http://localhost:9000/admin/hospital_list_list/1/">병원 관리</a></li>
								<li><a href = "http://localhost:9000/admin/member_list/1/">회원 관리</a></li>
								<li><a href = "http://localhost:9000/admin/reserve_list/1/">예약 관리</a></li>
								<li><a href = "http://localhost:9000/admin/review_list/1/">신고 리뷰 관리</a></li>
								<li><a href = "http://localhost:9000/admin/notice/1/">공지 사항 관리</a></li>
							</ul>
						</nav>
					</div>
				</section>
				<section id = "section2">
					<table class="table">
							<tr>
								<th>번호</th>
								<th>아이디</th>
								<th>병원명</th>
								<th>내용</th>
								<th>신고사유</th>
							</tr>
						<c:forEach var="review_report" items="${list}">
							<tr>
								<td>${review_report.rno}</td>
								<td>${review_report.mid}</td>
								<td>${review_report.hname}</td>
								<td><a href="/admin/review_detail/1/${review_report.rrid}/">${review_report.rcontent}</a></td>
								<td>${review_report.rreson}</td>
							</tr>
						</c:forEach>
							<tr>
								<td colspan="5"><div id="ampaginationsm"></div></td>
							</tr>
					</table>
				</section>
			</section>
		</div>
	<!-- footer -->
		<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>