<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="http://localhost:9000/WebCarePedia/image/foot_blue.png" rel="shortcut icon" type="image/x-icon">
<title>reservation</title>
<link rel="stylesheet" href="http://localhost:9000/WebCarePedia/css/search_reservation.css">


</head>
<body>
	<div class="reservation">
		<div class="title">
			<span>더조은 동물병원</span>
			<span>원하는 날짜/시간 선택</span>
		</div>
		
		<hr>
		
		<form name="reservation" action="#" method="get">
			<div class="date">
		        <span><a><</a></span>
		        <span><input type="hidden" name="date" value="04.27(목)">04.27(목)</span>
		        <span><input type="hidden" name="date" value="04.28(금)">04.28(금)</span>
		        <span><input type="hidden" name="date" value="04.29(토)">04.29(토)</span>
		        <span><input type="hidden" name="date" value="05.01(월)">05.01(월)</span>
		        <span><input type="hidden" name="date" value="05.02(화)">05.02(화)</span>
		        <span><a>></a></span>
		    </div>
			
			<hr>
			
			 <div class="time">
		        <span><input type="hidden" name="time" value="11:00">11:00</span>
		        <span><input type="hidden" name="time" value="11:30">11:30</span>
		        <span><input type="hidden" name="time" value="12:00">12:00</span>
		        <span><input type="hidden" name="time" value="14:00">14:00</span>
		        <span><input type="hidden" name="time" value="14:30">14:30</span>
		        <span><input type="hidden" name="time" value="15:00">15:00</span>
		        <span><input type="hidden" name="time" value="15:30">15:30</span>
		        <span><input type="hidden" name="time" value="16:00">16:00</span>
		        <span><input type="hidden" name="time" value="16:30">16:30</span>
		        <span><input type="hidden" name="time" value="17:00">17:00</span>
		    </div>
		</form>
		
		<button  type="button" id="check">확인</button>
	</div>
</body>
</html>