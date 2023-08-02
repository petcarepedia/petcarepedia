$(document).ready(function(){

/***********************************************************
			회원정보페이지 - 버튼 클릭 이미지 변경
************************************************************/
var count1 = 1;
var count2 = 1;
var count3 = 1;
var count4 = 1;
var count5 = 1;
//닉네임
$("#update_nickname").click(function(){
	if(count1 % 2 == 1) {
		$("#img1").attr("src", "http://localhost:9000/images/finish.png");
		$("#nickname").attr("disabled", false);
	} else {
		$("#img1").attr("src", "http://localhost:9000/images/편집2.png");
		$("#nickname").attr("disabled", true);
	}
	count1++;
})
//생년월일
$("#update_birth").click(function(){
	if(count2 % 2 == 1) {
		$("#img2").attr("src", "http://localhost:9000/images/finish.png");
		$("#birth").attr("disabled", false);
	} else {
		$("#img2").attr("src", "http://localhost:9000/images/편집2.png");
		$("#birth").attr("disabled", true);
	}
	count2++;
})

//이메일
/* $("#update_email").click(function(){
	if(count3 % 2 == 1) {
		$("#img3").attr("src", "http://localhost:9000/images/finish.png");
		$("#email").attr("disabled", false);
		$("#btnAuthEmail").css("display", "block");
		$("#btnAuthEmail").attr("disabled",true).css("background", "#D9D9D9").css("cursor", "not-allowed");
		//$("#btnAuthEmail").attr("disabled", true);
	} else {
		$("#img3").attr("src", "http://localhost:9000/images/편집2.png");
		$("#email").attr("disabled", true);
	}
	count3++;
}) */
/***************************************************************************
				이메일 인증 모달
***************************************************************************/
$("#update_email").click(function(){
    $("#emailModal").show();
    $("#pageOverlay").show();
	if($("#btnAuthEmail").css("disabled") == true) {
		$("#btnConfirm").css("background", "#98dfff").css("cursor", "pointer");
	} else if($("#btnAuthEmail").css("disabled") == false){
		$("#btnConfirm").css("background", "#D9D9D9").css("cursor", "not-allowed");
	}
});
	$("#btnConfirm").click(function(){
		$("#email").attr("disabled",false);
	$("#email").val($(".email").val());
	$("#emailModal").hide();
	$("#pageOverlay").hide();
	$("#email").attr("disabled",true);
})
$("#btnModalClose").click(function(){
	$("#emailModal").hide();
	$("#pageOverlay").hide();
});





//휴대폰
$("#update_phone").click(function(){
	if(count4 % 2 == 1) {
		$("#img4").attr("src", "http://localhost:9000/images/finish.png");
		$("#phone").attr("disabled", false);
	} else {
		$("#img4").attr("src", "http://localhost:9000/images/편집2.png");
		$("#phone").attr("disabled", true);
	}
	count4++;
})
//주소
$("#update_addr").click(function(){
	var img5 = $("#img5");
	const address = $("#address");
    if (count5 % 2 === 1) {
        img5.attr("src", "http://localhost:9000/images/finish.png");
        address.prop("disabled", false);
        new daum.Postcode({
        oncomplete: function(data) {
        	$("#address").val("(" + data.zonecode + ") " + data.address);
        	$("#address").focus();
        	//data = {zonecode:"12345", address:"서울시 강남구...,}
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        }
	}).open();	
    } else {
        img5.attr("src", "http://localhost:9000/images/편집2.png");
        address.prop("disabled", true);
    }
	count5++;
});


/*******************************************************************************
		회원정보 수정하기버튼
******************************************************************************/
$("#information #aside form #section3 #btn_style1").click(function(){
	 Swal.fire({
        icon: 'success',
        title: '수정 완료',
        confirmButtonColor:'#98dfff',
        confirmButtonText:'확인'
    }).then(function() {
    	$('input').prop('disabled', false);
		updateForm.submit();
	});
})



/*******************************************************************************
		리뷰쓰기 - 프로필 사진 선택
******************************************************************************/
$("#update_profile").click(function(){
	$("input[name='file1']").click();
})

/******************************************************************************
			회원정보 수정 정규식 체크
*******************************************************************************/
let reg_nick = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/;
let reg_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

//별명 정규식 체크
$("#nickname").keyup(function(){
		if(!reg_nick.test($("#nickname").val())){
			$("#nickcheck_msg").text("특수문자와 초성 및 모음 제외 2~16자로 입력하세요.").css("color","red")
			.css("font-size","12px").css("display","block").css("clear","both").css("margin-left", "75px")
			.css("padding-top","5px")
			.prepend("<img src='http://localhost:9000/images/info_red.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
			$("#update_nickname").attr("disabled",true).css("background","#D9D9D9").css("cursor","not-allowed");
		} else {
			$("#nickcheck_msg").text("").css("display","none");
			$("#update_nickname").attr("disabled",false).css("background","#98dfff").css("cursor","pointer");
		}
});

//이메일 정규식 체크
$("#confirm_email").keyup(function(){
	if(!reg_email.test($("#confirm_email").val())){
		$("#emailcheck_msg").text("올바른 이메일 형식이 아닙니다.").css("color","red")
		.css("font-size","12px").css("display","block").css("clear","both")
		.css("padding-top","5px").css("float", "left")
		.prepend("<img src='http://localhost:9000/images/info_red.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
		$("#update_email").attr("disabled",true).css("background","#D9D9D9").css("cursor","not-allowed");
		$("#btnAuthEmail").attr("disabled",true).css("background", "#D9D9D9").css("cursor", "not-allowed");
	} else {
		$("#emailcheck_msg").text("").css("display","none");
		$("#update_email").attr("disabled",false).css("background","#98dfff").css("cursor","pointer");
		$("#btnAuthEmail").attr("disabled",false).css("background", "#98dfff").css("cursor", "pointer");
		
	}
});

//정보 수정 버튼 활성화
$.updateValidationCheck = function() {
		if($("#nickcheck_msg").text() != "특수문자와 초성 및 모음 제외 2~16자로 입력하세요." 
			&& $("#emailcheck_msg").text() != "올바른 이메일 형식이 아닙니다." ){
			$("#btn_style1").attr("disabled",false).css("background","#7AB2CC").css("cursor","pointer");
		} else {
			$("#btn_style1").attr("disabled",true).css("background","#D9D9D9").css("cursor","not-allowed");
		}
	}
$("form[name='updateForm'] input").on({
		blur: function(){$.updateValidationCheck();},
		focus: function(){$.updateValidationCheck();},
		click: function(){$.updateValidationCheck();},
		keyup: function(){$.updateValidationCheck();}
	});

/**************
	 * 회원가입 - 이메일 체크
	 */
	 $('#btnAuthEmail').click(function() {
		const email = $('#confirm_email').val(); // 이메일 주소값 얻어오기!
		$.ajax({
			type : 'get',
			url : "/mail_check/"+email + "/",
			success : function (data) {
				$('#cemail').show();
				$('#btnCheckEmail').show();
				$("#data").val(data);
				$('#btnAuthEmail').text("인증번호 재전송").css("background","#FFB3BD");
				
				Swal.fire({
		            icon: 'success',                         
		            title: '인증번호가 전송되었습니다.',         
		            confirmButtonColor:'#98dfff',
		            confirmButtonText:'확인'
		        });
			}			
		}); // end ajax
	}); // end send eamil	

// 인증번호 비교 
	// blur -> focus가 벗어나는 경우 발생
	$('#btnCheckEmail').click(function () {
		const inputCode = $("#cemail").val();
		const resultMsg = $('#emailauthcheck_msg');
		const code = $("#data").val();
		
		if(inputCode == code){
			Swal.fire({
	            icon: 'success',                         
	            title: '인증번호가 일치합니다.',         
	            confirmButtonColor:'#98dfff',
	            confirmButtonText:'확인'
	        }).then((result) => {
				$('#cemail').hide();
				$('#btnCheckEmail').hide();
				$("#emailauthcheck_msg").text("이메일 인증 완료").css("color","#7AB2CC").css("margin-left", "10px")
				.css("font-size","12px").css("display","block").css("clear","both")
				.css("padding-top","5px")
				.prepend("<img src='http://localhost:9000/images/check.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
				$("#btnAuthEmail").attr("disabled",true).css("background","#D9D9D9").css("cursor","not-allowed");
				$("#btnModalClose").attr("disabled", true).css("background","#D9D9D9").css("cursor","not-allowed");
				$("#btnConfirm").attr("disabled",false).css("background", "#98dfff").css("cursor", "pointer");
				$("#email").attr('readonly',true);
			});
		}else{
			Swal.fire({
	            icon: 'error',                         
	            title: '인증번호가 일치하지 않습니다.',         
	            confirmButtonColor:'#98dfff',
	            confirmButtonText:'확인'
	        });
	        
			$("#emailauthcheck_msg").text("").css("display","none");
		}
	});



/*******************************************************************************
		리뷰쓰기 - 글자수 카운팅
******************************************************************************/
	$("#rcontent").on("keyup", function(){
		$('#test_cnt').html("("+$(this).val().length+" / 200)");
		if($(this).val().length > 200) {
			alert("200글자 이하로 작성해주세요");
            $(this).val($(this).val().substring(0, 200));
            $('#test_cnt').html("(200 / 200)");
        }
	})

	

/*******************************************************************************
		수정하기  - 주소찾기 : daum API
******************************************************************************/
	



	

	


/*******************************************
		mypage - reservation 예약취소버튼
********************************************/
$("#btnReservationDelete").click(function(){
	Swal.fire({
	        title: '정말로 취소하시겠습니까?',
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
	            	text:'취소가 완료되었습니다.'
	            }).then(() => {
	                deleteForm.submit();
	            });
	        }
	    });
	
})



/*******************************************************************************
		mypage - 리뷰쓰기 버튼
******************************************************************************/
	$("#btnReviewWrite").click(function(){
		let content = $("#rcontent").val().length;
		if(content < 30) {
			Swal.fire({
			  icon: 'error',                         
			  text: '30글자 이상을 입력해주세요.',  
			  confirmButtonColor:'#98dfff',
			  confirmButtonText:'확인'
			});
			return false;
		} else if($('input:radio[name=rstar]').is(":checked") == false){
			Swal.fire({
			  icon: 'error',                         
			  text: '별점을 선택해주세요.',  
			  confirmButtonColor:'#98dfff',
			  confirmButtonText:'확인'
			});
			return false;
		} else {
			Swal.fire({
	            icon: 'success',
	            title: '작성 완료',
	            confirmButtonColor:'#98dfff',
	  			confirmButtonText:'확인'
	        }).then(function() {
				writeForm.submit();
        	});
		}
	})


/*******************************************************************************
	내가쓴리뷰 - 리뷰수정
******************************************************************************/
	$("#btnReviewUpdate").click(function(){
	let content = $("#rcontent").val().length;
		if(content < 30) {
			Swal.fire({
			  icon: 'error',                         
			  text: '30글자 이상을 입력해주세요.',  
			  confirmButtonColor:'#98dfff',
			  confirmButtonText:'확인'
			});
			return false;
		} else if($('input:radio[name=rstar]').is(":checked") == false){
			Swal.fire({
			  icon: 'error',                         
			  text: '별점을 선택해주세요.',  
			  confirmButtonColor:'#98dfff',
			  confirmButtonText:'확인'
			});
			return false;
		} else {
			Swal.fire({
	            icon: 'success',
	            title: '수정 완료',
	            confirmButtonColor:'#98dfff',
	 			 confirmButtonText:'확인'
	        }).then(function() {
				updateForm.submit();
        	});
		}
	})

/*******************************************************************************
	내가쓴리뷰 - 리뷰삭제
******************************************************************************/
	$("#btnReviewDelete").click(function(){
		Swal.fire({
	        title: '정말로 삭제하시겠습니까?',
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
	                text:'삭제가 완료되었습니다.'
	            }).then(() => {
	                deleteForm.submit();
	            });
	        }
	    });
	
	})


/*******************************************
		mypage - 회원탈퇴
********************************************/
		$("#btnMemberDelete").click(function(){
			if($("#pass").val() == "") {
				Swal.fire({
					  icon: 'error',                         
					  text: '비밀번호를 입력해주세요.',  
					  confirmButtonColor:'#98dfff',
					  confirmButtonText:'확인'
					}).then((result) => {
						$("#pass").focus();
						return false;
					});
			} else {
				Swal.fire({
		        title: '정말로 탈퇴하시겠습니까?',
		        icon: 'warning',
		        showCancelButton: true,
		        confirmButtonColor: '#FFB3BD',
	        	cancelButtonColor: '#98DFFF',
		        confirmButtonText: '승인',
		        cancelButtonText: '취소'
			    }).then((result) => {
			    	 if (result.isConfirmed) {
				    	$.ajax({
				            url: "pass_check/" + $("#mid").val() + "/" + $("#pass").val() + "/",
				            success: function(result) {
				            	if(result == 0) {
				            		Swal.fire({
									icon: 'error',                         
									text: '비밀번호 오류',  
									confirmButtonColor:'#98dfff',
									confirmButtonText:'확인'
									})
				            	} else {
				            		Swal.fire({
									icon: 'success',                         
									text: '탈퇴가 완료되었습니다.',  
									confirmButtonColor:'#98dfff',
									confirmButtonText:'확인'
									}).then(() => {
					                	deleteForm.submit();
					           		});
				            	}
				            } //success
				        }); //ajax
			        }
			    })
	        } // else
	        
		})
	/************************************************
	 				병원 정보 영업시간 배열추가
	 ***********************************************/

	var htime1List = new Array();
	var htime2List = new Array();
	for(var i = 0; i < 24 ; i++) {
		if(i < 10) {
			htime1List[i] = "0" + i + ":00";
			htime2List[i] = "0" + i + ":30";
		} else {
			htime1List[i] = i + ":00";
			htime2List[i] = i + ":30";
		}
	}
	for(var i = 0; i < 24; i++) {
		var option1 = "<option value = '" + htime1List[i] + "'>" + htime1List[i] + "</option>";
		var option2 = "<option value = '" + htime2List[i] + "'>" + htime2List[i] + "</option>";
		$("#htime1").append(option1);
		$("#htime1").append(option2);
	}
	for(var i = 0; i < 24; i++) {
		var option1 = "<option value = '" + htime1List[i] + "'>" + htime1List[i] + "</option>";
		var option2 = "<option value = '" + htime2List[i] + "'>" + htime2List[i] + "</option>";
		$("#htime2").append(option1);
		$("#htime2").append(option2);
	}
	/*******************************************
	 		병원 정보 주소찾기
	 *****************************************/
	$("#btnSearchLoc").click(function(){
		new daum.Postcode({
			oncomplete: function(data) {
				$("#loc").val("(" + data.zonecode + ") " + data.address);
				$("#loc").focus();
				searchAddressToCoordinate(data.address);
				//data = {zonecode:"12345", address:"서울시 강남구...,}
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
				// 예제를 참고하여 다양한 활용법을 확인해 보세요.
			}
		}).open();
	})


	/*************************************
	 			 좌표 변환
	 ************************************/
	function searchAddressToCoordinate(address) {
		naver.maps.Service.geocode({
			query: address
		}, function(status, response) {
			if (status === naver.maps.Service.Status.ERROR) {
				return alert('Something Wrong!');
			}
			if (response.v2.meta.totalCount === 0) {
				return alert('올바른 주소를 입력해주세요.');
			}
			var htmlAddresses = [],
				item = response.v2.addresses[0];

			if (item.roadAddress) {
				htmlAddresses.push('[도로명 주소] ' + item.roadAddress);
			}
			insertAddress(item.roadAddress, item.x, item.y);
		})

	} // searchAddressToCoordinate


	//input입력
	function insertAddress(address, latitude, longitude) {
		$('#x').val(longitude);
		$('#y').val(latitude);
	}

	/******************************************
	  				병원 등록 처리
	 ****************************************/
	$("#btnHospitalWrite").click(function(){
		if($("#hname").val() == "") {
			Swal.fire({
				icon: 'error',
				title: '병원명을 입력해주세요',
				confirmButtonColor:'#98dfff',
				confirmButtonText:'확인'
			})
			return false;
		} else if($("#loc").val() == "") {
			Swal.fire({
				icon: 'error',
				title: '주소를 입력해주세요',
				confirmButtonColor: '#98dfff',
				confirmButtonText: '확인'
			})
			return false;
		}
		else if($("#gloc").val() == "") {
			Swal.fire({
				icon: 'error',
				title: '지역구를 입력해주세요',
				confirmButtonColor: '#98dfff',
				confirmButtonText: '확인'
			})
			return false;
		}
		else if($("#hname").val() == "") {
			Swal.fire({
				icon: 'error',
				title: '병원명을 입력해주세요',
				confirmButtonColor: '#98dfff',
				confirmButtonText: '확인'
			})
			return false;
		}
		else if($("#tel").val() == "") {
			Swal.fire({
				icon: 'error',
				title: '병원 전화번호를 입력해주세요',
				confirmButtonColor: '#98dfff',
				confirmButtonText: '확인'
			})
			return false;
		}
		else if($("#ntime").val() == "") {
			Swal.fire({
				icon: 'error',
				title: '야간진료 여부를 선택해주세요',
				confirmButtonColor: '#98dfff',
				confirmButtonText: '확인'
			})
			return false;
		}
		else if($("#holiday").val() == "") {
			Swal.fire({
				icon: 'error',
				title: '휴일진료 여부를 선택해주세요',
				confirmButtonColor: '#98dfff',
				confirmButtonText: '확인'
			})
			return false;
		}
		else if($("#animal").val() == "") {
			Swal.fire({
				icon: 'error',
				title: '특수동물 취급 여부를 선택해주세요',
				confirmButtonColor: '#98dfff',
				confirmButtonText: '확인'
			})
			return false;
		} else {
			writeForm.submit();
		}
	})


	/****************************************
	 * 파일 처리
	 *******************************************/
	$("#file1").on('change',function(){
		var fileName = $("#file1").val();
		$(".upload-name_file1").val(fileName);
	});

	$("#file2").on('change', function (){
		var fileName = $("#file2").val();
		$(".upload-name_file2").val(fileName);
	})

	/***************************************
	 * 		병원 수정하기 버튼
	 **************************************/
	$("#btnHospitalUpdate").click(function(){
		if($("#hname").val() == "") {
			Swal.fire({
				icon: 'error',
				title: '병원명을 입력해주세요',
				confirmButtonColor:'#98dfff',
				confirmButtonText:'확인'
			})
			return false;
		} else if($("#loc").val() == "") {
			Swal.fire({
				icon: 'error',
				title: '주소를 입력해주세요',
				confirmButtonColor: '#98dfff',
				confirmButtonText: '확인'
			})
			return false;
		}
		else if($("#gloc").val() == "") {
			Swal.fire({
				icon: 'error',
				title: '지역구를 입력해주세요',
				confirmButtonColor: '#98dfff',
				confirmButtonText: '확인'
			})
			return false;
		}
		else if($("#tel").val() == "") {
			Swal.fire({
				icon: 'error',
				title: '병원 전화번호를 입력해주세요',
				confirmButtonColor: '#98dfff',
				confirmButtonText: '확인'
			})
			return false;
		}
		else if($("#ntime").val() == "") {
			Swal.fire({
				icon: 'error',
				title: '야간진료 여부를 선택해주세요',
				confirmButtonColor: '#98dfff',
				confirmButtonText: '확인'
			})
			return false;
		}
		else if($("#holiday").val() == "") {
			Swal.fire({
				icon: 'error',
				title: '휴일진료 여부를 선택해주세요',
				confirmButtonColor: '#98dfff',
				confirmButtonText: '확인'
			})
			return false;
		}
		else if($("#animal").val() == "") {
			Swal.fire({
				icon: 'error',
				title: '특수동물 취급 여부를 선택해주세요',
				confirmButtonColor: '#98dfff',
				confirmButtonText: '확인'
			})
			return false;
		} else {
			updateForm.submit();
		}
	})

	/*************************************
	 * 		manager 정보 수정
	 ************************************/
	$("#btnHosUpdate").click(function(){
		Swal.fire({
			icon: 'success',
			title: '수정 완료',
			confirmButtonColor:'#98dfff',
			confirmButtonText:'확인'
		}).then(function() {
			$('input').prop('disabled', false);
			updateForm.submit();
		});
	})

});