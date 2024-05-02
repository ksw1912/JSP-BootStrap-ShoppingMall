<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="productDAO" class="Order.OrderRepository"
	scope="application" />
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="style.css" type="text/css">
<meta charset="UTF-8">
<title>주문 처리 페이지</title>
</head>
<body>
	<div class="container my-3 py-3">
		<div class="border-start border-5 border-primary ps-5 mb-5"
			style="max-width: 600px;">
			<h6 class="text-primary text-uppercase">Oder</h6>
			<h1 class="display-5 text-uppercase mb-0">주문 정보 정보</h1>
		</div>
	</div>

	<div class="container my-3 py-3">
		<div class="border-start border-5 border-primary ps-5 mb-5"
			style="max-width: 600px;">
			<h6 class="text-primary text-uppercase">Order</h6>
			<h3 class="display-5 text-uppercase mb-0">주문 상품</h3>
		</div>
	</div>


	<div class="container mb-5">
		<div class="col-md" style="max-width: 540px;">
			<div class="container bg-body-secondary rounded-5">
				<div class="card mb" style="max-width: 540px;">
					<div class="row g-0">
						<div class="col-md-4">
							<img src="1.jpg" class="img-fluid rounded-start" alt="...">
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-title">Card title</h5>
								<p class="card-text">This is a wider card with supporting
									text below as a natural lead-in to additional content. This
									content is a little bit longer.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<img src="1.jpg" class="img-fluid rounded-start" alt="...">
			</div>
			<div class="col-6">
				<p>상품명:</p>
				<p>버튼(옵션)</p>
				<p>가격</p>
			</div>
		</div>
	</div>

	<div class="container">
		<form action="./processShippingInfo.jsp" class="form-horizontal"
			method="post">
			<div class="row g-0 bg-light overflow-hidden">
				<div class="d-flex flex-column justify-content-center">
					<div class="p-4" style="line-height: 3em">
						<input type="hidden" name="cartId"
							value="<%=request.getParameter(" cartId")%>" />
						<div class="form-group row">
							<label class="col-sm-2">성명</label>
							<div class="col-sm-3">
								<input name="name" type="text" class="form-control"
									placeholder="성명 작성" required />
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">우편번호</label>
							<div class="col-sm-3">
								<input name="zipCode" type="text" class="form-control"
									placeholder="우편번호 작성" required />
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">주소</label>
							<div class="col-sm-5">
								<input name="addressName" type="text" class="form-control"
									placeholder="주소 작성" required />
							</div>
						</div>
						<div class="form-group row mb">
							<div class="col-sm-offset-2 col-sm-10">
								<a
									href="./cart.jsp?cartId=<%=request.getParameter("cartId") %>"
									class="btn btn-secondary" role="button"> 이전 </a> <input
									type="submit" class="btn btn-primary" value="등록" /> <a
									href="./checkOutCancelled.jsp" class="btn btn-primary"
									role="button">취소</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div class="container text-center">
		<button type="button" class="btn btn-outline-dark btn-lg">Purchase</button>
	</div>
	<!--purchasecomfirm.jsp form-->
	<jsp:include page="footer.jsp" />
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>