<%@ page contentType="text/html; charset=utf-8"%>
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
<title>배송정보변경</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div>
	<div
		class="modal modal-signin position-static d-block bg-secondary py-5"
		tabindex="-1" role="dialog" id="modalSignin">
		<div class="modal-dialog" role="document">
			<div class="modal-content rounded-4 shadow">
				<div class="modal-header p-5 pb-4 border-bottom-0">
					<h1 class="fw-bold mb-0 fs-2">
						<span class="material-symbols-outlined"> <i
							class="bi bi-person-check-fill"></i> 배송 상태 변경
						</span>
					</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"
						onclick="window.location.href='/DBP_Project/productController?action=managePurchase'"></button>
				</div>

				<div class="modal-body pb-5">
					<form action="/DBP_Project/productController?action=processdeliveryUpdate"
						method="post" enctype="application/x-www-form-urlencoded">
						<div class="form-floating mb-3">
							<input type="text" class="form-control rounded-3"
								id="floatingInput" placeholder="배송정보" name="orderstatus" required>
							<label for="floatingInput">배송 상태</label>
							<input type="hidden" value="${orderId}" name="orderId">
							<input type="hidden" value="${productId}" name="productId">
						</div>

						<button class="w-100 btn btn-lg rounded-3 btn-primary"
							data-bs-toggle="modal" data-bs-target="#exampleModal"
							type="submit">변경하기</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
	<jsp:include page="footer.jsp" />
</body>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</html>