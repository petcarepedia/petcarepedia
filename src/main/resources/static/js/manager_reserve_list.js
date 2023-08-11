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

                $('.reserve_table').remove();
                $('.filter').after(code);

                /*호버 효과*/
                var allCells = $("td:nth-child(3)");

                allCells.on("mouseover", function() {
                    var el = $(this);
                    var row = el.closest('tr');

                    // 해당 행의 모든 td 요소와 th 요소에 스타일 적용
                    row.find('td, th').css({ "background": "#FFF2F4"});
                }).on("mouseout", function() {
                    var el = $(this);
                    var row = el.closest('tr');

                    // 해당 행의 모든 td 요소와 th 요소의 스타일을 원래대로 복원
                    row.find('td, th').css({ "background": "", "color": "" });
                });

                // 페이징 처리 함수 호출
                pager(result.page.dbCount, result.page.pageCount, result.page.pageSize, result.page.reqPage);

                // 페이지 번호 클릭 이벤트 처리
                jQuery('#ampaginationsm').on('am.pagination.change',function(e) {
                    jQuery('.showlabelsm').text('The selected page no: ' + e.page);
                    filterAjax(filter, e.page);
                });
            } // success: function
        }); // ajax
    } // stateAjax

    /* 페이징 처리 함수 */
    function pager(totals, maxSize, pageSize, page) {

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
    } // pager


}); // document