<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="style.css" type="text/css">
<title>Hs쇼핑물 로그인</title>
</head>
<body>
	<jsp:include page="./menu.jsp" />
	<div class="container" align="center">
		<div class="col-md-6">
			<div class="container bg-body-secondary p-4 mt-5 py-4 rounded-5">
				<!-- 테두리 모서리 색상  -->
				<span class="icon-container" style="font-size: 3em;"> <i
					class="bi bi-box-arrow-in-left"></i>
				</span>
				<h3 class="form-signin-heading">로그인 페이지</h3>
				<form class="form-signin" action="login_process.jsp" method="post">

					<div class="form-group">
						<label for="inputUserName" class="sr-only"></label> <input
							type="text" class="form-control" placeholder="ID" name="id"
							required autofocus>
					</div>
					<div class="form-group">
						<label for="inputPassword" class="sr-only"></label> <input
							type="password" class="form-control" placeholder="Password"
							name="password" required>
					</div>
					<div class="checkbox mb-3">
						<label> <input type="checkbox" value="remember-me">
							아이디 저장
						</label>
					</div>
					<button class="btn btn-primary btn-lg mb-1" type="submit">
						<i class="bi bi-door-open"></i> 로그인
					</button>
				</form>
				<button type="button" class="btn btn-primary btn-lg"
					onclick="location.href='./join.jsp'">
					<i class="bi bi-door-open"></i> 회원 가입
				</button>

				<p class="mt-5 text-muted">&copy; 2024 made-김서원</p>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>