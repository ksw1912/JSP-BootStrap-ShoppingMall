<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="productDAO" class="ProductInfo.ProductRepository"
	scope="application" />
<%@ page import="ProductInfo.Product"%>
<%@ page import="java.util.ArrayList"%>
<%
String TotalProductId = request.getParameter("productId");
Product totalProduct = productDAO.getProductById(TotalProductId);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="../style.css" type="text/css">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	
	<div class="container my-3 py-3">
		<div class="border-start border-5 border-primary ps-5 mb-5"
			style="max-width: 600px;">
			<h6 class="text-primary text-uppercase">Order</h6>
			<h1 class="display-4 text-uppercase mb-0">주문 상품</h1>
		</div>
	</div>
	
	<div class="container my-3 py-3">
		<div class="border-start border-5 border-primary ps-5 mb-3"
			style="max-width: 600px;">
			<h6 class="text-primary text-uppercase">Order</h6>
			<h4 class="display-5 text-uppercase mb-0">주문 정보 정보</h4>
		</div>
	</div>

	<div class="container mb-5 border-top border-bottom rounded-3">
		<div class="row">
			<div class="col-md-4">
				<img src="../img/1.jpg" class="img-fluid rounded-start" alt="...">
			</div>
			<div class="col-6">
				<h3 class="card-title">
					<span><b>상품명</b> : <%=totalProduct.getPname()%></span>
				</h3>
				<p>
					<b>상품 코드 : </b><span class="badge text-bg-primary"><%=totalProduct.getProductId()%></span>
				</p>
				<p>
					<b>분류</b> :
					<%=totalProduct.getCategory()%>
				</p>
				<p>
					<b>가격</b> :
					<%=totalProduct.getCategory()%>
				</p>
			</div>
		</div>
	</div>

	<form action="./purchasecomfirm.jsp" class="form-horizontal"
		method="post">

		<div class="container round-3">
			<div class="row g-0 bg-light overflow-hidden">
				<div class="d-flex flex-column justify-content-center">
					<div class="p-4" style="line-height: 3em">
						<input type="hidden" name="TotalProductId"
							value="<%=TotalProductId%>" />
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
								<input name="address" type="text" class="form-control"
									placeholder="주소 작성" required />
							</div>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container text-center mt-3 mb-3">
			<input type='submit' value="Purchase"
				class="btn btn-outline-dark btn-lg">
		</div>
	</form>
	<!--purchasecomfirm.jsp form-->
	<jsp:include page="footer.jsp" />
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