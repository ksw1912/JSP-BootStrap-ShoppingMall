<!DOCTYPE html>
<html lang="en">
<title>Bootstrap 5 Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>
	<div
		class="modal modal-signin position-static d-block bg-secondary py-5"
		tabindex="-1" role="dialog" id="modalSignin">
		<div class="modal-dialog" role="document">
			<div class="modal-content rounded-4 shadow">
				<div class="modal-header p-5 pb-4 border-bottom-0">
					<h1 class="fw-bold mb-0 fs-2">Join The Membership</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close" onclick="movePage()"></button>
				</div>

				<div class="modal-body p-5 pt-0">
					<form action="./join_process.jsp" method="post"
						enctype="application/x-www-form-urlencoded">
						<div class="form-floating mb-3">
							<input type="text" class="form-control rounded-3"
								id="floatingInput" placeholder="name" name="name" required>
							<label for="floatingInput">name</label>
						</div>
						<div class="form-floating mb-3">
							<input type="tel" class="form-control rounded-3"
								id="floatingInput" placeholder="Id" name="Id" required>
							<label for="floatingInput">ID</label>
						</div>
						<div class="form-floating mb-3">
							<input type="password" class="form-control rounded-3"
								id="floatingPassword" placeholder="Password" required> <label
								for="floatingPassword">Password</label>
						</div>
						<div class="form-floating mb-3">
							<input type="tel" class="form-control rounded-3"
								id="floatingInput" placeholder="010-xxxx-xxxx" name="tel"
								pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required> <label
								for="floatingInput">Phone(010-xxxx-xxxx)</label>
						</div>

						<button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary"
							type="submit">JOIN</button>
						<small class="text-muted">By clicking Sign up, you agree
							to the terms of use.</small>
						<hr class="my-4">
						<h2 class="fs-5 fw-bold mb-3">Or use a third-party</h2>
						<button class="w-100 py-2 mb-2 btn btn-outline-dark rounded-3"
							type="submit">
							<i class="bi bi-twitter" width="16" heigth="16"></i> Sign up with
							Twitter
						</button>
						<button class="w-100 py-2 mb-2 btn btn-outline-primary rounded-3"
							type="submit">
							<i class="bi bi-facebook" width="16" heigth="16"></i> Sign up
							with Facebook
						</button>
						<button
							class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-3"
							type="submit">
							<i class="bi bi-github" width="16" height="16"></i> Sign up with
							GitHub
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
        function movePage() {
            window.location.href = './welcome.jsp'; 
        }
    </script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</body>

</html>