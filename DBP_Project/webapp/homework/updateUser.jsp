<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>회원 정보 수정</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div
		class="modal modal-signin position-static d-block bg-secondary py-5"
		tabindex="-1" role="dialog" id="modalSignin">
		<div class="modal-dialog" role="document">
			<div class="modal-content rounded-4 shadow">
				<div class="modal-header p-5 pb-2 border-bottom-0">
					<h1 class="mb-4 fw-bold fs-2">
						<span class="material-symbols-outlined"><i
							class="bi bi-person-fill-gear"></i> ${sessionName}님의 회원정보 수정</span>
					</h1>
				</div>

					<div class="modal-body p-2 pt-0">
						<form
							action="/DBP_Project/productController?action=processUpdateUser"
							class="form-horizontal" method="post">
							<div class="form-floating mb-3">
								<input type="text" class="form-control" name="name"> <label
									for="floatingInput">Name</label>
							</div>
							<div class="form-floating">
								<input type="tel" class="form-control" name="number"> <label
									for="floatingInput">PhoneNumber</label>
							</div>

							<input type="hidden" name="productId" value="${p.productId}">
							<button class="w-100 btn btn-lg btn-primary mt-4" type="submit">회원정보수정</button>
							<p class="mt-3 mb-2 text-muted">© made-김서원</p>
						</form>
					</div>
				</div>
			</div>
		</div>


	<jsp:include page="footer.jsp" />
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
