$(document).ready(function(){
	$(".manager-menu > ul > li > a").mouseover(function (){$(this).css('color','#FFB3BD');});
	$(".manager-menu > ul > li > a").mouseleave(function (){$(this).css('color','#3d3d3d');});

	$("#aside1 > div > a > span").mouseover(function (){$(this).css('color','#FFB3BD');});
	$("#aside1 > div > a > span").mouseleave(function (){$(this).css('color','#3d3d3d');});

	$("#btnMhWrite").click(function () {
		location.href = "/manager_hospital_write";
	});
	$(".btnMhUpdate").click(function () {
		location.href = "/manager_hospital_update";
	});

	var text = "";
	var mhauth = $("#mhAuth").val();

	if(mhauth=="r1") text="중복 또는 부적절한 병원명을 사용하였습니다.";
	else if(mhauth=="r2") text="병원 위치 정보가 부적절하거나, 지역구가 일치하지 않습니다.";
	else if(mhauth=="r3") text="병원 소개글에 부적절한 내용이 포함되어있습니다.";
	else if(mhauth=="r4") text="부적절한 병원 이미지를 사용하였습니다.";
	else if(mhauth=="r5") text="기타 사유입니다. 문의 바랍니다.";

	$("#btnReject").click(function () {
		Swal.fire({
			icon: 'warning',
			title: '승인 거부 사유',
			text: text,
			confirmButtonColor:'#98dfff',
			confirmButtonText:'확인'
		});
	});
}); //ready





