$(document).ready(function(){

	$("#authList").change(function(){
		var selectVal = $("#authList").val();
		selectAjax(selectVal, 1);
	});

	function selectAjax(selectVal, page){
			$.ajax({
				url:"/selectList/"+ page +"/" + selectVal + "/",
				dataType:'json',
				success:function (result){
					let output = '<table class="table">';
					// output += '<tr><td colspan="5">';
					// output += '<a href="http://localhost:9000/admin/hospital_detail">';
					// output += '<button type="button" class="button4">등록하기</button>';
					// output += '</a></td></tr>';

					output += '<tr><th>번호</th>';
					output += '<th>병원명</th>';
					output += '<th>지역구</th>';
					output += '<th>영업 시간</th>';
					output += '<th>승인 여부</th></tr>';

					for(obj of result.list){
						output += '<tr>';
						output += '<td>' + obj.rno + '</td>';
						output += '<td class="hname"  id="'+obj.hid+'"><a href = "/admin/hospital_content/' + page + '/' + obj.hid + '/">'+ obj.hname+'</a></td>';
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
					$("#authList").after(output);


					pager(result.page.dbCount, result.page.pageCount, result.page.pageSize, result.page.reqPage);

					//페이지 번호 클릭 이벤트 처리
					jQuery('#ampaginationsm').on('am.pagination.change',function(e){
						jQuery('.showlabelsm').text('The selected page no: '+e.page);

						selectAjax(selectVal, e.page);
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


});//ready	
