$(document).ready(function() {
    // 0: 전체보기 // 1: 새로고침
    var bookingFlag = 1;
    /**********************************
     병원 관리자 예약 - 회원 아이디 검색창
     ***********************************/
    $("#Hreserve_btn").click(hreserve);
    $("#Hreserve_bar").keypress(function(event) {
        if (event.which === 13) {
            event.preventDefault();
            hreserve();
        }
    });


    /**********************************
                신고상태 filter
     ***********************************/
    $('#filter').on('change', function() {
        var filter = ($('.filter').val());
        filterAjax(filter, 1);
    });

    /**********************************
         예약 취소 버튼
     ***********************************/
    $('#cancel').click(function () {
        var bid = $('#cancel').val();

        Swal.fire({
            icon: 'warning',
            title: '예약취소',
            html: '<div style="color: red;">회원님께 연락을 드리셨나요?</div>',
            showCancelButton: true,
            confirmButtonColor: '#FFB3BD',
            cancelButtonColor: '#98DFFF',
            confirmButtonText: '예',
            cancelButtonText: '아니오',
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: "http://localhost:9000/cancel",
                    type: "GET",
                    data: {
                        bid: bid
                    },
                    success: function(result) {
                        if (result === "success") {
                            Swal.fire({
                                icon: 'success',
                                title: '예약취소',
                                text: '예약이 취소되었습니다',
                                showConfirmButton: true,
                                confirmButtonColor:'#FFB3BD',
                                confirmButtonText: '확인'
                            }).then(function() {
                                location.reload();
                            });
                        } else if (result === "fail") {
                            Swal.fire({
                                icon: 'error',
                                title: '오류',
                                text: '오류가 발생하였습니다. 다시 시도해주세요',
                                showConfirmButton: true,
                                confirmButtonColor:'#FFB3BD',
                                confirmButtonText: '확인'
                            });
                        }
                    }
                });
            }
        });
    });

    /**********************************
        bookingChange
     ***********************************/
    $('.bookingChange').click(function () {
        if(bookingFlag == 1) {
            $.ajax({
                url: "http://localhost:9000/booking_update",
                type: "GET",
                success: function (result) {
                    location.reload();
                }
            });
            bookingFlage = 1;
        } else if (bookingFlag == 0) {
            window.location.href = "http://localhost:9000/manager_review_list/1/";
        }
    });


    /**********************************
                    함수
     ***********************************/
    /* 아이디검색 */
    function hreserve() {
        if ($("#Hreserve_bar").val() === "") {
            Swal.fire({
                icon: 'warning',
                title: '회원아이디를 입력해주세요',
                confirmButtonColor: '#FFB3BD',
                confirmButtonText: '확인'
            });
        } else {
            var mid = ($("#Hreserve_bar").val());
            msearchAjax(1, mid);
        }
    }


    function msearchAjax(page, mid) {
        $.ajax({
            type : 'GET',
            url: "http://localhost:9000/manager_reserve_msearch/" + page + "/" + mid,
            dataType : 'json',
            success: function(result) {

                var code = "";

                code += '<table class="reserve_table">';
                code += '<tr><th>번호</th><th>이름</th><th>아이디</th><th>전화번호</th><th>예약일</th><th>예약시간</th><th>상태</th></tr>';

                if(result.list.length != 0) {
                    for (var booking of result.list) {
                        code += '<tr><td>' + booking.rno + '</td>';
                        code += '<td>' + booking.name + '</td>';
                        code += '<td title="' + booking.mid + '"><a href="/manager_reserve_content/' + page + '/' +booking.bid + '/'+ booking.mid + '/1"> ' + booking.mid + '</a></td>';
                        code += '<td>' + booking.phone + '</td>';
                        code += '<td>' + booking.vdate + '</td>';
                        code += '<td>' + booking.vtime + '</td>';
                        code += '<td class="state">' + booking.bstate + '</td></tr>';
                    } // for


                    code += '<tr><td colspan="7">';
                    code += '<div id="ampaginationsm"></div></td></tr></table>';
                } else {
                    code += '<tr><td colspan="7">';
                    code += '<div class="review_no">';
                    code += '<div class="review_no_img">';
                    code += '<img id="review_no_img" src="http://localhost:9000/images/walkingCat.gif"></div>';
                    code += '<p>검색결과가 없습니다.</p>';
                    code += '</div></td></tr>';
                }

                $('.reserve_table').remove();
                $('.bookingChange').text("전체  보기");
                $('.bookingChange').after(code);
                $('.filter').remove();

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

                jQuery('#ampaginationsm').on('am.pagination.change',function(e){
                    jQuery('.showlabelsm').text('The selected page no: '+e.page);
                    if(mid != null && mid != ""){
                        msearchAjax(e.page, mid);
                    }
                });


            } // success: function
        }); // ajax
    } // msearch


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
                    code += '<td title="' + booking.mid + '"><a href="/manager_reserve_content/' + page + '/'  + booking.bid + '/'+ booking.mid + '/1"> ' + booking.mid + '</a></td>';
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

        jQuery('#ampaginationsm').pagination({

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