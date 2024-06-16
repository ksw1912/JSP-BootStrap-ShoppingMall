<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="homework/style.css" type="text/css">
<title>Join</title>
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
					<form action="/DBP_Project/productController?action=joinProcess"
						method="post" enctype="application/x-www-form-urlencoded">
						<div class="form-floating mb-3">
							<input type="text" class="form-control rounded-3"
								id="floatingInput" placeholder="name" name="name" required>
							<label for="floatingInput">name</label>
						</div>
						<div class="form-floating mb-3">
							<input type="tel" class="form-control rounded-3"
								id="floatingInput" placeholder="Id" name="id" required>
							<label for="floatingInput">ID</label>
						</div>
						<div class="form-floating mb-3">
							<input type="password" class="form-control rounded-3"
								id="floatingPassword" name="pw" placeholder="Password"
								required> <label for="floatingPassword">Password</label>
						</div>
						<div class="form-floating mb-3">
							<input type="tel" class="form-control rounded-3"
								id="floatingInput" placeholder="010-xxxx-xxxx" name="number"
								pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required> <label
								for="floatingInput">Phone(010-xxxx-xxxx)</label>
						</div>
						<button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary"
							type="submit">JOIN</button>
					</form>
					<small class="text-muted">By clicking Sign up, you agree to
						the terms of use.</small>
					<hr class="my-4">
					<h2 class="fs-5 fw-bold mb-3">Or use a third-party</h2>
					<button class="w-100 py-2 mb-2 btn btn-outline-dark rounded-3"
						type="submit">
						<i class="bi bi-twitter" width="16" heigth="16"></i> Sign up with
						Twitter
					</button>
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
				</div>
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