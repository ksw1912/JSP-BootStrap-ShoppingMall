<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ProductInfo.Product"%>
<jsp:useBean id="productDAO" class="ProductInfo.ProductRepository"
	scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="style.css" type="text/css">
<title>상품 보기</title>
</head>
<body>
<jsp:include page="menu.jsp" />

<% String productId = request.getParameter("productId"); 
	Product product = productDAO.getProductById(productId);
%>
<div class="container mt-4">
		<div class="card mb-3 rounded-5">
			<div class="row g-0">
			  <div class="col-md-4">
				<img src="../img/1.jpg" class="img-fluid rounded-start" alt="...">
			  </div>
			  <div class="col-md-8 p-3">
				<div class="card-body">
					<h3 class="card-title">
						<span><b>상품명</b> : 
						<%=product.getPname()%></span>
					</h3>
					<p class="card-text">
						<span><b>상품설명</b> : 
						<%=product.getDescription()%></span>
					</p>

					<p>
						<b>상품 코드 : </b><span class="badge text-bg-primary"><%=product.getProductId()%></span>
					</p>
					<p>
						<b>제조사</b> :
						<%=product.getManufacturer()%>
					</p>
					<p>
						<b>분류</b> :
						<%=product.getCategory()%>
					</p>
					<p>
						<b>재고 수</b> :
						<%=product.getUnitsInStock()%>
					</p>
					<h4><%=product.getUnitPrice()%>원</h4>
					<form action="purchase.jsp" method="post">
						<input type="hidden" name="productId" value="<%=product.getProductId()%>">
						<button type="submit" class="btn btn-outline-dark">
							<i class="bi bi-currency-dollar fs-4"></i>
							주문 &raquo;</button>
					</form>
					<button class="btn btn-outline-dark mt-3">
						<i class="bi bi-cart-check fs-4"></i>
						장바구니 &raquo;
					</button>
				</div>
			  </div>
			</div>
		  </div>
	</div>



<jsp:include page="footer.jsp" />
<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</body>
</html>