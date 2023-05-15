$(document).ready(function(){
/*******************************************
	예약 버튼
********************************************/
	/*$("#reservation").click(function() {
		var url = 'http://localhost:9000/WebCarePedia/search/search_reservation.jsp';
	    window.open(url, 'popup', 'width=500,height=500,scrollbars=no,menubar=no,toolbar=no,location=no,status=no,resizable=no');
	});*/
	
	$("#reservation").click(function() {
		 $("#hmodal").css("display", "block");
		  });
		  
		  // 모달 닫기
		  $(".close").click(function() {
		    $("#hmodal").css("display", "none");
		  });
	
/*******************************************
	리뷰작성
********************************************/
	$("#review").click(function() {
		 window.location.href = 'http://localhost:9000/WebCarePedia/search/search_main.jsp';
	});
	
	
/*******************************************
	찜하기
********************************************/
	$("#like").click(function() {
		 window.location.href = 'http://localhost:9000/WebCarePedia/search/search_main.jsp';
	});
	
	
/*******************************************
	네비게이션
********************************************/
	 $("#info_s").click(function() {
		    $('html, body').animate({
		      scrollTop: $(".api_info").offset().top
		    }, 500);
		  });
		  $("#review_s").click(function() {
		    $('html, body').animate({
		      scrollTop: $(".review").offset().top
		    }, 500);
		  });






}); //ready