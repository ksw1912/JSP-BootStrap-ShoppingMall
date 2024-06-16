<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="homework/style.css" type="text/css">
<title>비밀번호 수정</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div
		class="modal modal-signin position-static d-block bg-secondary py-5"
		tabindex="-1" role="dialog" id="modalSignin">
		<div class="modal-dialog" role="document">
			<div class="modal-content rounded-4 shadow">
				<div class="modal-header p-5 pb-4 border-bottom-0">
					<!-- <h1 class="modal-title fs-5" >Modal title</h1> -->
					<h1 class="fw-bold mb-0 fs-2">Password Modify</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close" onclick="movePage()"></button>
				</div>
				<form
					action="/DBP_Project/productController?action=pwModifiyProcess"
					method="post">
					<div class="modal-body p-5 pt-0">
						<div class="form-floating mb-3">
							<input type="text" class="form-control rounded-3"
								id="floatingInput" placeholder="name@example.com"
								name="pw_present"> <label for="floatingInput">Present
								password</label>
						</div>
						<div class="form-floating mb-3">
							<input type="password" class="form-control rounded-3"
								id="floatingPassword" placeholder="Password" name="pw_modify">
							<label for="floatingPassword">Modify Password</label>
						</div>
						<button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary"
							type="submit">Password Change</button>
						<small class="text-muted">By clicking Password Change, you
							agree to the modification.</small>
						<hr class="my-4">
											<button class="w-100 py-2 mb-2 btn btn-outline-dark rounded-3"
						type="button"
						onclick="location.href='/DBP_Project/productController?action=updateUser'">
						<i class="bi bi-person-fill-gear" style='width="16" height="16"'></i> Edit member information
					</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
	<script>
		function movePage() {
			window.location.href = '/DBP_Project/productController?action=welcome';
		}
	</script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>