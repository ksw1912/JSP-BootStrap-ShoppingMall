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
</head>
<title>상품 보기</title>

</head>
<body>
	<jsp:include page="menu.jsp" />
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
</head>
<title>상품 보기</title>

</head>

<body>
	<div class="py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-6">
					<img class="card-img-top mb-5 mb-md-0"
						src="${pageContext.request.contextPath}/images/${p.productImg}"
						alt="...">
				</div>
				<div class="col-md-6">
					<div class="small mb-1">분류 : ${p.category}</div>
					<h1 class="display-5 fw-bolder">상품명 : ${p.pname}</h1>
					<div class="fs-5 mb-3">
						<span>${p.unitPrice} 원</span>
					</div>
					<p class="lead">재고수 : ${p.unitsInStock}</p>
					<p class="lead">${p.description}</p>

					<div class="grid gap-3 column-gap-3">
						<div class="g-col-6">
							<form action="/DBP_Project/productController?action=purchase"
								method="post">
								<div class="d-inline-flex align-items-center mb-3">
									<span class="lead me-2">수량 :</span> <input
										class="form-control text-center" id="inputQuantity"
										name="count" value="1" min="1" max="${p.unitsInStock}"
										style="max-width: 4rem;" type="number">
								</div>
								<br> <span> <input type="hidden" name="productId"
									value="${p.productId}">
									<button type="submit"
										class="btn btn-outline-dark shadow-sm me-2">
										<i class="bi bi-cart-check me-1"></i> 주문 &raquo;
									</button>
							</form>

							<input type="hidden" name="productId" value="${p.productId}">
							<a
								href="/DBP_Project/productController?action=cartInsert&productId=${p.productId}"
								class="btn btn-outline-dark shadow-sm" type="button"> <i
								class="bi-cart-fill me-1"></i> Bucket
							</a> </span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html><jsp:include page="footer.jsp" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>