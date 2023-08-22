$(document).ready(function() {

	/* 시간 변수 */
	var currentDate = new Date();
	var currentYear = currentDate.getFullYear();
	var currentMonth = currentDate.getMonth() + 1;
	var currentDay = currentDate.getDate();

	/* 날짜 출력 */
	moment.locale("ko");
	var currentDate = moment();
	var startDate = moment(currentDate);

	var dateElements = $(".sdate");
	var prevButton = $("#prev");
	var nextButton = $("#next");

	var datesPerPage = 5;
	var currentPage = 1;
	var totalDates = 30;

	var currentDateIndex = 0;
	var selectedDate = "";
	var selectedDate2 = "";
	var firstFormattedDate = "";


	/** 초기 날짜 표시 **/
	function generateDates() {
		for (var i = 0; i < dateElements.length; i++) {
			var formattedDate = startDate.format("MM.DD(ddd)");
			if (i === 0) {
				firstFormattedDate = formattedDate;
			}

			var inputElement = dateElements.eq(i).find("input");
			inputElement.val(formattedDate);

			/** 날짜 클릭 이벤트 추가 **/
			inputElement.on("click", function() {
				if ($("#rholiday").val() === 'O') {
					var clickedDate = $(this).val();
					var clickedDate2 = $(this).val();

					var parsedDate = moment(clickedDate2, "MM.DD(ddd)");
					var formattedDate2 = parsedDate.format("YYYY-MM-DD");

					$("#vdate").val(formattedDate2);

					/* 선택된 날짜 스타일 변경 */
					dateElements.find("input").removeClass("selected-date");
					$(this).addClass("selected-date");

					/* 다른 날짜 선택 시 시간 초기화 */
					$("#vtime").val("");
					$(".stime").removeClass("selected");

					/* 선택된 날짜 전역 변수에 저장 */
					selectedDate = clickedDate;

					/* 오늘 날짜 선택 시 */
					if (currentDate2 === selectedDate) {
						for (var j = 0; j < timeSlots3.length; j++) {
							var convertedNowTime = parseInt(nowTime);
							var convertedTimeSlot = parseInt(timeSlots3[j]);

							if (convertedNowTime > convertedTimeSlot) {
								$(".stime").eq(j).css("background", "#D9D9D9");
								$(".stime").eq(j).css("pointer-events", "none");
								$(".stime").eq(j).css("cursor", "not-allowed");
							}
						}
					} else {
						$(".stime").css("background", "");
						$(".stime").css("pointer-events", "");
						$(".stime").css("cursor", "");
					}

				} else {
					var clickedDate = $(this).val();
					var clickedDate2 = $(this).val();

					var parsedDate = moment(clickedDate2, "MM.DD(ddd)");
					var formattedDate2 = parsedDate.format("YYYY-MM-DD");

					$("#vdate").val(formattedDate2);

					/* 선택된 날짜 스타일 변경 */
					dateElements.find("input").removeClass("selected-date");
					$(this).addClass("selected-date");

					/* 다른 날짜 선택 시 시간 초기화 */
					$("#vtime").val("");
					$(".stime").removeClass("selected");

					/* 스타일 초기화 */
					$(".stime").css("background", "");
					$(".stime").css("pointer-events", "");
					$(".stime").css("cursor", "");

					/* 선택된 날짜 전역 변수에 저장 */
					selectedDate = clickedDate;

					/* 오늘 날짜 선택 시 */
					if (currentDate2 === selectedDate) {
						for (var j = 0; j < timeSlots3.length; j++) {
							var convertedNowTime = parseInt(nowTime);
							var convertedTimeSlot = parseInt(timeSlots3[j]);

							if (convertedNowTime > convertedTimeSlot) {
								$(".stime").eq(j).css("background", "#D9D9D9");
								$(".stime").eq(j).css("pointer-events", "none");
								$(".stime").eq(j).css("cursor", "not-allowed");
							}

						}
					} else {
						// 선택한 날짜가 토요일 또는 일요일인 경우 효과 주기
						if (selectedDate.endsWith('(토)') || selectedDate.endsWith('(일)')) {
							$(".stime").css("background", "#D9D9D9");
							$(".stime").css("pointer-events", "none");
							$(".stime").css("cursor", "not-allowed");
						} else {
							$(".stime").css("background", "");
							$(".stime").css("pointer-events", "");
							$(".stime").css("cursor", "");
						}
					}

				}
			});
			startDate.add(1, "days");

		}
	}

	/* 이전 버튼 클릭 이벤트 */
	prevButton.on("click", function() {
		if (currentPage > 1) {
			currentPage--;
			dateElements.find("input").removeClass("selected-date");
			updateDisplayedDates();
		}
	});

	/* 다음 버튼 클릭 이벤트 */
	nextButton.on("click", function() {
		var totalPages = Math.ceil(totalDates / datesPerPage);
		var lastPageIndex = totalPages * datesPerPage - datesPerPage;

		if (currentDateIndex < lastPageIndex) {
			currentPage++;
			dateElements.find("input").removeClass("selected-date");
			updateDisplayedDates();
		}
	});

	/* 현재 표시되는 날짜 업데이트 */
	function updateDisplayedDates() {
		currentDateIndex = (currentPage - 1) * datesPerPage;
		dateElements.find("input").val("");

		var currentDate = moment();

		for (var i = 0; i < datesPerPage; i++) {
			var index = currentDateIndex + i;

			if (index >= 0 && index < totalDates) {
				var formattedDate = moment(currentDate).add(index, "days").format("MM.DD(ddd)");
				var inputElement = dateElements.eq(i).find("input");
				inputElement.val(formattedDate);

				/* 선택된 날짜인 경우 스타일 변경 */
				if (formattedDate === selectedDate) {
					inputElement.addClass("selected-date");
				}
			}
		}
	}

	/* 초기 날짜 표시 */
	generateDates();

	/** 시간 출력 **/
	var today = new Date();
	var hours = ('0' + today.getHours()).slice(-2);
	var minutes = ('0' + today.getMinutes()).slice(-2);

	var months = ('0' + (today.getMonth() + 1)).slice(-2);
	var days = ('0' + today.getDate()).slice(-2);

	var nowTime = hours + minutes;
	var nowDate = months + days;

	$("input#nowdate").val(nowDate);
	$("input#now").val(nowTime);

	var currentDate2 = currentDate.format("MM.DD(ddd)");

	/* 시작 시간과 끝 시간 가져오기 */
	var startTime = $("#startTime").val();
	var endTime = '';

	if($("#endTime").val()=="24:00") {
		endTime = "23:30";
	} else {
		endTime = $("#endTime").val();
	}

	/* 시작 시간과 끝 시간을 Date 객체로 변환 */
	var startDate = new Date(currentYear + "/" + currentMonth + "/" + currentDay + " " + startTime);
	var endDate = new Date(currentYear + "/" + currentMonth + "/" + currentDay + " " + endTime);

	/* 30분 간격으로 시간 슬롯 생성 */
	var currentTime = startDate;
	var timeSlots = [];
	var timeSlots2 = [];
	var timeSlots3 = [];

	/* 시작 시간과 끝 시간을 Date 객체로 변환 */
	while (currentTime <= endDate) {
		var formattedTime = currentTime.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
		var formattedTime2 = currentTime.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit', hour12: false });
		var timeWithoutColon = formattedTime2.replace(':', '');

		timeSlots.push(formattedTime);
		timeSlots2.push(timeWithoutColon);

		currentTime.setMinutes(currentTime.getMinutes() + 30);
	}

	/* 시간과 분을 추출 */
	for (var i = 0; i < timeSlots.length; i++) {
		var timeParts = timeSlots[i].split(" ");
		var time = timeParts[1];

		/* 시간을 24시간 형식으로 변환 */
		var formattedTime3 = "";

		if (timeParts[0] === "오전") {
			var parts = time.split(":");
			var hours = parseInt(parts[0]);
			var minutes = parts[1];

			if (hours === 12) {
				hours = "0" + (hours - 12);
			} else if(hours < 10) {
				hours = "0" + hours;
			}

			formattedTime3 = hours + minutes;
		}
		else {
			var parts = time.split(":");
			var hours = parseInt(parts[0]);
			var minutes = parts[1];

			if (hours === 12) {
				formattedTime3 = hours + minutes;
			} else {
				hours = hours + 12;
			}

			formattedTime3 = hours + minutes;
		}

		timeSlots3.push(formattedTime3);
	}

	/* 시간 슬롯을 화면에 표시 */
	var timeContainer = $(".rtime");
	timeContainer.empty();

	/* 시간 생성하기 */
	for (var i = 0; i < timeSlots.length; i++) {
		var timeSlot = timeSlots[i];
		var timeElement = $("<span>", { class: "stime" }).append(
			$("<input>", { type: "hidden", name: "stime", value: timeSlot}),timeSlot);

		timeContainer.append(timeElement);
	}

	/** 클릭이벤트 **/
	$(".rtime").on("click", ".stime", function() {

		/* 선택된 시간 슬롯 요소에 스타일을 적용 */
		$(".stime").removeClass("selected");
		$(this).addClass("selected");

		/* 선택된 시간 출력 */
		var selectedTime = $(this).text();
		var selectedTime2 = $(this).text();
		var selectedTime3 = $(this).text();

		/* 시간과 분을 추출 */
		var timeParts = selectedTime3.split(" ");
		var time = timeParts[1];

		/* 시간을 24시간 형식으로 변환 */
		var formattedTime3 = "";
		if (timeParts[0] === "오전") {
			var parts = time.split(":");

			if(parts[0]==12) {
				var hours = "0" + (parseInt(parts[0])-12);
				var minutes = parts[1];
				formattedTime3 = hours + ":" + minutes;
			} else {
				formattedTime3 = time;
			}
		} else {
			var parts = time.split(":");

			if(parts[0]==12) {
				var hours = parseInt(parts[0]);
				var minutes = parts[1];
				formattedTime3 = hours + ":" + minutes;
			} else {
				var hours = parseInt(parts[0]) + 12;
				var minutes = parts[1];
				formattedTime3 = hours + ":" + minutes;
			}
		}

		$("#vtime").val(formattedTime3);
	});

	/** 날짜 먼저 선택하기 **/
	$(".rtime").on("click", ".stime", function() {
		if($("#vdate").val() == ""){
			Swal.fire({
				icon: 'warning',
				title: '날짜를 먼저 선택해 주세요',
				showConfirmButton: true,
				confirmButtonColor:'#98dfff',
				confirmButtonText: '확인'
			});
			$("#vtime").val("");
			$(".stime").removeClass("selected");
			return false;
		}
	});

	/** form submit 순서 **/
	$("#check").click(function(){
		if($("#vdate").val() == ""){
			Swal.fire({
				icon: 'warning',
				title: '날짜를 선택해주세요',
				showConfirmButton: true,
				confirmButtonColor:'#98dfff',
				confirmButtonText: '확인'
			});
			return false;
		} else if($("#vtime").val()=="") {
			Swal.fire({
				icon: 'warning',
				title: '시간을 선택해주세요',
				showConfirmButton: true,
				confirmButtonColor:'#98dfff',
				confirmButtonText: '확인'
			});
			return false;
		}
	});

	/** 에약버튼 alert **/
	$("#check").click(function() { // 예약
		event.preventDefault();

		var hid = $("input[name='hid']").val();
		var mid = $("input[name='mid']").val();
		var vdate = $("input[name='vdate']").val();
		var vtime = $("input[name='vtime']").val();

		$.ajax({
			url: "http://localhost:9000/reservation/"+hid,
			type: "GET",
			data: {
				hid: hid,
				mid: mid,
				vdate: vdate,
				vtime: vtime
			},
			success: function(check_result) {
				if (check_result === "fail") {
					Swal.fire({
						icon: 'error',
						title: '중복 예약하셨습니다',
						text: '예약 일시를 다시 선택해주세요.',
						showConfirmButton: true,
						confirmButtonColor:'#98dfff',
						confirmButtonText:'확인'
					});
				} else if (check_result === "success") {
					Swal.fire({
						icon: 'success',
						title: '예약 완료',
						showConfirmButton: true,
						confirmButtonColor:'#98dfff',
						confirmButtonText:'확인'
					}).then(function() {
						window.location.href = "http://localhost:9000/mypage_reservation";
					});
				}
			}
		});
	});
});