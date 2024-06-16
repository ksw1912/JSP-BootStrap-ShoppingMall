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
<title>구매 및 장바구니</title>
</head>
<body>
	<jsp:include page="menu.jsp" />

	<main id="main" class="main mt-3">
		<section
			class="hero d-flex flex-column align-items-center justify-content-center text-center">
			<h1>주문 상품</h1>
			<p>
				<i class="bi bi-currency-dollar"></i><i class="bi bi-cash"></i><i
					class="bi bi-cash"></i><i class="bi bi-currency-dollar"></i>
			</p>
		</section>
		<div class="container">
			<div class="row gy-5 mb-5">
				<div class="col-12">
					<div class="d-inline-flex">
						<img
							src="${pageContext.request.contextPath}/images/${p.productImg}"
							alt="이미지 없음" width="200" height="200" class="img-thumbnail">
						<div class="details mx-3">
							<h2 class="display-5 fw-bolder shadow-sm">
								<a
									href="/DBP_Project/productController?action=productdetails&productId=${p.productId}">${p.productId}</a>
								<input type="hidden" value="${p.productId}" id="mainProduct" />
							</h2>
							<p class="text-decoration fs-5 fw-bolder">${p.unitPrice}원</p>
							<input type="hidden" class="price" value="${p.unitPrice}">
							<div class="submit_container">
								<div class="d-inline-flex align-items-center g-3">
									<span class="lead me-2">수량 :</span> <input
										class="form-control text-center me-2 count" id="inputQuantity"
										name="count" value="${count}" min="1" max="${p.unitsInStock}"
										style="max-width: 4rem;" type="number">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="mx-5 px-5">
			<hr>
		</div>
		<div class="container">
			<h2 class="text-center mb-3">장바구니 목록</h2>
			<div class="container">
				<c:forEach var="c" varStatus="i" items="${carts}">
					<div class="col-12" id="${c.product.productId}">
						<div class="d-inline-flex">
							<input type="checkbox" class="me-3 form-check-input check-box" value="${c.product.productId}"
								checked /> <img
								src="${pageContext.request.contextPath}/images/${c.product.productImg}"
								alt="이미지 없음" width="200" height="200" class="img-thumbnail">
							<div class="details mx-3">
								<h2 class="display-5 fw-bolder shadow-sm">
									<a
										href="/DBP_Project/productController?action=productdetails&productId=${c.product.productId}">${c.product.productId}</a>
								</h2>
								<p class="text-decoration fs-5 fw-bolder">${c.product.unitPrice}원</p>
								<input type="hidden" class="price"
									value="${c.product.unitPrice}">
								<div class="submit_container">
									<div class="d-inline-flex align-items-center g-3 mb-2">
										<span class="lead me-2">수량 :</span> <input
											class="form-control text-center shadow-sm count me-2"
											id="count_${c.product.productId}" name="count"
											value="${c.cartInCount}" min="0"
											max="${c.product.unitsInStock}" style="max-width: 4rem;"
											type="number"> <input type="hidden"
											value="${c.cartInCount}" id="past_${c.product.productId}" />
									</div>
									<br>
									<button type="button"
										class="btn btn-outline-dark rounded-circle shadow border-0 d-flex align-items-center justify-content-center p-0"
										onclick="cartDelete('${c.product.productId}')">
										<i class="bi bi-x-circle-fill fs-4"></i>
									</button>
								</div>
							</div>
						</div>
						<hr>
					</div>

				</c:forEach>
			</div>
		</div>
		<div class="mx-5 px-5">
			<hr>
		</div>
		<div class="container mt-3">
			<h3 class="display-5 fw-bolder" id="totalPrice">총 가격 :</h3>
		</div>

		<div
			class="container d-flex align-items-center justify-content-center mt-3 mb-3">
			<form class="d-inline">
				<button class="btn btn-outline-dark btn-lg" type="button"
					onclick="SelectedProducts()">
					<i class="bi bi-bag-heart-fill"></i> Purchase
				</button>
			</form>
			<form>
				<button class="btn btn-outline-dark ms-3 btn-lg" type="button" onclick="history.back()">
					<i class="bi bi-x-square-fill"></i> Cancel
				</button>
			</form>
		</div>

	</main>

	<jsp:include page="footer.jsp" />
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
<script>
	document
			.addEventListener(
					"DOMContentLoaded",
					function() {
						const inputElements = document
								.querySelectorAll('input[type="number"]');
						var priceNodes = document.querySelectorAll(".price");
						var countNodes = document.querySelectorAll(".count");
						var sum = 0;

						function total() {
							sum = 0;
							for (var i = 0; i < priceNodes.length; i++) {
								sum += (parseInt(countNodes[i].value) * parseInt(priceNodes[i].value));
							}
							var totalPrice = document
									.getElementById('totalPrice');
							totalPrice.textContent = "총 가격 : " + sum + " 원";
						}

						total();

						inputElements.forEach(function(input) {
							input.addEventListener('input', function(event) {
								var productId = event.target.id.split('_')[1];
								if (!productId) {
									total();
								} else {
									cartUpdate(productId);
									total();
								}
							});
						});

						window.cartDelete = function(productId) {
							var xhr = new XMLHttpRequest();
							var url = '/DBP_Project/productController?action=cartDelete';
							var params = 'productId=' + productId;

							xhr.open("POST", url, true);
							xhr.setRequestHeader("Content-Type",
									"application/x-www-form-urlencoded");
							xhr.send(params);
							xhr.onload = function() {
								if (xhr.status === 200) {
									var cart = document
											.getElementById(productId);
									alert('삭제되었습니다.');
									if (cart) {
										cart.parentNode.removeChild(cart);
										//총가격 재계산하기 
										total();
									}
								} else {
									alert('요청 실패: ' + xhr.statusText);
								}
							};
						}

						window.cartUpdate = function(productId) {
							var cartInCount = document.getElementById('count_'
									+ productId).value;
							var past_cartInCount = document
									.getElementById('past_' + productId).value;
							var xhr = new XMLHttpRequest();
							if (cartInCount == past_cartInCount) {
								return;
							}

							var url = '/DBP_Project/productController?action=cartUpdate';
							var params = 'productId=' + productId
									+ '&cartInCount=' + cartInCount;

							xhr.open("POST", url, true);
							xhr.setRequestHeader("Content-Type",
									"application/x-www-form-urlencoded");
							xhr.send(params);
							xhr.onload = function() {
								if (xhr.status === 200) {
									document.getElementById('count_'
											+ productId).innerText = cartInCount;
									total();
								} else {
									alert('요청 실패: ' + xhr.statusText);
								}
							};
						}
					});

	function SelectedProducts() {
		var form = document.createElement("form");
		form.method = "POST";
		form.action = "/DBP_Project/productController?action=processPurchase";

		var mainProduct = document.getElementById("mainProduct");
		var input = document.createElement("input");
		input.type = "hidden";
		input.name = "productIds";
		input.value = mainProduct.value;
		form.appendChild(input);
		
		var inputQuantity = document.getElementById("inputQuantity");
		var input = document.createElement("input");
		input.type = "hidden";
		input.name = "count";
		input.value = inputQuantity.value;
		form.appendChild(input);

		var productCheckboxes = document.querySelectorAll(".check-box");
		productCheckboxes.forEach(function(checkbox) {
			if (checkbox.checked) {
				var input = document.createElement("input");
				input.type = "hidden";
				input.name = "productIds";
				input.value = checkbox.value;
				form.appendChild(input);
			}
		});

		
		document.body.appendChild(form);
		form.submit();
	}
</script>
</html>