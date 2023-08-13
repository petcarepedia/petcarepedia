$(document).ready(function(){

	/*************************
	 * 승인 거부 버튼
	 **************************/
	$("#btn_noAuth").click(function(){
		var hid = $(this).data("hid");
		Swal.fire({
			icon: 'warning',
			title: '승인을 거부하시겠습니까?',
			html: '	 <input type="radio" name="reject" value="r1"/> <span>병원명 중복 또는 부적절<span><br> ' +
				'<input type="radio" name="reject" value="r2"/> <span >부적절한 주소 및 지역구 불일치<span> <br> ' +
				'<input type="radio" name="reject" value="r3"/> <span>병원 소개 부적절<span> <br>' +
				'<input type="radio" name="reject" value="r4"/> <span>병원 이미지 부적절<span> <br>' +
				'<input type="radio" name="reject" value="r5"/> <span>기타 사유, 문의 바람<span>',
			showCancelButton: true,
			confirmButtonColor: '#FFB3BD',
			cancelButtonColor: '#98DFFF',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
			if (result.isConfirmed) {
				var auth = $("input[name='reject']:checked").val(); //라디오의 선택된 값을 가져옴
				if(auth == null){
					Swal.fire({
						icon: 'error',
						title: '승인 거부 사유를 선택해주세요',
						showConfirmButton: true,
						confirmButtonColor: '#98DFFF',
						confirmButtonText: '확인'
					});
				}else{
					$.ajax({
						url: "/reject_reson/"+hid+"/"+ auth,
						type: "GET",
						success:function(result){
							if (result == "fail") {
								Swal.fire({
									icon: 'error',
									title: '승인 거부된 상태입니다',
									showConfirmButton: true,
									confirmButtonText: '확인',
									confirmButtonColor: '#98dfff'
								}).then(function() {
									location.reload();
								});
							} else if (result == "success") {
								Swal.fire({
									icon: 'success',
									title: '승인 거부가 완료되었습니다',
									showConfirmButton: true,
									confirmButtonText: '확인',
									confirmButtonColor: '#98dfff'
								}).then(function () {
									location.reload();
								});
							}
						}
					});//ajax
				}//else
			}
		});
	});


	/*************************
	 * 승인 완료 버튼
	 **************************/
	$("#btn_auth").click(function(){
		event.preventDefault(); // 폼 전송을 막음
		Swal.fire({
			icon: 'warning',
			title: '승인을 완료하시겠습니까?',
			showCancelButton: true,
			confirmButtonColor: '#FFB3BD',
			cancelButtonColor: '#98DFFF',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
			if (result.isConfirmed) {
				// 확인 버튼을 눌렀을 경우 삭제 처리
				Swal.fire({
					icon: 'success',
					title:'승인이 완료되었습니다.'
				}).then(() => {
					document.authForm.submit();
				});
				// 폼 전송
				// 삭제 처리를 위한 코드 작성
			}
		});
	});


	/*************************
	 * 다음 api - 주소 찾기
	 **************************/
	$("#search_loc").click(function(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	//alert(data.address);
	        	$("#loc").val(data.address);
	        	$("#loc").focus();
	        	searchAddressToCoordinate(data.address); 
	        }
	    }).open();
		
	}); //search address
	
	/**위도 경도 - 주소찾기 api랑 연계했음 **/
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
	
	
	
	/*************************
	 * 예약 - 상태 변경
	 **************************/
  	var currentDate = new Date();
	var Year = currentDate.getFullYear();
	var Month = currentDate.getMonth() + 1;
	var Day = currentDate.getDate();
	
	var current = new Date(Year, Month - 1, Day); // Date 객체로 변환
	
	$(".date").each(function() {
	  var currentTd = $(this).text();
	  var dateTd = new Date(currentTd); // Date 객체로 변환
	
	  if (dateTd < current) {
	    $(this).next(".state").text("진료완료");
	  } else {
	    $(this).next(".state").text("예약중");
	  }
	});
 	 
	/*************************
	 * 병원 - 파일 수정
	 **************************/
		$("#file1").change(function(){
			//alert("1111");
			if(window. FileReader) { //window객체 사용 ->  window가 가지고 있는 fileReader을 사용 
				let fname = $(this)[0].files[0].name;
				//alert(fname);
				$("#update_file").text(fname);
			}
		});
	 
	/*************************
	 * 병원 - 수정
	 **************************/
	$("#btn_update").click(function(){
			if($("#hname").val()==""){
				alert("병원명을 입력해주세요");
				$("#hname").focus();
				return false;
			}else if($("#gloc").val()==""){
				alert("주소를 입력해주세요");
				$("#gloc").focus();
				return false;
			}else if($("#loc").val()==""){
				alert("주소를 입력해주세요");
				$("#loc").focus();
				return false;
			}else if($("#tel").val()==""){
				alert("전화번호를 입력해주세요");
				$("#tel").focus();
				return false;
			}else if($("#htime").val()==""){
				alert("영업시간을 입력해주세요");
				$("#htime").focus();
				return false;
			}else if($("#animal").val()==""){
				alert("특수동물 진료 여부을 입력해주세요");
				$("#animal").focus();
				return false;
			}else if($("#ntime").val()==""){
				alert("야간 진료 여부을 입력해주세요");
				$("#ntime").focus();
				return false;
			}else if($("#holiday").val()==""){
				alert("공휴일 진료 여부을 입력해주세요");
				$("#holiday").focus();
				return false;
			}else{
			    // 수정 완료 버튼 클릭 시 실행되는 함수
			    Swal.fire({
			        icon: 'success',
			        title: '수정이 완료되었습니다.',
			        confirmButtonColor: '#7ab2cc',
			        confirmButtonText: '확인'
			    }).then((result) => {
			        if (result.isConfirmed) {
			            updateForm.submit(); 
			        }
			    });
			}
		});
	
	
	/*************************
	 * 병원 - 등록 
	 **************************/	
	$("#btn_save").click(function(){
			if($("#hname").val()==""){
				alert("병원명을 입력해주세요");
				$("#hname").focus();
				return false;
			}else if($("#gloc").val()==""){
				alert("주소를 입력해주세요");
				$("#gloc").focus();
				return false;
			}else if($("#loc").val()==""){
				alert("주소를 입력해주세요");
				$("#loc").focus();
				return false;
			}else if($("#tel").val()==""){
				alert("전화번호를 입력해주세요");
				$("#tel").focus();
				return false;
			}else if($("#htime").val()==""){
				alert("영업시간을 입력해주세요");
				$("#htime").focus();
				return false;
			}else if($("#animal").val()==""){
				alert("특수동물 진료 여부을 입력해주세요");
				$("#animal").focus();
				return false;
			}else if($("#ntime").val()==""){
				alert("야간 진료 여부을 입력해주세요");
				$("#ntime").focus();
				return false;
			}else if($("#holiday").val()==""){
				alert("공휴일 진료 여부을 입력해주세요");
				$("#holiday").focus();
				return false;
			}else{
				writeForm.submit();
			}
		});

	/*************************
	 * 병원 관리자 예약 - 회원 아이디 검색창
	 **************************/
	$("#Hreserve_btn").click(function () {
		if($("#Hreserve_bar").val() ==""){
			Swal.fire({
				icon: 'warning',                         // Alert 타입
				/* title: 'Alert가 실행되었습니다.',*/       // Alert 제목
				title: '회원아이디를 입력해주세요',  		// Alert 내용

				confirmButtonColor:'#7ab2cc',
				confirmButtonText:'확인'
			});
			$("#Hreserve_bar").focus();
			return false;
		}else{
			location.href = "http://localhost:9000/manager_reserve_msearch/1/H_0001/"+ $("#Hreserve_bar").val();
		}//else

	});//function

	/*************************
	 * 예약 - 회원 아이디 검색창
	 **************************/
  $("#reserve_btn").click(function(){
  	if($("#reserve_bar").val() ==""){
			Swal.fire({
		        icon: 'warning',                         // Alert 타입
		        /* title: 'Alert가 실행되었습니다.',*/       // Alert 제목
		        title: '회원아이디를 입력해주세요',  		// Alert 내용
		        
		        confirmButtonColor:'#7ab2cc',
		  	  	confirmButtonText:'확인'
			});
			$("#reserve_bar").focus();
			return false;
		}else{	
			location.href = "http://localhost:9000/admin/reserve_msearch/1/"+$("#reserve_bar").val();
		}//else
  	});//function

	/*************************
	 * 회원 - 회원 아이디 검색창
	 **************************/
  $("#member_search_btn").click(function(){
  	if($("#member_search_bar").val() ==""){
			Swal.fire({
		        icon: 'warning',                         // Alert 타입
		        /* title: 'Alert가 실행되었습니다.',*/       // Alert 제목
		        title: '회원아이디를 입력해주세요',  		// Alert 내용
		        
		        confirmButtonColor:'#7ab2cc',
		  	  	confirmButtonText:'확인'
			});
			$("#member_search_bar").focus();
			return false;
		}else{	
			location.href = "http://localhost:9000/admin/member_msearch/1/"+$("#member_search_bar").val();
		}//else
					
  	});//function

	/*************************
	 * 병원 - 검색창 변환
	 **************************/
	 $("#search").change(function(){
		var selectVal = $(this).val();
		
		if(selectVal == "hname"){
			$("#d6").show();
			$("#d7").hide();
		}else{
			$("#d7").show();
			$("#d6").hide();
		}
	});
	 
	 
	/*************************
	 * 병원 - 검색창(지역구)
	 **************************/
  $("#btn_gloc").click(function(){
		if($("#search_gloc").val() ==""){
			Swal.fire({
		        icon: 'warning',                         // Alert 타입
		        /* title: 'Alert가 실행되었습니다.',*/       // Alert 제목
		        title: '지역구를 입력해주세요',  		// Alert 내용
		        
		        confirmButtonColor:'#7ab2cc',
		  	  	confirmButtonText:'확인'
			});
			$("#search_gloc").focus();
			return false;
		}else{	
			location.href = "http://localhost:9000/admin/hospital_gsearch/1/"+$("#search_gloc").val()+"/";

		}//else
  	});//function
  	
	/*************************
	 * 병원 - 검색창(병원)
	 **************************/
  $("#btn_hname").click(function(){
		if($("#search_hname").val() ==""){
			Swal.fire({
		        icon: 'warning',                         // Alert 타입
		        title: '병원명을 입력해주세요',  		// Alert 내용
		        
		        confirmButtonColor:'#7ab2cc',
		  	  	confirmButtonText:'확인'
			});
			$("#search_hname").focus();
			return false;
		}else{	
			location.href = "http://localhost:9000/admin/hospital_hsearch/1/"+$("#search_hname").val()+"/";
		}//else
  	});//function
  	
  	
});//ready	
