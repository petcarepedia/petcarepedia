$(document).ready(function() {
    /**********************************
      병원 관리자 예약 - 회원 아이디 검색창
     ***********************************/
    $("#Hreserve_btn").click(function () {
        if($("#Hreserve_bar").val() ==""){
            Swal.fire({
                icon: 'warning',                         // Alert 타입
                title: '회원아이디를 입력해주세요',  		// Alert 내용

                confirmButtonColor:'#FFB3BD',
                confirmButtonText:'확인'
            });
            $("#Hreserve_bar").focus();
            return false;
        }else{
            location.href = "http://localhost:9000/manager_reserve_msearch/1/"+ $("#Hreserve_bar").val();
        }//else
    });//function


    /**********************************
     병원 관리자 예약 - 회원 아이디 검색창
     ***********************************/


































}); // document