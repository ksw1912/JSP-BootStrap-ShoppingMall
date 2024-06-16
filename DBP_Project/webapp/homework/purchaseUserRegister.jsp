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
<title>회원 정보</title>
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
							class="bi bi-person-fill-gear"></i> 배송지 정보 입력</span>
					</h1>
				</div>
				<c:choose>
					<c:when test="${not empty d}">
						<div class="modal-body p-2 pt-0">
							<form
								action="/DBP_Project/productController?action=processpurchaseUserRegister_update"
								class="form-horizontal" method="post">
								<div class="form-floating mb-3">
									<input type="text" class="form-control" name="recipient"
										id="floatingName" value="${d.recipient}" required> <label
										for="floatingName">받는 사람</label>
								</div>
								<div class="form-floating mb-3">
									<input type="tel" class="form-control" name="recipient_number"
										value="${d.recipient_number}"
										pattern="[0-9]{3}[0-9]{4}[0-9]{4}" id="floatingtel" required>
									<label for="floatingtel">받는 사람 연락처 (010-xxxx-xxxx)</label>
								</div>
								<div class="form-floating">
									<input type="text" class="form-control" name="address"
										value="${d.address}" required id="floatingInput"> <label
										for="floatingInput">주소</label>
								</div>
								<button class="w-100 btn btn-lg btn-primary mt-4" type="submit">정보
									입력</button>
								<p class="mt-3 mb-2 text-muted">© made-김서원</p>
							</form>
						</div>
					</c:when>
					<c:otherwise>
						<div class="modal-body p-2 pt-0">
							<form
								action="/DBP_Project/productController?action=processpurchaseUserRegister"
								class="form-horizontal" method="post">
								<div class="form-floating mb-3">
									<input type="text" class="form-control" name="recipient"
										id="floatingName" value="" required> <label
										for="floatingName">받는 사람</label>
								</div>
								<div class="form-floating mb-3">
									<input type="tel" class="form-control" name="recipient_number"
										pattern="[0-9]{3}[0-9]{4}[0-9]{4}" id="floatingtel" required>
									<label for="floatingtel">받는 사람 연락처 (010-xxxx-xxxx)</label>
								</div>
								<div class="form-floating">
									<input type="text" class="form-control" name="address" required
										id="floatingInput"> <label for="floatingInput">주소</label>
								</div>
								<button class="w-100 btn btn-lg btn-primary mt-4" type="submit">정보
									입력</button>
								<p class="mt-3 mb-2 text-muted">© made-김서원</p>
							</form>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>