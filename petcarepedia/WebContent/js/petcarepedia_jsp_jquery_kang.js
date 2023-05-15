$(document).ready(function(){

	/*******************************************
		리뷰 - 더보기
	 ********************************************/	
	$(function(){
	    $("div#review ul li.review_list").slice(0, 4).show(); // 초기갯수
	    $("#load").click(function(e){ // 클릭시 more
	        e.preventDefault();
	        if($("div#review ul li.review_list:hidden").length == 0){ // 컨텐츠 남아있는지 확인
	        	alert("게시물의 끝입니다."); // 컨텐츠 없을시 alert 창 띄우기 
	        	return false;
	        }
	        $("div#review ul li.review_list:hidden").slice(0, 3).show(); // 클릭시 more 갯수 지저정
	    });
	});	
}); //ready





