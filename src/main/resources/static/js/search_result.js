$(document).ready(function(){
	var mid = $("input[name='loginId']").val(); // 로그인 확인
	var hid = $("input[name='hid']").val(); // 현재 병원


	/** 북마크 버튼 **/
	$("#bookmark").click(function(event) { // 북마크
		event.preventDefault(); // 페이지 바로넘어감 방지

		 if(mid == "") { // 미로그인시
			 Swal.fire({
				 icon: 'warning',
				 title: '로그인 확인',
				 text: '로그인을 먼저 해주세요.',
				 showConfirmButton: true, // 확인 버튼 표시
				 confirmButtonColor:'#98dfff',
				 confirmButtonText: '확인'
			 });
		 } else { // 로그인시
			$.ajax({
				url: "http://localhost:9000/bookmark",
				type: "GET",
				data: {
					hid: hid,
					mid: mid
				},
				success: function(bookmark_result) {
					if (bookmark_result === "fail") { // 이미 북마크 함	
						Swal.fire({
							icon: 'error',
							title: '즐겨찾기 해제',
							text: '즐겨찾기에서 해제했습니다.',
							showConfirmButton: true, // 확인 버튼 표시
							confirmButtonColor:'#98dfff',
							confirmButtonText: '확인'
						}).then(function() {
							location.reload(); // 확인 버튼 클릭 시 페이지 새로고침
						});
					} else if (bookmark_result === "success") { // 북마크 처리
						Swal.fire({
							icon: 'success',
							title: '즐겨찾기 추가',
							text: '즐겨찾기에 추가했습니다.',
							showConfirmButton: true, // 확인 버튼 표시
							confirmButtonColor:'#98dfff',
							confirmButtonText: '확인'
						}).then(function() {
							location.reload(); // 확인 버튼 클릭 시 페이지 새로고침
						});
					}
				}
			});
		 }
	});
	
	
	/** 예약 버튼 **/
	$("#reservation").click(function() { // 예약 버튼
		if(mid == "") { // 미로그인시
			 Swal.fire({
				 icon: 'warning',
				 title: '로그인 확인',
				 text: '로그인을 먼저 해주세요.',
				 showConfirmButton: true, // 확인 버튼 표시
				 confirmButtonColor:'#98dfff',
				 confirmButtonText: '확인'
			 });
		 } else { // 로그인시
			//var hid = $(this).val();
			//var iframeSrc = "search_reservation.do?hid=" + hid;
			var modal = $("#hmodal");
			//var iframe = $("#reservation-iframe");
			//iframe.attr("src", iframeSrc);
			modal.css("display", "block");
			$(".scrdiv *").css("display", "none");
			$(".cchat-btn *").css("display", "none");
			$(".spword-box *").css("display", "none");
			$(".spword-box").css("border", "none");
			$(".spword-box").css("box-shadow", "none");
		}
	});
	
	
	/* 모달 닫기 */
	$(".close").click(function() {
		$("#hmodal").css("display", "");
		$(".scrdiv *").css("display", "");
		$(".cchat-btn *").css("display", "");
		$(".spword-box *").css("display", "");
		$(".spword-box").css("border", "");
		$(".spword-box").css("box-shadow", "");
	});


	/** 좋아요 버튼 **/
	function likeButton(button) {
		var rid = button.data('rid');

		/* 좋아요 처리 Ajax 호출 */
		if (mid == "" || mid == null) { // 미로그인시
			Swal.fire({
				icon: 'warning',
				title: '로그인 확인',
				text: '로그인을 먼저 해주세요.',
				showConfirmButton: true, // 확인 버튼 표시
				confirmButtonColor: '#98dfff',
				confirmButtonText: '확인'
			});
		} else { // 로그인시
			$.ajax({
				url: 'http://localhost:9000/like',
				method: 'GET',
				data: {
					hid: $('input[name="hid"]').val(),
					rid: rid,
					mid: mid
				},
				success: function (like_result) {
					if (like_result === "success") { // 좋아요 처리
						var count = parseInt(button.find('.like-count').text());
						count++;
						button.find('.like-count').text(count);
					} else { // 좋아요 취소
						var count = parseInt(button.find('.like-count').text());
						count--;
						button.find('.like-count').text(count);
					}
				}
			});
		}
	}

	$('.like').click(function (e) {
		e.preventDefault();
		var button = $(this);
		likeButton(button); // likeButton 함수 호출
	});



	/** 신고하기 버튼 **/
	function rstateButton(rid, hid, mid) {
		if (mid == "" || mid == null) { // 미로그인시
			Swal.fire({
				icon: 'warning',
				title: '로그인 확인',
				text: '로그인을 먼저 해주세요.',
				showConfirmButton: true, // 확인 버튼 표시
				confirmButtonColor: '#98dfff',
				confirmButtonText: '확인'
			});

		} else { // 로그인시
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
					var rreson = $("input[name='rreson']:checked").val(); // 선택된 라디오 버튼의 값을 가져옴
					if (rreson == null) {
						Swal.fire({
							icon: 'error',
							title: '신고사유를 선택해주세요',
							showConfirmButton: true,
							confirmButtonText: '확인',
							confirmButtonColor: '#98dfff'
						}).then(() => {
							$(".rstate").click(); // 신고 사유 재선택 창 다시 띄우기
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

	$(".rstate").click(function() { // 신고하기
		var button = $(this);
		var rid = button.data('rid');
		var hid = $("input[name='hid']").val();
		var mid = $("input[name='mid']").val();
		rstateButton(rid, hid, mid);
	});


	
	/** 네비게이션 **/
	$("#info_s").click(function() {
		var offsetTop = $(".api_info").offset().top - 100;
		$('html, body').animate({
			scrollTop: offsetTop
		}, 500);
	});
	
	$("#review_s").click(function() {
		var offsetTop2 = $(".review").offset().top - 100;
		$('html, body').animate({
			scrollTop: offsetTop2
		}, 500);
	});
	
	
	/** 하트효과 **/
	function heartE() {
		$('.check').click(function () {
			$(this).toggleClass('active');

			if ($(this).hasClass('active')) {
				$(this).find('img').attr({
					'src': 'https://cdn-icons-png.flaticon.com/512/803/803087.png',
					alt: '찜하기 완료'
				});
			} else {
				$(this).find('img').attr({
					'src': 'https://cdn-icons-png.flaticon.com/512/812/812327.png',
					alt: '찜하기'
				});
			}
		});
	}

	$(function() {
		heartE(); // 함수 호출하여 이벤트 핸들러 등록
	});



	/** 공유 링크 클릭시 **/
	$("#share").click(function() {
	    if ($("#shareLink").css('display') === 'none') {
	        $("#shareLink").css('display', 'inline-block');
	    } else {
	        $("#shareLink").css('display', 'none');
	    }
	});
	
	
	
	/** 공유하기 - 카카오 **/
	$("#kakaoShare").click(function() {
		Kakao.Link.sendDefault({
			objectType: 'feed',
	    	content: {
	      		title: '팻케어피디아',
	     		description: $('.name').text(),
	      		imageUrl: 
	      			'https://cdn-icons-png.flaticon.com/512/2358/2358595.png',
	     		link: {
	       			webUrl: 'http://localhost:9000/',
	      		},
    		},
			buttons: [
	      		{
		        title: '사이트 이동',
		        link: {
		          webUrl: 'http://localhost:9000/search_result/' + $("input[name='hid']").val(),
		        },
	      },
	    ],
	  });
	});
	
	
	/** 공유하기 - 링크 복사 **/
	//현재 url 변수로 가져오기
	let nowUrl = window.location.href;
	
	$("#linkCopy").click(function() {
		window.navigator.clipboard.writeText(nowUrl).then(() => {
		  	Swal.fire({
				icon: 'success',
				title: '링크가 복사되었습니다',
				showConfirmButton: true,
				confirmButtonText: '확인',
				confirmButtonColor:'#98dfff'
			});
		});
	});


	/*
	리뷰 정렬
	*/
	$('#filter').on('change', function() {
		var filter = $('#filter').val();
		$.ajax({
			type : 'GET',
			url : 'http://localhost:9000/search_result/' + hid + "/" + filter + "/",
			data : 'json',
		}).done(function(result){
			$('.review_card').remove();

			var reviewSet = new Set(); // 중복 리뷰 방지를 위한 Set 객체
			var cards = []; // 리뷰 카드를 담을 배열

			for (var r of result.card) {
				if (!reviewSet.has(r.rid)) { // 이미 추가된 리뷰인지 검사
					reviewSet.add(r.rid); // Set에 추가
				}

				// 각 리뷰마다 독립적인 카드를 생성
				var reviewCard = '<div class="review_card"><div class="member"><div class="name">';

				if (r.msfile != null) {
					reviewCard += '<img src="http://localhost:9000/upload/' + r.msfile + '">';
				} else {
					reviewCard += '<img src="http://localhost:9000/images/cat.png">';
				}

				reviewCard += '<span>' + r.nickname + '</span></div>';
				reviewCard += '<hr class="member_hr">';
				reviewCard += '<span class="stext">⭐';
				reviewCard += ' ' + r.rstar + ' / 5</span>';

				reviewCard += '<hr class="member_hr">';

				if (r.rstar >= 1 && r.rstar < 2) {
					reviewCard += ' <span class="stot">별점 ⭐</span>';
				} else if (r.rstar >= 2 && r.rstar < 3) {
					reviewCard += ' <span class="stot">별점 ⭐⭐</span>';
				} else if (r.rstar >= 3 && r.rstar < 4) {
					reviewCard += ' <span class="stot">별점 ⭐⭐⭐</span>';
				} else if (r.rstar >= 4 && r.rstar < 5) {
					reviewCard += ' <span class="stot">별점 ⭐⭐⭐⭐</span>';
				} else if (r.rstar >= 5) {
					reviewCard += ' <span class="stot">별점 ⭐⭐⭐⭐⭐</span>';
				}
				reviewCard += '</div>';
				reviewCard += '<div class="write"><p>' + r.rcontent + '</p>';

					reviewCard += '<div class="rm_img">';
					if (r.rsfile1 != null && r.rsfile1 != '') {
						reviewCard += '<a href="http://localhost:9000/upload/' + r.rsfile1 + '" data-title="img" data-lightbox="example-set" class="pop" style="padding-right: 4px;">';
						reviewCard += '<img class="rsfile" src="http://localhost:9000/upload/' + r.rsfile1 + '" alt=""></a>';
					}

					if (r.rsfile2 != null && r.rsfile2 != "") {
						reviewCard += '<a href="http://localhost:9000/upload/' + r.rsfile2 + '" data-title="img" data-lightbox="example-set" class="pop">';
						reviewCard += '<img class="rsfile" src="http://localhost:9000/upload/' + r.rsfile2 + '" alt=""></a>';
					}
					reviewCard += '</div></div>';

					reviewCard += '<div class="date">';
					reviewCard += '<span>작성 일자 : ' + r.rdate + '</span> ';
					reviewCard += '<span> </span>';

					reviewCard += '<form name="likeForm" action="/like" method="get">';
					reviewCard += '<input type="hidden" name="hid" value="' + hid + '">';
					reviewCard += '<input type="hidden" name="rid" value="' + r.rid + '">';
					reviewCard += '<input type="hidden" name="mid" value="' + mid + '">';
					reviewCard += '<input type="hidden" name="likeresult" value="' + r.likeresult + '">';


					if (mid != null && mid != "") { //로그인시
						if (mid == r.mid) { // 로그인=작성자
							if (r.likeresult == 0) {
								reviewCard += '<a href="javascript:;" class="icon heart">';
								reviewCard += '<button type="button" id="like" class="like2 disabled check" data-rid="' + r.rid + '" disabled>';
								reviewCard += '좋아요&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp';
								reviewCard += '<img src="https://cdn-icons-png.flaticon.com/512/812/812327.png" alt="찜하기">';
								reviewCard += '<span class="like-count">' + r.rlike + '</span>';
								reviewCard += '</button></a>';
							} else {
								reviewCard += '<a href="javascript:;" class="icon heart">';
								reviewCard += '<button type="button" id="like" class="like2 active disabled check" data-rid="' + r.rid + '" disabled>';
								reviewCard += '좋아요&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp';
								reviewCard += '<img src="https://cdn-icons-png.flaticon.com/512/803/803087.png" alt="찜하기">';
								reviewCard += '<span class="like-count">' + r.rlike + '</span>';
								reviewCard += '</button></a>';
							}
						} else {// 로그인!=작성자
							if (r.likeresult == 0) {
								reviewCard += '<a href="javascript:;" class="icon heart"><button type="button" id="like" class="like2 check" data-rid="' + r.rid + '">';
								reviewCard += '좋아요&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp';
								reviewCard += '<img src="https://cdn-icons-png.flaticon.com/512/812/812327.png" alt="찜하기">';
								reviewCard += '<span class="like-count">' + r.rlike + '</span>';
								reviewCard += '</button></a>';
							} else {
								reviewCard += '<a href="javascript:;" class="icon heart">';
								reviewCard += '<button type="button" id="like" class="like2 active check" data-rid="' + r.rid + '">';
								reviewCard += '좋아요&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp';
								reviewCard += '<img src="https://cdn-icons-png.flaticon.com/512/803/803087.png" alt="찜하기">';
								reviewCard += '<span class="like-count">' + r.rlike + '</span>';
								reviewCard += '</button></a>';
							}
						}
					} else { //로그인시
						reviewCard += '<a href="javascript:;" class="icon">';
						reviewCard += '<button type="button" id="like" class="like2 non" data-rid="' + r.rid + '">';
						reviewCard += '좋아요&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp';
						reviewCard += '<img src="https://cdn-icons-png.flaticon.com/512/812/812327.png" alt="찜하기"> ';
						reviewCard += '<span class="like-count">' + r.rlike + '</span>';
						reviewCard += '</button></a>';
					}
				reviewCard += '</form>';

				reviewCard += '<form name="rstateForm" action="rstate" method="get">';
				if (mid != r.mid) {
					reviewCard += '<input type="hidden" name="mid" value="' + mid + '">';
					reviewCard += '<input type="hidden" name="rid" value="' + r.rid + '">';
					reviewCard += '<input type="hidden" name="hid" value="' + r.hid + '">';
					reviewCard += '<button type="button" class="rstate" name="rstate" data-rid="' + r.rid + '">신고하기</button>';
				} else {
					reviewCard += '<button type="button" class="rstate" name="rstate" hidden></button>';
				}
				reviewCard += '</form>';
				reviewCard += '</div></div>'; // 이 부분에서 하나의 리뷰 카드가 끝남

					cards.unshift(reviewCard);

			} // for

			for (var card of cards) {
				$('#filter').after(card);
			} //출력


			// like
			$('.like2').click(function (e) {
				e.preventDefault();
				var button = $(this);
				likeButton(button); // likeButton 함수 호출
			});

			$(function() {
				heartE();
			});

			$(".rstate").click(function() { // 신고하기
				var button = $(this);
				var rid = button.data('rid');
				var hid = $("input[name='hid']").val();
				var mid = $("input[name='mid']").val();
				rstateButton(rid, hid, mid);
			});

		}); // ajax

	});


});