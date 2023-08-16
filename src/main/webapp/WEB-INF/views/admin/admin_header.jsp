<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/css/admin_header.css">
</head>
<body>
	<header>
		<div class="header-menu1">
			<div class="header-content">
				<a href="http://localhost:9000">
					<div class="header-logo">
						<img src="http://localhost:9000/images/logo_white.png" width="60px" height="60px">
						<span>PetCare Pedia</span>
					</div>
				</a>
				<div class="header-nav">
					<ul>
						<li>
							<a id="logout">로그아웃</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		
	</header>
</body>
<script>
	$("#logout").click(function(){
		Swal.fire({
			title: '로그아웃하시겠습니까?',
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#FFB3BD',
			cancelButtonColor: '#98dfff',
			confirmButtonText: '로그아웃',
			cancelButtonText: '취소'
		}).then((result) => {
			if (result.isConfirmed) {
				$.ajax({
					url : "/logout",
					success : function(result){
						if(result=="success"){
							Swal.fire({
								icon: 'success',
								title: '로그아웃 성공',
								text: '다음에 다시 만나요!',
								confirmButtonColor:'#98dfff',
								confirmButtonText:'확인'
							}).then((result) => {
								if (result.isConfirmed) {
									location.href = "/";
								}//if
							});//swal
						}
					}//success
				});//ajax
			}
		})
	})
</script>
</script>

</html>