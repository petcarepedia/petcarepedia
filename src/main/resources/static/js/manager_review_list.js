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
                        code += '<td><a href="/manager_review_content/' + page + '/' + review.rid + '/">' + review.rcontent + '</a></td>';
                        code += '<td>' + review.rdate + '</td>';
                        code += '<td class="state">신고 접수 중</td></tr>';
                }

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

                    /*해당 행의 모든 td 요소와 th 요소에 스타일 적용*/
                    row.find('td, th').css({ "background": "#FFF2F4"});
                }).on("mouseout", function() {
                    var el = $(this);
                    var row = el.closest('tr');

                    /*해당 행의 모든 td 요소와 th 요소의 스타일을 원래대로 복원*/
                    row.find('td, th').css({ "background": "", "color": "" });
                });


                /*페이징 처리 함수 호출*/
                pager(result.page.dbCount, result.page.pageCount, result.page.pageSize, result.page.reqPage);

                /*페이지 번호 클릭 이벤트 처리*/
                jQuery('#ampaginationsm').on('am.pagination.change',function(e) {
                    jQuery('.showlabelsm').text('The selected page no: ' + e.page);
                    stateAjax(hid, e.page);
                });
            }
        });
    }

    /* 페이징 처리 함수 */
    function pager(totals, maxSize, pageSize, page) {

        var pager = jQuery('#ampaginationsm').pagination({

            maxSize: maxSize,
            totals: totals,
            page: page,
            pageSize: pageSize,

            lastText: '&raquo;&raquo;',
            firstText: '&laquo;&laquo;',
            prevText: '&laquo;',
            nextText: '&raquo;',

            btnSize:'sm'
        });
    }

    /* 리뷰관리 요청 */
    $("#review_manage").click(function () {
        var rid = $("input[name='rid']").val();
        var hid = $("input[name='hid']").val();
        var mid = $("input[name='mid']").val();
        rstateButton(rid, hid, mid);
    });

    /* 신고하기 기능 함수 */
    function rstateButton(rid, hid, mid) {
        if (mid == "" || mid == null) {
            Swal.fire({
                icon: 'warning',
                title: '로그인 확인',
                text: '로그인을 먼저 해주세요.',
                showConfirmButton: true,
                confirmButtonColor: '#98dfff',
                confirmButtonText: '확인'
            });

        } else {
            Swal.fire({
                icon: 'warning',
                title: '신고 사유를 선택해주세요',
                html: '<input type="radio" class="reson" name="rreson" value="개인정보유출" /> <span class="reson">개인정보유출<span> ' +
                    '<input type="radio" class="reson" name="rreson" value="광고/홍보글" /> <span class="reson">광고/홍보글<span> <br> ' +
                    '<input type="radio" class="reson" name="rreson" value="욕설/비방" /> <span class="reson">욕설/비방<span> ' +
                    '<input type="radio" class="reson" name="rreson" value="음란/선정성" /> <span class="reson">음란/선정성<span> ' +
                    '<input type="radio" class="reson" name="rreson" value="기타" /> <span class="reson">기타<span>',
                showCancelButton: true,
                confirmButtonColor: '#FFB3BD',
                cancelButtonColor: '#98DFFF',
                confirmButtonText: '신고',
                cancelButtonText: '취소',
            }).then((result) => {
                if (result.isConfirmed) {
                    var rreson = $("input[name='rreson']:checked").val();
                    if (rreson == null) {
                        Swal.fire({
                            icon: 'error',
                            title: '신고사유를 선택해주세요',
                            showConfirmButton: true,
                            confirmButtonText: '확인',
                            confirmButtonColor: '#98dfff'
                        }).then(() => {
                            $(".rstate").click();
                        });
                    } else {
                        $.ajax({
                            url: "http://localhost:9000/rstate/",
                            type: "GET",
                            data: {
                                mid: mid,
                                rid: rid,
                                hid: hid,
                                rreson: rreson
                            },
                            success: function(result) {
                                if (result === "fail") {
                                    Swal.fire({
                                        icon: 'error',
                                        title: '이미 신고하셨습니다',
                                        text: '관리자 확인중 입니다. 잠시만 기다려 주세요.',
                                        showConfirmButton: true,
                                        confirmButtonText: '확인',
                                        confirmButtonColor: '#98dfff'
                                    }).then(function() {
                                        location.reload();
                                    });
                                } else if (result === "success") {
                                    Swal.fire({
                                        icon: 'success',
                                        title: '신고되었습니다',
                                        text: '관리자 확인 중입니다.',
                                        showConfirmButton: true,
                                        confirmButtonText: '확인',
                                        confirmButtonColor: '#98dfff'
                                    }).then(function() {
                                        location.reload();
                                    });
                                }
                            }
                        });
                    }
                }
            });
        }
    }
});