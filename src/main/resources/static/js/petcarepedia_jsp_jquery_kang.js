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
			Swal.fire({
				icon: 'success',
				text:'공지사항이 등록되었습니다.',
				confirmButtonColor: '#98DFFF',
				confirmButtonText:'확인',
			}).then(() => {
				writeForm.submit();
			});
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
			Swal.fire({
				icon: 'success',
				text:'공지사항이 수정되었습니다.',
				confirmButtonColor: '#98DFFF',
				confirmButtonText:'확인',
			}).then(() => {
				updateForm.submit();
			});
		}
	});
	

	/*******************************************
		리뷰 - 신고
	 ********************************************/	
	$("#btnReviewReport").click(function() {
		/* 리뷰관리 요청 */
			var rid = $("input[name='rid']").val();
			var hid = $("input[name='hid']").val();
			var mid = $("input[name='mid']").val();
			rstateButton(rid, hid, mid);
	});

	/* 신고하기 기능 함수 */
	function rstateButton(rid, hid, mid) {
		if (mid == "" || mid == null) { // 미로그인시
			Swal.fire({
				icon: 'warning',
				title: '로그인 확인',
				text: '로그인을 먼저 해주세요.',
				showConfirmButton: true, // 확인 버튼 표시
				confirmButtonColor: '#98dfff',
				confirmButtonText: '확인'
			});

		} else { // 로그인시
			Swal.fire({
				icon: 'warning',
				title: '신고 사유를 선택해주세요',
				html: '<input type="radio" class="reson" name="rreson" value="개인정보유출" /> <span class="reson">개인정보유출<span> ' +
					'<input type="radio" class="reson" name="rreson" value="광고/홍보글" /> <span class="reson">광고/홍보글<span> <br> ' +
					'<input type="radio" class="reson" name="rreson" value="욕설/비방" /> <span class="reson">욕설/비방<span> ' +
					'<input type="radio" class="reson" name="rreson" value="음란/선정성" /> <span class="reson">음란/선정성<span> ' +
					'<input type="radio" class="reson" name="rreson" value="기타" /> <span class="reson">기타<span>',
				showCancelButton: true,
				confirmButtonColor: '#FFB3BD',
				cancelButtonColor: '#98DFFF',
				confirmButtonText: '신고',
				cancelButtonText: '취소',
			}).then((result) => {
				if (result.isConfirmed) {
					var rreson = $("input[name='rreson']:checked").val(); // 선택된 라디오 버튼의 값을 가져옴
					if (rreson == null) {
						Swal.fire({
							icon: 'error',
							title: '신고사유를 선택해주세요',
							showConfirmButton: true,
							confirmButtonText: '확인',
							confirmButtonColor: '#98dfff'
						}).then(() => {
							$(".rstate").click(); // 신고 사유 재선택 창 다시 띄우기
						});
					} else {
						$.ajax({
							url: "http://localhost:9000/rstate/",
							type: "GET",
							data: {
								mid: mid,
								rid: rid,
								hid: hid,
								rreson: rreson
							},
							success: function(result) {
								if (result === "fail") {
									Swal.fire({
										icon: 'error',
										title: '이미 신고하셨습니다',
										text: '관리자 확인중 입니다. 잠시만 기다려 주세요.',
										showConfirmButton: true,
										confirmButtonText: '확인',
										confirmButtonColor: '#98dfff'
									}).then(function() {
										location.reload();
									});
								} else if (result === "success") {
									Swal.fire({
										icon: 'success',
										title: '신고되었습니다',
										text: '관리자 확인 중입니다.',
										showConfirmButton: true,
										confirmButtonText: '확인',
										confirmButtonColor: '#98dfff'
									}).then(function() {
										location.reload();
									});
								}
							}
						});
					}
				}
			});
		}
	}
		/*Swal.fire({
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
	});	*/




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





