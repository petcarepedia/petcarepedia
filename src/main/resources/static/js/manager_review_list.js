$(document).ready(function() {

    /* 신고접수중 버튼 */
    $('.stateBtn').click(function () {
        var hid = $('.stateBtn').data('hid');
        stateAjax(hid, 1);
    });


    /* 신고상태 함수 */
    function stateAjax(hid, page) {
        $.ajax({
            url: "http://localhost:9000/manager_review_list/" + page + "/state",
            data : 'json',
            success: function(result) {

                var code = "";
                code += '<table class="reviewTable">';
                code += '<tr><th>번호</th><th>아이디</th><th>내용</th><th>작성일</th><th>신고여부</th></tr>';

                for (var review of result.list) {
                        code += '<tr><td>' + review.rno + '</td>';
                        code += '<td title="' + review.mid + '">' + review.mid + '</td>';
                        code += '<td><a href="/manager_review_content/' + review.rid + '/">' + review.rcontent + '</a></td>';
                        code += '<td>' + review.rdate + '</td>';
                        code += '<td class="state">신고 접수 중</td></tr>';
                } // for

                code += '<tr><td colspan="5">';
                code += '<div id="ampaginationsm"></div></td></tr></table>';

                $('.reviewTable').remove();
                $('.stateBtn').after(code);
                $('.stateBtn').text("전체   보기");

                $('.stateBtn').click(function () {
                    window.location.href = "http://localhost:9000/manager_review_list/1/";
                });

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
                    stateAjax(hid, e.page);
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
    }


}); // document