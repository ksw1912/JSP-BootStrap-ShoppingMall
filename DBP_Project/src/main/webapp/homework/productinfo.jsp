<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="ProductInfo.Product"%>
<jsp:useBean id="productDAO" class="ProductInfo.ProductRepository"
	scope="application" />
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
<title>쇼핑물 상세 정보</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">쇼핑물 정보</h1>
		</div>
	</div>
	<jsp:include page="slide.jsp" />
	<%
	ArrayList<Product> listOfProducts = productDAO.getAllProducts();
	%>
	<div class="container mt-4 mb-4">
		<div class="row row-cols-1 row-cols-md-3 g-4">
			<%
			for (int i = 0; i < listOfProducts.size(); i++) {
			%>
			<div class="col">
				<div class="card text-center mb-3 h-100">
					<img src="../img/1.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title"><%=listOfProducts.get(i).getPname()%></h5>
						<p class="card-text"><%=listOfProducts.get(i).getDescription()%></p>
						<p>
							<b>상품 코드 : </b><span class="badge text-bg-primary"><%=listOfProducts.get(i).getProductId()%></span>
						</p>
						<p>
							<b>제조사</b> :
							<%=listOfProducts.get(i).getManufacturer()%>
						</p>
						<p>
							<b>분류</b> :
							<%=listOfProducts.get(i).getCategory()%>
						</p>
						<p>
							<b>재고 수</b> :
							<%=listOfProducts.get(i).getUnitsInStock()%>
						</p>
						<h4><%=listOfProducts.get(i).getUnitPrice()%>원
						</h4>
						<p>
						<form action="productdetails.jsp" method="post">
							<input type="hidden" name="productId"
								value="<%=listOfProducts.get(i).getProductId()%>">
							<button type="submit" class="btn btn-info">주문 &raquo;</button>
						</form>
						<form action="shoppingbuckeetprocess.jsp" method="post">
							<input type="hidden" name="productId"
								value="<%=listOfProducts.get(i).getProductId()%>">
						</form>

						<form action="shoppingbucketprocess.jsp" method="get">
							<button type="submit" class="btn btn-info">장바구니 &raquo;</button>
						</form>
					</div>
					<div class="card-footer">
						<small class="text-body-secondary">Last updated 3 mins ago</small>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
