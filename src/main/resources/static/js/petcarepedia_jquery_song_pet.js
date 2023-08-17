$(document).ready(function (){
	$(".add-box").click(function (){
		$(".pet-write-modal").show();
		$(".back").show();
	});

	$(".pet-box").click(function (){
		$.ajax({
			url : "/pet_content/"+$(this).attr("id"),
			success : function(result){
				var pet = result.content;
				var content = "<div class='title'>반려동물 프로필 수정<i class='fa-solid fa-xmark fa-xl btn-close' id='btnUpdateClose'></i></div>"
				content += "<form name='petUpdateForm' action='/pet_update' method='post' enctype = 'multipart/form-data'>";
				content += "<input type = 'hidden' name = 'mid' value = '${sessionScope.svo.mid}'>";
				content += "<input type = 'hidden' id = 'pfile' name = 'pfile' value = "+pet.pfile+">";
				content += "<input type = 'hidden' id = 'psfile' name = 'psfile' value = "+pet.psfile+">";
				content += "<input type = 'hidden' id = 'pid' name = 'pid' value = "+pet.pid+">";
				content += "<input type='file' name='file1' id = 'file1' onchange = 'readURL2(this)' accept='image/*' style = 'display : none'>";
				content += "<div class='proimg-box'>";

				if(pet.psfile != null && pet.psfile != "" && pet.psfile != "null") {
					content += "<img src='http://localhost:9000/upload/"+pet.psfile+"' class='proimg' id='updateProImg'>";
				} else {
					if(pet.pkind == "강아지") {
						content += "<img src='http://localhost:9000/images/dog_profile.png' class='proimg' id='updateProImg'>";
					} else if(pet.pkind == "고양이") {
						content += "<img src='http://localhost:9000/images/cat_profile.png' class='proimg' id='updateProImg'>";
					} else {
						content += "<img src='http://localhost:9000/images/etc_profile.png' class='proimg' id='updateProImg'>";
					}
				}

				content += "<img src = 'http://localhost:9000/images/수정.png' class='proimg-btn' id='btnUpdateProImg'></div>"
				content += "<ul class='pet-info'><li><label>이름</label>";
				content += "<input type='text' name='pname' id='pname' value="+pet.pname+"></li><li><label>종류</label>";
				content += "<select name='pkind' id='pkind'><option value='강아지'>강아지</option><option value='고양이'>고양이</option><option value='특수동물'>특수동물</option></select>";
				content += "</li><li><label>성별</label><div class='form-gender'>";

				if(pet.pgender == "남"){
					content += "<input type='radio' name='pgender' value='남' checked><span>남</span><input type='radio' name='pgender' value='여'><span>여</span>";
				} else {
					content += "<input type='radio' name='pgender' value='남'><span>남</span><input type='radio' name='pgender' value='여' checked><span>여</span>";
				}

				content += "</div></li><li><label>생일</label>";
				content += "<input type='date' name = 'pbirth' id='pbirth' max='2023-06-20' min='1950-06-05' value="+pet.pbirth+">";
				content += "</li></ul><div><button type='button' id='btnUpdatePet' class='btn-pet'>수정</button>";
				content += "<button type='button' id='btnDeletePet' class='btn-pet btn-pet-delete'>삭제</button></div></form>";

				$(".pet-update-box").append(content);

				$("form[name='petUpdateForm'] #pkind").val(pet.pkind).prop("selected", true);

				$(".pet-update-modal").show();
				$(".back").show();

				$("#btnUpdateClose").click(function (){
					$(".pet-update-modal").hide();
					$(".back").hide();
					$(".pet-update-box").empty();
				});

				$("#btnUpdateProImg").click(function(){
					$("form[name='petUpdateForm'] input[name='file1']").click();
				});

				$("#btnUpdatePet").click(function (){
					if($("form[name='petUpdateForm'] #pname").val() == "") {
						Swal.fire({
							icon: 'warning',
							title: '반려동물 이름을 입력해주세요',
							confirmButtonColor:'#98dfff',
							confirmButtonText:'확인'
						});
					} else if($("form[name='petUpdateForm'] #pbirth").val() == "") {
						Swal.fire({
							icon: 'warning',
							title: '반려동물 생일을 입력해주세요',
							confirmButtonColor:'#98dfff',
							confirmButtonText:'확인'
						});
					} else {
						petUpdateForm.submit();
					}
				});

				$("#btnDeletePet").click(function (){
					Swal.fire({
						title: '정말 삭제하시겠습니까?',
						icon: 'warning',
						showCancelButton: true,
						confirmButtonColor: '#FFB3BD',
						cancelButtonColor: '#98DFFF',
						confirmButtonText: '삭제',
						cancelButtonText: '취소'
					}).then((result) => {
						if (result.isConfirmed) {
							Swal.fire({
								icon: 'success',
								title:'삭제가 완료되었습니다.'
							}).then(() => {
								location.href = "http://localhost:9000/pet_delete/"+pet.pid+"/"+pet.psfile;
							});
						}
					});
				});
			}//success
		});//ajax
	});//click

	$("#btnAddClose").click(function (){
		$("form[name='petWriteForm'] #pname").val("");
		$("form[name='petWriteForm'] #pkind").val("강아지").prop("selected", true);
		$("form[name='petWriteForm'] input:radio[name='pgender']:radio[value='남']").prop('checked',true);
		$("form[name='petWriteForm'] input[name='file1']").val("");
		$("form[name='petWriteForm'] #addProImg").attr("src","http://localhost:9000/images/etc_profile.png");
		$("form[name='petWriteForm'] #pbirth").val("");
		$(".pet-write-modal").hide();
		$(".back").hide();
	});

	$("#btnAddProImg").click(function(){
		$("form[name='petWriteForm'] input[name='file1']").click();
	});

	$("#btnAddPet").click(function (){
		if($("form[name='petWriteForm'] #pname").val() == "") {
			Swal.fire({
				icon: 'warning',
				title: '반려동물 이름을 입력해주세요',
				confirmButtonColor:'#98dfff',
				confirmButtonText:'확인'
			});
		} else if($("form[name='petWriteForm'] #pbirth").val() == "") {
			Swal.fire({
				icon: 'warning',
				title: '반려동물 생일을 입력해주세요',
				confirmButtonColor:'#98dfff',
				confirmButtonText:'확인'
			});
		} else {
			petWriteForm.submit();
		}
	});
});