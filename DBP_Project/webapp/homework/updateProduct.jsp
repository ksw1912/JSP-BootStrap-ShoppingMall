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
<title>상품 정보 변경</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div
		class="modal modal-signin position-static d-block bg-secondary py-5 h-auto"
		tabindex="-1" role="dialog" id="modalSignin">
		<div class="modal-dialog" role="document">
			<div class="modal-content rounded-4 shadow">
				<form name="newProduct"
					action="/DBP_Project/productController?action=processUpdateProduct"
					class="form-horizontal" method="post" enctype="multipart/form-data">
					<div class="modal-header p-5 pb-4 border-bottom-0">
						<h1 class="fw-bold mb-0 fs-2">
							<i class="bi bi-gear"></i> 상품 정보 수정
						</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close" onclick="movePage()"></button>
					</div>
					<div class="p-4">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" name="pname"> <label
								for="floatingInput">상품명</label>
						</div>
						<div class="form-floating mb-3">
							<input type="number" class="form-control" name="unitPrice">
							<label for="floatingInput">가격</label>
						</div>
						<div class="form-floating mb-3">
							<input type="text" class="form-control" name="description">
							<label for="floatingInput">상세 정보</label>
						</div>
						<div class="form-floating mb-3">
							<input type="text" class="form-control" name="manufacturer">
							<label for="floatingInput">제조사</label>
						</div>
						<div class="form-floating mb-3">
							<input type="text" class="form-control" name="category">
							<label for="floatingInput">분류</label>
						</div>
						<div class="form-floating mb-3">
							<input type="number" class="form-control" name="unitsInStock">
							<label for="floatingInput">재고 수</label>
						</div>

						<div class="form-group row mb-3 mt-3">
							<label class="col-sm-2 text-muted">상태</label>
							<div class="col-sm-10 d-flex align-items-center">
								<div class="form-check form-check-inline">
									<input type="radio" name="cond" value="popular"
										class="form-check-input text-muted" id="popular"> <label
										class="form-check-label text-muted" for="popular">Popular</label>
								</div>
								<div class="form-check form-check-inline">
									<input type="radio" name="cond" value="general"
										class="form-check-input text-muted" id="general"> <label
										class="form-check-label text-muted" for="general">General</label>
								</div>
								<div class="form-check form-check-inline">
									<input type="radio" name="cond" value="new"
										class="form-check-input text-muted" id="new"> <label
										class="form-check-label text-muted" for="new">New</label>
								</div>
							</div>
						</div>

						<div class="form">
							<input type="file" name="file" class="form-control"> <label
								for="floatingInput"></label>
						</div>

						<input type="hidden" name="productId" value="${p.productId}">
						<button class="w-100 btn btn-lg btn-primary mt-4" type="submit">상품정보수정</button>
					</div>
					<p class=" mb-3 text-muted text-center">© made-김서원</p>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
<script>
	function movePage() {
		window.location.href = '/DBP_Project/productController?action=manage';
	}
</script>
</html>
