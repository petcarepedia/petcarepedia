$(document).ready(function() {
	
/*******************************************
	시간 넘기기
********************************************/
  $("#scheck").click(function() {
    $.get($("#reservation-form").attr("action"), $("#reservation-form").serialize(), function(data) {
      // 서버에서 반환한 응답 처리
    });
  });
});

$('span').click(function() {
    $(this).toggleClass('bold');
  });