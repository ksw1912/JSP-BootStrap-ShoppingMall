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
<title>쇼핑물 상세 정보</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<jsp:include page="slide.jsp" />
	<div class="album py-5 bg-body-tertiary">
		<div class="container mt-4">
			<form action="/DBP_Project/productController?action=search" method="post">
				<label class="visually-hidden" for="autoSizingInputGroup">Search</label>
				<span class="input-group w-25"> <span
					class="input-group-text"><i class="bi bi-search"></i></span> <input type="text" class="form-control"
					 id="autoSizingInputGroup" placeholder="Search"
					name="search">
					<button class="btn btn-secondary" type="submit">검색</button>
				</span>
			</form>


			<div class="row row-cols-1 row-cols-md-3 g-4 mt-2">
				<c:forEach var="p" varStatus="i" items="${products}">
					<div class="col">
						<div class="card shadow">
							<img
								src="${pageContext.request.contextPath}/images/${p.productImg}"
								class="bd-placeholder-img card-img-top" width="100%"
								height="190" alt="이미지가없음">
							<div class="card-body">
								<h5 class="card-title">Product: ${p.pname}</h5>
								<p class="card-text">
									<b>제조사</b> : ${p.manufacturer}
								</p>
								<p class="card-text">
									<b>재고 수</b> : ${p.unitsInStock}
								</p>
								<p class="card-text">
									<b>가격</b> : ${p.unitPrice}원
								</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<form
											action="/DBP_Project/productController?action=productdetails"
											method="post">
											<input type="hidden" name="productId" value="${p.productId}">
											<button type="submit"
												class="btn btn-sm btn-outline-secondary">
												<i class="bi bi-eye"></i> View
											</button>
										</form>
										<form action="/DBP_Project/productController?action=cartInsert" method="post">
											<input type="hidden" name="productId" value="${p.productId}">
											<button type="submit"
												class="btn btn-sm btn-outline-secondary">
												<i class="bi bi-cart-check"></i> Bucket
											</button>
										</form>
									</div>
									<small class="text-body-secondary">9 mins</small>
								</div>
							</div>
						</div>
					</div>

				</c:forEach>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
