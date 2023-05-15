$(document).ready(function(){
	jQuery.fn.center = function () {
	    this.css("position","absolute");
	    this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop()) + "px");
	    this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft()) + "px");
	    return this;
	}
	
	
	/**************
	 * 회원가입 - 아이디 중복 체크
	 */
	$("#btnCheckId").click(function(){
		/*$("#idcheck_msg").text("중복된 아이디입니다.").css("color","red")
		.css("font-size","12px").css("display","block").css("clear","both")
		.css("padding-top","5px")
		.prepend("<img src='http://localhost:9000/petcarepedia/images/info_red.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
		
		$("form[name='joinForm'] #id").val("").focus();*/
		
		$("#idcheck_msg").text("사용 가능한 아이디입니다.").css("color","#7AB2CC")
		.css("font-size","12px").css("display","block").css("clear","both")
		.css("padding-top","5px")
		.prepend("<img src='http://localhost:9000/petcarepedia/images/check.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
		
		$("form[name='joinForm'] #pass").focus();
	});
	
	/**************
	 * 회원가입 - 유효성 체크
	 */
	let reg_id = /^(?=.*?[a-z])(?=.*?[0-9]).{4,20}$/;
	let reg_pw = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/;
	
	//아이디 정규식 체크
	$("form[name='joinForm'] #id").keyup(function(){
		if(!reg_id.test($("form[name='joinForm'] #id").val())){
			$("#idcheck_msg").text("4~20자의 영문, 숫자를 포함하여 입력하세요.").css("color","red")
			.css("font-size","12px").css("display","block").css("clear","both")
			.css("padding-top","5px")
			.prepend("<img src='http://localhost:9000/petcarepedia/images/info_red.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
			
			$("#btnCheckId").attr("disabled",true).css("background","#D9D9D9").css("cursor","not-allowed");
		} else {
			$("#idcheck_msg").text("").css("display","none");
			
			$("#btnCheckId").attr("disabled",false).css("background","#98dfff").css("cursor","pointer");
		}
	});
	//비밀번호 정규식 체크
	$("#pass").keyup(function(){
		if(!reg_pw.test($("#pass").val())){
			$("#pwcheck_msg").text("8~16자의 영문, 숫자, 특수문자를 포함하여 입력하세요.").css("color","red")
			.css("font-size","12px").css("display","block").css("clear","both")
			.css("padding-top","5px")
			.prepend("<img src='http://localhost:9000/petcarepedia/images/info_red.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
		} else {
			$("#pwcheck_msg").text("안전한 비밀번호입니다.").css("color","#7AB2CC")
			.css("font-size","12px").css("display","block").css("clear","both")
			.css("padding-top","5px")
			.prepend("<img src='http://localhost:9000/petcarepedia/images/check.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
		}
	});
	//비밀번호 확인 유효성 체크
	$("#cpass").keyup(function(){
		if(!reg_pw.test($("#cpass").val())){
			$("#cpwcheck_msg").text("8~16자의 영문, 숫자, 특수문자를 포함하여 입력하세요.").css("color","red")
			.css("font-size","12px").css("display","block").css("clear","both")
			.css("padding-top","5px")
			.prepend("<img src='http://localhost:9000/petcarepedia/images/info_red.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
		} else {
			if($("#cpass").val() == $("#pass").val()){
				$("#cpwcheck_msg").text("비밀번호가 일치합니다.").css("color","#7AB2CC")
				.css("font-size","12px").css("display","block").css("clear","both")
				.css("padding-top","5px")
				.prepend("<img src='http://localhost:9000/petcarepedia/images/check.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
			} else {
				$("#cpwcheck_msg").text("비밀번호가 일치하지 않습니다.").css("color","red")
				.css("font-size","12px").css("display","block").css("clear","both")
				.css("padding-top","5px")
				.prepend("<img src='http://localhost:9000/petcarepedia/images/info_red.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
			}
		}
	});
	//성명 유효성 체크
	$("form[name='joinForm'] #name").blur(function(){
		if($("form[name='joinForm'] #name").val() == ""){
			$("#namecheck_msg").text("성명을 입력하세요.").css("color","red")
			.css("font-size","12px").css("display","block").css("clear","both")
			.css("padding-top","5px")
			.prepend("<img src='http://localhost:9000/petcarepedia/images/info_red.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
		} else {
			$("#namecheck_msg").text("").css("display","none");
		}
	});
	//휴대폰 유효성 체크
	$("form[name='joinForm'] #phone1,form[name='joinForm'] #phone2,form[name='joinForm'] #phone3").blur(function(){
		if($("form[name='joinForm'] #phone1").val() == "default" || $("form[name='joinForm'] #phone2").val() == "" || $("form[name='joinForm'] #phone3").val() == ""){
			$("#phonecheck_msg").text("휴대폰 번호를 입력하세요.").css("color","red")
			.css("font-size","12px").css("display","block").css("clear","both")
			.css("padding-top","5px")
			.prepend("<img src='http://localhost:9000/petcarepedia/images/info_red.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
		} else {
			$("#phonecheck_msg").text("").css("display","none");
		}
	});
	//약관동의 전체체크
	$("#termAll").click(function(){
		if($("#termAll").is(':checked')){
			$("form[name='joinForm'] input:checkbox").prop('checked',true);
		} else {
			$("form[name='joinForm'] input:checkbox").prop('checked',false);
		}
	});
	//약관동의 유효성 체크
	$(".terms").click(function(){
		if($("#term1").is(':checked') && $("#term2").is(':checked')){
			$("#termcheck_msg").text("").css("display","none");
		} else {
			$("#termcheck_msg").text("필수 약관에 모두 동의해주세요.").css("color","red")
			.css("font-size","12px").css("display","block").css("clear","both")
			.css("padding-top","5px")
			.prepend("<img src='http://localhost:9000/petcarepedia/images/info_red.png' width='13px' style='padding-right:5px; vertical-align:middle'>");
		}
	});
	
	$.joinValidationCheck = function() {
		if($("#idcheck_msg").text() == "사용 가능한 아이디입니다."
			&& $("#pwcheck_msg").text() == "안전한 비밀번호입니다."
			&& $("#cpwcheck_msg").text() == "비밀번호가 일치합니다."
			&& $("form[name='joinForm'] #name").val() != ""
			&& $("form[name='joinForm'] #phone1").val() != "default"
			&& $("form[name='joinForm'] #phone2").val() != ""
			&& $("form[name='joinForm'] #phone3").val() != ""
			&& $("#term1").is(':checked') && $("#term2").is(':checked')){
			$("#btnJoin").attr("disabled",false);
		} else {
			$("#btnJoin").attr("disabled",true);
		}
	}
	//회원가입 버튼 abled
	$("form[name='joinForm'] input").blur(function(){
		$.joinValidationCheck();
	});
	$("form[name='joinForm'] input").focus(function(){
		$.joinValidationCheck();
	});
	$("form[name='joinForm'] input").click(function(){
		$.joinValidationCheck();
	});
	$("form[name='joinForm'] input").keyup(function(){
		$.joinValidationCheck();
	});
	
	
	/**************
	 * 비밀번호 재설정 - 유효성 체크
	 */
	$.pwUpdateValidationCheck = function() {
		if($("#pwcheck_msg").text() == "안전한 비밀번호입니다."
			&& $("#cpwcheck_msg").text() == "비밀번호가 일치합니다."){
			$("#btnPwUpdate").attr("disabled",false);
		} else {
			$("#btnPwUpdate").attr("disabled",true);
		}
	}
	//재설정 버튼 abled
	$("form[name='pwUpdateForm'] input").blur(function(){
		$.pwUpdateValidationCheck();
	});
	$("form[name='pwUpdateForm'] input").keyup(function(){
		$.pwUpdateValidationCheck();
	});
	
	/**************
	 * 아이디찾기 - 유효성 체크
	 */
	$.idFindValidationCheck = function() {
		if($("#name").val() != "" 
			&& $('#phone1').val() != "default"
			&& $('#phone2').val() != ""
			&& $('#phone3').val() != ""){
			$("#btnIdFind").attr("disabled",false);
		} else {
			$("#btnIdFind").attr("disabled",true);
		}
	}
	//찾기 버튼 abled
	$("form[name='idFindForm'] input").blur(function(){
		$.idFindValidationCheck();
	});
	$("form[name='idFindForm'] input").keyup(function(){
		$.idFindValidationCheck();
	});
	$("form[name='idFindForm'] input").click(function(){
		$.idFindValidationCheck();
	});
	$("form[name='idFindForm'] input").focus(function(){
		$.idFindValidationCheck();
	});
	
	/**************
	 * 비밀번호찾기 - 유효성 체크
	 */
	$.pwFindValidationCheck = function() {
		if($("#id").val() != "" 
			&& $('#name').val() != ""
			&& $('#phone1').val() != "default"
			&& $('#phone2').val() != ""
			&& $('#phone3').val() != ""){
			$("#btnPwFind").attr("disabled",false);
		} else {
			$("#btnPwFind").attr("disabled",true);
		}
	}
	//찾기 버튼 abled
	$("form[name='pwFindForm'] input").blur(function(){
		$.pwFindValidationCheck();
	});
	$("form[name='pwFindForm'] input").keyup(function(){
		$.pwFindValidationCheck();
	});
	$("form[name='pwFindForm'] input").click(function(){
		$.pwFindValidationCheck();
	});
	$("form[name='pwFindForm'] input").focus(function(){
		$.pwFindValidationCheck();
	});
	
	/**************
	 * 로그인 - 유효성 체크
	 */
	$.loginValidationCheck = function() {
		if($("#id").val() != "" 
			&& $('#pass').val() != ""){
			$("#btnLogin").attr("disabled",false);
		} else {
			$("#btnLogin").attr("disabled",true);
		}
	}
	//찾기 버튼 abled
	$("form[name='loginForm'] input").blur(function(){
		$.loginValidationCheck();
	});
	$("form[name='loginForm'] input").keyup(function(){
		$.loginValidationCheck();
	});
	$("form[name='loginForm'] input").click(function(){
		$.loginValidationCheck();
	});
	$("form[name='loginForm'] input").focus(function(){
		$.loginValidationCheck();
	});
	
	
	/**************
	 * 회원가입 - 다음 주소 찾기 API
	 */
	$("#btnSearchAddr").click(function(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	$("#addr").val("("+data.zonecode+") "+ data.address);
	        	$("#term1").focus();
	        }
	    }).open();
		
	}); //search address
	
	/**************
	 * 로그인 - 아이디, 비밀번호 찾기
	 */
	$('#btnIdFind').click(function(){
		location.href = "login_idfind_success.jsp";
	})
	$('#btnPwFind').click(function(){
		location.href = "login_pwupdate.jsp";
	})
	$('#btnPwUpdate').click(function(){
		location.href = "login_pwupdate_success.jsp";
	})
	
	$('#btnBackLogin').click(function(){
		location.href = "login.jsp";
	})
	$('#btnBackJoin').click(function(){
		location.href = "http://localhost:9000/petcarepedia/join/join.jsp";
	})
	
	$('#btnMenuIdFind').click(function(){
		location.href = "login_idfind.jsp";
	})
	$('#btnMenuPwFind').click(function(){
		location.href = "login_pwfind.jsp";
	})
	
	
	//관리자 로그인 모달
	/*$("#btnAdminModal").click(function(){
		$(".admin-login-modal").show();
		$(".back").show();
	})
	
	$("#btnModalClose").click(function(){
		$(".admin-login-modal").hide();
		$(".back").hide();
	})*/
}); //ready





