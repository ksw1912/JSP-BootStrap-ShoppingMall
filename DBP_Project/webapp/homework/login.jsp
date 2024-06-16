<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<title>Login</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
</head>
<body>
	<div
		class="modal modal-signin position-static d-block bg-secondary py-5"
		tabindex="-1" role="dialog" id="modalSignin">
		<div class="modal-dialog" role="document">
			<div class="modal-content rounded-4 shadow">
				<div class="modal-header p-5 pb-4 border-bottom-0">
					<h1 class="fw-bold mb-0 fs-2">
						<span class="material-symbols-outlined"> <i
							class="bi bi-person-check-fill"></i> login
						</span>
					</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"
						onclick="window.location.href='/DBP_Project/productController?action=welcome'"></button>
				</div>

				<div class="modal-body p-5 pt-0">
					<form action="/DBP_Project/productController?action=processLogin"
						method="post" enctype="application/x-www-form-urlencoded">
						<div class="form-floating mb-3">
							<input type="text" class="form-control rounded-3"
								id="floatingInput" placeholder="ID" name="id" required>
							<label for="floatingInput">ID</label>
						</div>
						<div class="form-floating mb-3">
							<input type="password" class="form-control rounded-3"
								id="floatingPassword" name="password" placeholder="Password"
								required> <label for="floatingPassword">Password</label>
						</div>
						<button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary"
							data-bs-toggle="modal" data-bs-target="#exampleModal"
							type="button">Login</button>
						<div class="modal fade" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h1 class="modal-title fs-5" id="exampleModalLabel">Login</h1>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">Would you like to login?</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Close</button>
										<button type="submit" class="btn btn-primary">Yes</button>
									</div>
								</div>
							</div>
						</div>
					</form>
					<small class="text-muted">By clicking Sign up, you agree to
						the terms of use.</small>
					<hr class="my-4">
					<button class="w-100 py-2 mb-2 btn btn-outline-primary rounded-3"
						type="submit">
						<i class="bi bi-facebook" width="16" heigth="16"></i> Sign up with
						Facebook
					</button>
					<button class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-3"
						type="submit">
						<i class="bi bi-github" width="16" height="16"></i> Sign up with
						GitHub
					</button>
					<hr class="my-4">
					<button class="w-100 py-2 mb-2 btn btn-outline-dark rounded-3"
						type="button"
						onclick="location.href='/DBP_Project/productController?action=join'">
						<i class="bi bi-person-plus-fill" width='16' height="16"></i> Join
					</button>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp" />
</body>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</html>