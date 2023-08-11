$(document).ready(function(){

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
	 * 병원 - 전체 정렬
	 **************************/
	listAjax(1);

	function listAjax(page){
		$("#authList").change(function(){
			var selectVal = $(this).val();

			if (selectVal == "list"){
				$.ajax({
					url:"/list/"+ page +"/",
					dataType:'json',
					success:function (result){
						let output = '<table class="table">';
						output += '<tr><td colspan="5">';
						output += '<a href="http://localhost:9000/admin/hospital_detail">';
						output += '<button type="button" class="button4">등록하기</button>';
						output += '</a></td></tr>';

						output += '<tr><td colspan="5" >';
						output += '<select id="authList">';
						output += '<option id="list" value="list" selected> 전체 </option>';
						output += '<option id="auth"  value="auth"> 승인</option>';
						output += '<option id="unauth"value="unauth"> 미승인</option>';
						output += '</select></td></tr>';

						output += '<tr><th>번호</th>';
						output += '<th>병원명</th>';
						output += '<th>지역구</th>';
						output += '<th>영업 시간</th>';
						output += '<th>승인 여부</th></tr>';

						for(obj of result.list){
							output += '<tr>';
							output += '<td>' + obj.rno + '</td>';
							output += '<td><a href="/admin/hospital_content/"+obj.page +"/"+obj.hid+"/">'+ obj.hname+'</a></td>';
							output += '<td>' + obj.gloc + '</td>';
							output += '<td>' + obj.htime + '</td>';
							output += '<td><a href="/admin/hospital_content2/"+ obj.page+"/"+obj.hid+"/">';

							output += obj.auth == 'auth' ? '승인' :
										obj.auth == 'r1' ? '승인거부' :
										obj.auth == 'r2' ? '승인거부' :
										obj.auth == 'r3' ? '승인거부' :
										obj.auth == 'r4' ? '승인거부' :
										obj.auth == 'r5' ? '승인거부' :
															'미승인';

							output += '</a></td>';
							output += '</tr>';
						}

						output += "<tr>";
						output += "<td colspan='5'><div id='ampaginationsm'></td>";
						output += "</tr>";
						output += '</table>';

						$("table.table").remove();
						$("#d5").after(output);


						pager(result.page.dbCount, result.page.pageCount, result.page.pageSize, result.page.reqPage);

						//페이지 번호 클릭 이벤트 처리
						jQuery('#ampaginationsm').on('am.pagination.change',function(e){
							jQuery('.showlabelsm').text('The selected page no: '+e.page);

							listAjax(e.page);
						});
					}
				});
			}

		});
	}

	/*************************
	 * 병원 - 미승인 정렬
	 **************************/
	unAuthAjax(1);

	function unAuthAjax(page){
		$("#authList").change(function(){
			var selectVal = $(this).val();

			if (selectVal == "unauth"){
				$.ajax({
					url:"/unauth/"+ page +"/",
					dataType:'json',
					success:function (result){
						let output = '<table class="table">';
						output += '<tr><td colspan="5">';
						output += '<a href="http://localhost:9000/admin/hospital_detail">';
						output += '<button type="button" class="button4">등록하기</button>';
						output += '</a></td></tr>';

						output += '<tr><td colspan="5" >';
						output += '<select id="authList">';
						output += '<option id="list" value="list" selected> 전체 </option>';
						output += '<option id="auth"  value="auth"> 승인</option>';
						output += '<option id="unauth"value="unauth"> 미승인</option>';
						output += '</select></td></tr>';

						output += '<tr><th>번호</th>';
						output += '<th>병원명</th>';
						output += '<th>지역구</th>';
						output += '<th>영업 시간</th>';
						output += '<th>승인 여부</th></tr>';

						for(obj of result.list){
							output += '<tr>';
							output += '<td>' + obj.rno + '</td>';
							output += '<td><a href="/admin/hospital_content/1/"+obj.hid+"/">'+ obj.hname+'</a></td>';
							output += '<td>' + obj.gloc + '</td>';
							output += '<td>' + obj.htime + '</td>';
							output += '<td><a href="/admin/hospital_content/1/"+obj.hid+"/">';

							output += obj.auth == 'auth' ? '승인' :
										obj.auth == 'r1' ? '승인거부' :
										obj.auth == 'r2' ? '승인거부' :
										obj.auth == 'r3' ? '승인거부' :
										obj.auth == 'r4' ? '승인거부' :
										obj.auth == 'r5' ? '승인거부' :
															'미승인';

							output += '</a></td>';
							output += '</tr>';
						}

						output += "<tr>";
						output += "<td colspan='5'><div id='ampaginationsm'></td>";
						output += "</tr>";
						output += '</table>';

						$("table.table").remove();
						$("#d5").after(output);


						pager(result.page.dbCount, result.page.pageCount, result.page.pageSize, result.page.reqPage);

						//페이지 번호 클릭 이벤트 처리
						jQuery('#ampaginationsm').on('am.pagination.change',function(e){
							jQuery('.showlabelsm').text('The selected page no: '+e.page);

							unAuthAjax(e.page);
						});
					}
				});
			}

		});
	}

	/*************************
	 * 병원 - 승인 정렬
	 **************************/
	AuthAjax(1);

	function AuthAjax(page){
		$("#authList").change(function(){
			var selectVal = $(this).val();

			if (selectVal == "auth"){
				$.ajax({
					url:"/auth/"+ page +"/",
					dataType:'json',
					success:function (result){
						let output = '<table class="table">';
						output += '<tr><td colspan="5">';
						output += '<a href="http://localhost:9000/admin/hospital_detail">';
						output += '<button type="button" class="button4">등록하기</button>';
						output += '</a></td></tr>';

						output += '<tr><td colspan="5" >';
						output += '<select id="authList">';
						output += '<option id="list" value="list" selected> 전체 </option>';
						output += '<option id="auth"  value="auth"> 승인</option>';
						output += '<option id="unauth"value="unauth"> 미승인</option>';
						output += '</select></td></tr>';

						output += '<tr><th>번호</th>';
						output += '<th>병원명</th>';
						output += '<th>지역구</th>';
						output += '<th>영업 시간</th>';
						output += `<th>승인 여부</th></tr>`;

						for(obj of result.list){
							output += '<tr>';
							output += '<td>' + obj.rno + '</td>';
							output += '<td class="hname"  id="'+obj.hid+'"<a>'+ obj.hname+'</a></td>';
							output += '<td>' + obj.gloc + '</td>';
							output += '<td>' + obj.htime + '</td>';
							output += '<td class ="auth" id="'+obj.hid+'" ><a>';

							output += obj.auth == 'auth' ? '승인' :
								      obj.auth == 'r1' ? '승인거부' :
									  obj.auth == 'r2' ? '승인거부' :
									  obj.auth == 'r3' ? '승인거부' :
									  obj.auth == 'r4' ? '승인거부' :
									  obj.auth == 'r5' ? '승인거부' :
									  						'미승인';

							output += '</a></td>';
							output += '</tr>';
						}

						output += "<tr>";
						output += "<td colspan='5'><div id='ampaginationsm'></td>";
						output += "</tr>";
						output += '</table>';

						$("table.table").remove();
						$("#d5").after(output);

						//output을 출력 이후에 이벤트 처리를 해야한다.
						//content(상세보기) 이벤트
						$(".hname").click(function (){
							contentAjax($(this).attr("id"),page);
						});

						$(".auth").click(function (){
							content2Ajax($(this).attr("id"),page);
						});

						pager(result.page.dbCount, result.page.pageCount, result.page.pageSize, result.page.reqPage);

						//페이지 번호 클릭 이벤트 처리
						jQuery('#ampaginationsm').on('am.pagination.change',function(e){
							jQuery('.showlabelsm').text('The selected page no: '+e.page);

							AuthAjax(e.page);
						});
					}
				});
			}

		});
	}

	function pager(totals, maxSize, pageSize, page){
		//alert(totals+","+maxSize+","+pageSize+","+page);

		var pager = jQuery('#ampaginationsm').pagination({

			maxSize: maxSize,	    		// max page size
			totals: totals,	// total pages
			page: page,		// initial page
			pageSize: pageSize,			// max number items per page

			// custom labels
			lastText: '&raquo;&raquo;',
			firstText: '&laquo;&laquo;',
			prevText: '&laquo;',
			nextText: '&raquo;',

			btnSize:'sm'	// 'sm'  or 'lg'
		});
	}

	function contentAjax(hid,page){

		$.ajax({
			url:"/content/"+hid+"/",
			success :function (hospital){

				let output = '<table class="table">';
				output += '<tr><th>병원명</th>';
				output += '<td><input type="text" name="hname" id = "hname" value="'+ hospital.hname +'" disabled> </td></tr>';
				output += '<tr><th>주소</th>';
				output += '<td><input type="text" name="loc" id="loc" value="'+ hospital.loc +'" disabled></td></tr>';
				output += '<tr><th>좌표</th>';
				output += '<td><input type="text" name="x" id="x" value="'+ hospital.x +'" placeholder="위도" disabled>';
				output += '<input type="text" name="y" id="y" value="'+ hospital.y +'" placeholder="경도" disabled></td></tr>';
				output += '<tr><th>지역구</th>';
				output += '<td><input type="text" name="gloc" id="gloc" value="'+ hospital.gloc +'" disabled></td></tr>';
				output += '<tr><th>전화번호</th>';
				output += '<td><input type="text" name="tel" id="tel" value="'+ hospital.tel +'" disabled></td></tr>';
				output += '<tr><th>영업시간</th>';
				output += '<td><input type="text" name="htime" id="htime" placeholder="영업시간 : 00:00 ~ 00:00" value="'+ hospital.htime +'" disabled></td></tr>';
				output += '<tr><th>특수동물 진료 여부</th>';
				output += '<td><input type="text" name="animal" id="animal" placeholder="O / X " value="'+ hospital.animal +'" disabled> </td></tr>';
				output += '<tr><th>야간 근무 여부</th>';
				output += '<td><input type="text" name="ntime" id="ntime" placeholder="O / X " value="'+ hospital.ntime +'" disabled> </td></tr>';
				output += '<tr><th>공휴일 진료 여부</th>';
				output += '<td><input type="text" name="holiday" id="holiday" placeholder="O / X " value="'+ hospital.holiday +'" disabled> </td></tr>';
				output += '<tr><th>홈페이지 링크</th>';
				output += '<td><input type="text" name="hrink" id="hrink" placeholder="O / X " value="'+ hospital.hrink +'" disabled> </td></tr>';
				output += '<tr><th>강조사항(선택)</th>';
				output += '<td><textarea name="intro" id="intro" value="'+ hospital.intro +'" disabled></textarea></td></tr>';

				output += '<tr><th>파일 업로드</th>';
				output += '<td colspan ="2">';
				output += '<input type="hidden" name="hfile1" value="'+ hospital.hfile1 +'">';
				output += '<input type="hidden" name="hfile2" value="'+ hospital.hfile2 +'">';
				output += '<input type="file" name="files" id ="files" disabled>';

				output += '<c:when test="hospital.hfile1 != null">';
				output += '<span id="update_file1">' + hospital.hfile1 + '</span>';
				output += '</c:when>';
				output += '<c:otherwise>';
				output += '<span id="update_file1"></span>';
				output += '</c:otherwise>';
				output += '</c:choose>';

				output += '<input type="file" name="files" id ="files2" disabled>';
				output += '<c:choose>';
				output += '<c:when test="hospital.hfile2 != null">';
				output += '<span id="update_file2">' + hospital.hfile1 + '</span>';
				output += '</c:when>';
				output += '<c:otherwise>';
				output += '<span id="update_file2"></span>';
				output += '</c:otherwise>';
				output += '</c:choose>';
				output += '</td></tr>';

				output += '<tr><td colspan="2"> ';
				output += '<a href="/admin/hospital_update/' + page + '/' + hospital.hid + '/">';
				output += '<button type="button" class="button5" id="btn_content">수정하기</button>';
				output += '</a>';
				output += '<a href="/admin/hospital_delete/' + page + '/' + hospital.hid + '/">';
				output += '<button type="button" class="button5" id="btn_delete">삭제하기</button>';
				output += '</a>';
				output += '</td></tr></table>';

				//output을 출력
				$(".table").remove();
				$("#div5").remove();
				$("#section1").after(output);

			}//success
		});

	}

	function content2Ajax(hid,page){

		$.ajax({
			url:"/content2/"+hid+"/",
			success :function (hospital){

				let output = '<table class="table">';
				output += '<tr><th>병원명</th>';
				output += '<td><input type="text" name="hname" id = "hname" value="'+ hospital.hname +'" disabled> </td></tr>';
				output += '<tr><th>주소</th>';
				output += '<td><input type="text" name="loc" id="loc" value="'+ hospital.loc +'" disabled></td></tr>';
				output += '<tr><th>좌표</th>';
				output += '<td><input type="text" name="x" id="x" value="'+ hospital.x +'" placeholder="위도" disabled>';
				output += '<input type="text" name="y" id="y" value="'+ hospital.y +'" placeholder="경도" disabled></td></tr>';
				output += '<tr><th>지역구</th>';
				output += '<td><input type="text" name="gloc" id="gloc" value="'+ hospital.gloc +'" disabled></td></tr>';
				output += '<tr><th>전화번호</th>';
				output += '<td><input type="text" name="tel" id="tel" value="'+ hospital.tel +'" disabled></td></tr>';
				output += '<tr><th>영업시간</th>';
				output += '<td><input type="text" name="htime" id="htime" placeholder="영업시간 : 00:00 ~ 00:00" value="'+ hospital.htime +'" disabled></td></tr>';
				output += '<tr><th>특수동물 진료 여부</th>';
				output += '<td><input type="text" name="animal" id="animal" placeholder="O / X " value="'+ hospital.animal +'" disabled> </td></tr>';
				output += '<tr><th>야간 근무 여부</th>';
				output += '<td><input type="text" name="ntime" id="ntime" placeholder="O / X " value="'+ hospital.ntime +'" disabled> </td></tr>';
				output += '<tr><th>공휴일 진료 여부</th>';
				output += '<td><input type="text" name="holiday" id="holiday" placeholder="O / X " value="'+ hospital.holiday +'" disabled> </td></tr>';
				output += '<tr><th>홈페이지 링크</th>';
				output += '<td><input type="text" name="hrink" id="hrink" placeholder="O / X " value="'+ hospital.hrink +'" disabled> </td></tr>';

				output += '<tr><th>승인 여부</th><td><c:choose>';
				output += '<c:when test="${hospital.auth == \'auth\'}">';
				output += '<input type="text" name="auth" id="auth" value="승인"></c:when>';
				output += '<c:when test="${hospital.auth == \'r1\'}">';
				output += '<input type="text" name="auth" id="auth" value="승인거부"></c:when>';
				output += '<c:when test="${hospital.auth == \'r2\'}">';
				output += '<input type="text" name="auth" id="auth" value="승인거부"></c:when>';
				output += '<c:when test="${hospital.auth == \'r3\'}">';
				output += '<input type="text" name="auth" id="auth" value="승인거부"></c:when>';
				output += '<c:when test="${hospital.auth == \'r4\'}">';
				output += '<input type="text" name="auth" id="auth" value="승인거부"></c:when>';
				output += '<c:when test="${hospital.auth == \'r5\'}">';
				output += '<input type="text" name="auth" id="auth" value="승인거부"></c:when>';
				output += '<c:otherwise><input type="text" name="auth" id="auth" value="미승인">';
				output += '</c:otherwise></c:choose></td></tr>';

				output += '<tr><th>강조사항(선택)</th>';
				output += '<td><textarea name="intro" id="intro" value="'+ hospital.intro +'" disabled></textarea></td></tr>';

				output += '<tr><th>파일 업로드</th>';
				output += '<td colspan ="2">';
				output += '<input type="hidden" name="hfile1" value="'+ hospital.hfile1 +'">';
				output += '<input type="hidden" name="hfile2" value="'+ hospital.hfile2 +'">';
				output += '<input type="file" name="files" id ="files" disabled>';

				output += '<c:when test="hospital.hfile1 != null">';
				output += '<span id="update_file1">' + hospital.hfile1 + '</span>';
				output += '</c:when>';
				output += '<c:otherwise>';
				output += '<span id="update_file1"></span>';
				output += '</c:otherwise>';
				output += '</c:choose>';

				output += '<input type="file" name="files" id ="files2" disabled>';
				output += '<c:choose>';
				output += '<c:when test="hospital.hfile2 != null">';
				output += '<span id="update_file2">' + hospital.hfile1 + '</span>';
				output += '</c:when>';
				output += '<c:otherwise>';
				output += '<span id="update_file2"></span>';
				output += '</c:otherwise>';
				output += '</c:choose>';
				output += '</td></tr>';

				output += '<tr><td colspan="2"> ';
				output += '<a href="/admin/hospital_update/' + page + '/' + hospital.hid + '/">';
				output += '<button type="button" class="button5" id="btn_content">수정하기</button>';
				output += '</a>';
				output += '<a href="/admin/hospital_delete/' + page + '/' + hospital.hid + '/">';
				output += '<button type="button" class="button5" id="btn_delete">삭제하기</button>';
				output += '</a>';
				output += '</td></tr></table>';

				//output을 출력
				$(".table").remove();
				$("#div5").remove();
				$("#section1").after(output);

			}//success
		});

	}

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
