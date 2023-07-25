$(document).ready(function(){


	
	
	/*******************************************
		공지사항 - 등록 폼
	 ********************************************/	
	$("#btnNTW").click(function() {
		let con = 0;
		if($("#title").val() == "") {
			Swal.fire({
				  title: '타이틀을 입력해주세요',
				  text: '',
				  icon: 'warning',
				  confirmButtonColor: '#98DFFF',
				  confirmButtonText:'확인',
				  didClose: () => {
				  	$("#title").focus();
				  }
            }).then(function(){
					return false;
				});
		}
		else if($("#ncontent").val() == "") {
			Swal.fire({
				  title: '내용을 입력해주세요',
				  text: '',
				  icon: 'warning',
				  confirmButtonColor: '#98DFFF',
				  confirmButtonText:'확인',
				  didClose: () => {
				  	$("#ncontent").focus();
				  }
            }).then(function(){
					return false;
				});
		}
		else {
			writeForm.submit();
		}	
	});
	
	
	
	
	/*******************************************
		공지사항 - 수정 폼
	 ********************************************/	
	$("#BTN_update").click(function() {
		if($("#title").val() == "") {
			Swal.fire({
				  title: '타이틀을 입력해주세요',
				  text: '',
				  icon: 'warning',
				  confirmButtonColor: '#98DFFF',
				  confirmButtonText:'확인',
				  didClose: () => {
				  	$("#title").focus();
				  }				  
            }).then(function(){
					return false;
				});
		}
		else if($("#ncontent").val() == "") {
			Swal.fire({
				  title: '내용을 입력해주세요',
				  text: '',
				  icon: 'warning',
				  confirmButtonColor: '#98DFFF',
				  confirmButtonText:'확인',
				  didClose: () => {
				  	$("#ncontent").focus();
				  }				  
            }).then(function(){
					return false;
				});
		}
		else {
			updateForm.submit();
		}
	});
	

	/*******************************************
		리뷰 - 신고
	 ********************************************/	
	$("#btnReviewReport").click(function() {
		Swal.fire({
			  title: '정말로 신고하시겠습니까?',
			  text: '',
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#FFB3BD',
			  cancelButtonColor: '#98DFFF',
			  confirmButtonText:'확인',
			  cancelButtonText: '취소',
        }).then((result) => {
        	if(result.value) {
				$.ajax({
					url : "/review_report_check/"+$("#rid").val()+"/",
					success : function(result) {
						if(result == 1) {
							Swal.fire({
								  title: '신고 접수된 리뷰입니다.',
								  text: '빠른 시일 내에 처리하겠습니다.',
								  icon: 'error',
								  confirmButtonColor: '#98DFFF',
								  confirmButtonText:'확인',
			                })
			            }
						else if(result == 0){
							Swal.fire({
								  title: '신고되었습니다.',
								  text: '관리자 확인 후 처리하겠습니다.',
								  icon: 'success',
								  confirmButtonColor: '#98DFFF',
								  confirmButtonText:'확인',
			                }).then(function(){
									reportForm.submit();
								});
						}
					}
				});
        	}
        });	
	});




	/*******************************************
		리뷰 필터 클릭
	********************************************/
	$('input[name="gloc"]').click(function(){
		if($(this).prop('checked')){
			$('input[name="gloc"]').prop('checked',false);
			$(this).prop('checked',true);
		}
	});

	$('input[name="gloc"]').on('change', function() {
		if ($(this).is(':checked')) {
				ReviewSearchForm.submit();
		}
	});


	/*******************************************
	 공지사항 - 삭제
	 ********************************************/
	$("#noticeDelBtn").click(function() {
		Swal.fire({
			title: '정말로 삭제하시겠습니까?',
			text: '',
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#FFB3BD',
			cancelButtonColor: '#98DFFF',
			confirmButtonText:'확인',
			cancelButtonText: '취소',
		}).then((result) => {
			if(result.isConfirmed) {
				Swal.fire({
					icon: 'success',
					text:'삭제가 완료되었습니다.',
					confirmButtonColor: '#98DFFF',
					confirmButtonText:'확인',
				}).then(() => {
					deleteForm.submit();
				});
			}
		});
	});


	/*******************************************
	 리뷰 - 삭제
	 ********************************************/
	$("#reviewDelBtn").click(function() {
		Swal.fire({
			title: '정말로 삭제하시겠습니까?',
			text: '',
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#FFB3BD',
			cancelButtonColor: '#98DFFF',
			confirmButtonText:'확인',
			cancelButtonText: '취소',
		}).then((result) => {
			if(result.isConfirmed) {
				Swal.fire({
					icon: 'success',
					text:'삭제가 완료되었습니다.',
					confirmButtonColor: '#98DFFF',
					confirmButtonText:'확인',
				}).then(() => {
					deleteForm.submit();
				});
			}
		});
	});

	/**********************************
	 리뷰 필터 처리
	 ***********************************/
	if($('input[name="chkGloc"]').val()!=null) {
		let Gloc = $('input[name="chkGloc"]').val();
		$('input[name="gloc"]').prop('checked',false);
		$('input[value='+Gloc+']').prop('checked',true);
	}

	if($('input[name="chkGloc"]').val()=="서울전체" & $('input[name="chkPage"]').val()=="1") {
		return false;
	}
	else {
		$('html, body').animate({
			scrollTop: $('#filter_lo').offset().top
		}, 'slow');
	}

}); //ready





