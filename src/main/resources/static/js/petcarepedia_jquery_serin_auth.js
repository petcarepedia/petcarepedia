$(document).ready(function(){


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

						// output += '<tr><td colspan="5" >';
						// output += '<select id="authList">';
						// output += '<option id="list" value="list"> 전체 </option>';
						// output += '<option id="auth"  value="auth"> 승인</option>';
						// output += '<option id="unauth"value="unauth"> 미승인</option>';
						// output += '</select></td></tr>';

						output += '<tr><th>번호</th>';
						output += '<th>병원명</th>';
						output += '<th>지역구</th>';
						output += '<th>영업 시간</th>';
						output += '<th>승인 여부</th></tr>';

						for(obj of result.list){
							output += '<tr>';
							output += '<td>' + obj.rno + '</td>';
							output += '<td class="hname"  id="'+obj.hid+'"><a>'+ obj.hname+'</a></td>';
							output += '<td>' + obj.gloc + '</td>';
							output += '<td>' + obj.htime + '</td>';
							output += '<td class ="auth" id="'+obj.hid+'" ><a href = "/admin/hospital_content2/' + page + '/' + obj.hid + '/">';

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

						//content(상세보기) 이벤트
						// $(".hname").click(function (){
						// 	contentAjax($(this).attr("id"),page);
						// });
						//
						// $(".auth").click(function (){
						// 	content2Ajax($(this).attr("id"),page);
						// });

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

						// output += '<tr><td colspan="5" >';
						// output += '<select id="authList">';
						// output += '<option id="list" value="list"> 전체 </option>';
						// output += '<option id="auth"  value="auth"> 승인</option>';
						// output += '<option id="unauth"value="unauth"> 미승인</option>';
						// output += '</select></td></tr>';

						output += '<tr><th>번호</th>';
						output += '<th>병원명</th>';
						output += '<th>지역구</th>';
						output += '<th>영업 시간</th>';
						output += '<th>승인 여부</th></tr>';

						for(obj of result.list){
							output += '<tr>';
							output += '<td>' + obj.rno + '</td>';
							output += '<td class="hname"  id="'+obj.hid+'"><a>'+ obj.hname+'</a></td>';
							output += '<td>' + obj.gloc + '</td>';
							output += '<td>' + obj.htime + '</td>';
							output += '<td class ="auth" id="'+obj.hid+'" ><a href = "/admin/hospital_content2/' + page + '/' + obj.hid + '/">';

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

						//content(상세보기) 이벤트
						// $(".hname").click(function (){
						// 	contentAjax($(this).attr("id"),page);
						// });
						//
						// $(".auth").click(function (){
						// 	content2Ajax($(this).attr("id"),page);
						// });

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

						// output += '<tr><td colspan="5" >';
						// output += '<select id="authList">';
						// output += '<option id="list" value="list"> 전체 </option>';
						// output += '<option id="auth"  value="auth"> 승인</option>';
						// output += '<option id="unauth"value="unauth"> 미승인</option>';
						// output += '</select></td></tr>';

						output += '<tr><th>번호</th>';
						output += '<th>병원명</th>';
						output += '<th>지역구</th>';
						output += '<th>영업 시간</th>';
						output += `<th>승인 여부</th></tr>`;

						for(obj of result.list){
							output += '<tr>';
							output += '<td>' + obj.rno + '</td>';
							output += '<td class="hname"  id="'+obj.hid+'"><a>'+ obj.hname+'</a></td>';
							output += '<td>' + obj.gloc + '</td>';
							output += '<td>' + obj.htime + '</td>';
							output += '<td class ="auth" id="'+obj.hid+'" ><a href = "/admin/hospital_content2/' + page + '/' + obj.hid + '/">';

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

						//content(상세보기) 이벤트
						// $(".hname").click(function (){
						// 	contentAjax($(this).attr("id"),page);
						// });
						//
						// $(".auth").click(function (){
						// 	content2Ajax($(this).attr("id"),page);
						// });

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

	// function contentAjax(hid,page){
	//
	// 	$.ajax({
	// 		url:"/content/"+hid+"/",
	// 		success :function (hospital){
	// 			let output = '<section id="section4">';
	// 			output +='<div id="d3">';
	//
	// 			output +=  '<table class="content_table">';
	// 			output += '<tr><th>병원명</th>';
	// 			output += '<td><input type="text" name="hname" id = "hname" value="'+ hospital.hname +'" disabled> </td></tr>';
	// 			output += '<tr><th>주소</th>';
	// 			output += '<td><input type="text" name="loc" id="loc" value="'+ hospital.loc +'" disabled></td></tr>';
	// 			output += '<tr><th>좌표</th>';
	// 			output += '<td><input type="text" name="x" id="x" value="'+ hospital.x +'" placeholder="위도" disabled>';
	// 			output += '<input type="text" name="y" id="y" value="'+ hospital.y +'" placeholder="경도" disabled></td></tr>';
	// 			output += '<tr><th>지역구</th>';
	// 			output += '<td><input type="text" name="gloc" id="gloc" value="'+ hospital.gloc +'" disabled></td></tr>';
	// 			output += '<tr><th>전화번호</th>';
	// 			output += '<td><input type="text" name="tel" id="tel" value="'+ hospital.tel +'" disabled></td></tr>';
	// 			output += '<tr><th>영업시간</th>';
	// 			output += '<td><input type="text" name="htime" id="htime" placeholder="영업시간 : 00:00 ~ 00:00" value="'+ hospital.htime +'" disabled></td></tr>';
	// 			output += '<tr><th>특수동물 진료 여부</th>';
	// 			output += '<td><input type="text" name="animal" id="animal" placeholder="O / X " value="'+ hospital.animal +'" disabled> </td></tr>';
	// 			output += '<tr><th>야간 근무 여부</th>';
	// 			output += '<td><input type="text" name="ntime" id="ntime" placeholder="O / X " value="'+ hospital.ntime +'" disabled> </td></tr>';
	// 			output += '<tr><th>공휴일 진료 여부</th>';
	// 			output += '<td><input type="text" name="holiday" id="holiday" placeholder="O / X " value="'+ hospital.holiday +'" disabled> </td></tr>';
	// 			output += '<tr><th>홈페이지 링크</th>';
	// 			output += '<td><input type="text" name="hrink" id="hrink" placeholder="O / X " value="'+ hospital.hrink +'" disabled> </td></tr>';
	// 			output += '<tr><th>강조사항(선택)</th>';
	// 			output += '<td><textarea name="intro" id="intro" value="'+ hospital.intro +'" disabled></textarea></td></tr>';
	//
	// 			output += '<tr><th>파일 업로드</th>';
	// 			output += '<td colspan ="2">';
	// 			output += '<input type="hidden" name="hfile1" value="'+ hospital.hfile1 +'">';
	// 			output += '<input type="hidden" name="hfile2" value="'+ hospital.hfile2 +'">';
	// 			output += '<input type="file" name="files" id ="files" disabled>';
	//
	// 			output += '<c:when test="'+hospital.hfile1+' != null">';
	// 			output += '<span id="update_file1">' + hospital.hfile1 + '</span>';
	// 			output += '</c:when>';
	// 			output += '<c:otherwise>';
	// 			output += '<span id="update_file1">선택된 파일 없음</span>';
	// 			output += '</c:otherwise>';
	// 			output += '</c:choose>';
	//
	// 			output += '<input type="file" name="files" id ="files2" disabled>';
	// 			output += '<c:choose>';
	// 			output += '<c:when test="'+ hospital.hfile2 +' != null">';
	// 			output += '<span id="update_file2">' + hospital.hfile2 + '</span>';
	// 			output += '</c:when>';
	// 			output += '<c:otherwise>';
	// 			output += '<span id="update_file2">선택된 파일 없음</span>';
	// 			output += '</c:otherwise>';
	// 			output += '</c:choose>';
	// 			output += '</td></tr>';
	//
	// 			output += '<tr><td colspan="2"> ';
	// 			output += '<a href="/admin/hospital_update/' + page + '/' + hospital.hid + '/">';
	// 			output += '<button type="button" class="button5" id="btn_content">수정하기</button>';
	// 			output += '</a>';
	// 			output += '<a href="/admin/hospital_delete/' + page + '/' + hospital.hid + '/">';
	// 			output += '<button type="button" class="button5" id="btn_delete">삭제하기</button>';
	// 			output += '</a>';
	// 			output += '</td></tr></table>';
	// 			output +='</div>';
	// 			output +='</section>';
	//
	// 			//output을 출력
	// 			$(".hospital").remove();
	// 			$("#section1").after(output);
	//
	// 		}//success
	// 	});
	//
	// }
	//
	// function content2Ajax(hid,page){
	//
	// 	$.ajax({
	// 		url:"/content2/"+hid+"/",
	// 		success :function (hospital){
	// 			let output = '<section id="section4">';
	// 			output +='<div id="d3">';
	//
	// 			output += '<table class="content_table">';
	// 			output += '<tr><th>병원명</th>';
	// 			output += '<td><input type="text" name="hname" id = "hname" value="'+ hospital.hname +'" disabled> </td></tr>';
	// 			output += '<tr><th>주소</th>';
	// 			output += '<td><input type="text" name="loc" id="loc" value="'+ hospital.loc +'" disabled></td></tr>';
	// 			output += '<tr><th>좌표</th>';
	// 			output += '<td><input type="text" name="x" id="x" value="'+ hospital.x +'" placeholder="위도" disabled>';
	// 			output += '<input type="text" name="y" id="y" value="'+ hospital.y +'" placeholder="경도" disabled></td></tr>';
	// 			output += '<tr><th>지역구</th>';
	// 			output += '<td><input type="text" name="gloc" id="gloc" value="'+ hospital.gloc +'" disabled></td></tr>';
	// 			output += '<tr><th>전화번호</th>';
	// 			output += '<td><input type="text" name="tel" id="tel" value="'+ hospital.tel +'" disabled></td></tr>';
	// 			output += '<tr><th>영업시간</th>';
	// 			output += '<td><input type="text" name="htime" id="htime" placeholder="영업시간 : 00:00 ~ 00:00" value="'+ hospital.htime +'" disabled></td></tr>';
	// 			output += '<tr><th>특수동물 진료 여부</th>';
	// 			output += '<td><input type="text" name="animal" id="animal" placeholder="O / X " value="'+ hospital.animal +'" disabled> </td></tr>';
	// 			output += '<tr><th>야간 근무 여부</th>';
	// 			output += '<td><input type="text" name="ntime" id="ntime" placeholder="O / X " value="'+ hospital.ntime +'" disabled> </td></tr>';
	// 			output += '<tr><th>공휴일 진료 여부</th>';
	// 			output += '<td><input type="text" name="holiday" id="holiday" placeholder="O / X " value="'+ hospital.holiday +'" disabled> </td></tr>';
	// 			output += '<tr><th>홈페이지 링크</th>';
	// 			output += '<td><input type="text" name="hrink" id="hrink" placeholder="O / X " value="'+ hospital.hrink +'" disabled> </td></tr>';
	//
	// 			output += '<tr><th>승인 여부</th><td>';
	// 			output += '<input type="text" name="auth" id="auth" value="';
	// 				if ( hospital.auth  == 'auth') {
	// 					output += '승인';
	// 				} else if (hospital.auth  == 'r1' || hospital.auth  == 'r2' ||
	// 					hospital.auth  == 'r3' || hospital.auth  == 'r4' || hospital.auth  == 'r5') {
	// 					output += '승인거부';
	// 				} else {
	// 					output += '미승인';
	// 				}
	// 			output += '" > </td></tr>';
	//
	// 			output += '<tr><th>강조사항(선택)</th>';
	// 			output += '<td><textarea name="intro" id="intro" value="'+ hospital.intro +'" disabled></textarea></td></tr>';
	//
	// 			output += '<tr><th>파일 업로드</th>';
	// 			output += '<td colspan ="2">';
	// 			output += '<input type="hidden" name="hfile1" value="'+ hospital.hfile1 +'">';
	// 			output += '<input type="hidden" name="hfile2" value="'+ hospital.hfile2 +'">';
	// 			output += '<input type="file" name="files" id ="files" disabled>';
	//
	// 			output += '<c:when test="'+hospital.hfile1+' != null">';
	// 			output += '<span id="update_file1">' + hospital.hfile1 + '</span>';
	// 			output += '</c:when>';
	// 			output += '<c:otherwise>';
	// 			output += '<span id="update_file1">선택된 파일 없음</span>';
	// 			output += '</c:otherwise>';
	// 			output += '</c:choose>';
	//
	// 			output += '<input type="file" name="files" id ="files2" disabled>';
	// 			output += '<c:choose>';
	// 			output += '<c:when test="'+hospital.hfile2+' != null">';
	// 			output += '<span id="update_file2">' + hospital.hfile2 + '</span>';
	// 			output += '</c:when>';
	// 			output += '<c:otherwise>';
	// 			output += '<span id="update_file2">선택된 파일 없음</span>';
	// 			output += '</c:otherwise>';
	// 			output += '</c:choose>';
	// 			output += '</td></tr>';
	//
	// 			output += '<tr><td colspan="2"> ';
	// 			output += '<button type="submit" class="button5" id="btn_auth" value="'+hospital.auth+'">승인 완료</button>';
	// 			output += '<button type="button" class="button5" id="btn_noAuth">승인 거부</button>';
	// 			output += '</td></tr></table>';
	// 			output +='</div>';
	// 			output +='</section>';
	//
	// 			//output을 출력
	// 			$(".hospital").remove();
	// 			$("#section1").after(output);
	//
	// 			$("#btn_auth").click(function (){
	// 				auth_update($(this).val());
	// 			});
	//
	//
	// 		}//success
	// 	});
	//
	// }
	//
	// function auth_update(auth){
	//
	// }

});//ready	
