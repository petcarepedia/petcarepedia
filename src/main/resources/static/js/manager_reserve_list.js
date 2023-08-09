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
                신고상태 filter
     ***********************************/
    $('#filter').on('change', function() {
        var filter = ($('.filter').val());
        filterAjax(filter, 1);
    });


    /**********************************
                    함수
     ***********************************/
    /* 필터 함수 */
    function filterAjax(filter, page) {
        $.ajax({
            type : 'GET',
            url: "http://localhost:9000/manager_reserve_list/" + page + "/" + filter + "/",
            dataType : 'json',
            success: function(result) {
                $('.reserve_table').remove();

                var code = "";
                code += '<table class="reserve_table">';
                code += '<tr><th>번호</th><th>이름</th><th>아이디</th><th>전화번호</th><th>예약일</th><th>예약시간</th><th>상태</th></tr>';

                for (var booking of result.list) {
                    code += '<tr><td>' + booking.rno + '</td>';
                    code += '<td>' + booking.name + '</td>';
                    code += '<td title=' + booking.mid + '>' + booking.mid + '</td>';
                    code += '<td>' + booking.phone + '</td>';
                    code += '<td>' + booking.vdate + '</td>';
                    code += '<td>' + booking.vtime + '</td>';
                    code += '<td class="state">' + booking.bstate + '</td></tr>';
                } // for

                code += '<tr><td colspan="7">';
                code += '<div id="ampaginationsm"></div></td></tr></table>';
                code += '';
                code += '';
                code += '';
                code += '';
                code += '';
                code += '';
                code += '';
                code += '';
                code += '';
                code += '';

                $('.filter').after(code);
            } // success: function



        }); // ajax
    } // stateAjax


































}); // document