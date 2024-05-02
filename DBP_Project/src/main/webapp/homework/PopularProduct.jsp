<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="ProductInfo.Product"%>
<jsp:useBean id="productDAO" class="ProductInfo.ProductRepository"
	scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/styles.css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="../style.css" type="text/css">
<title>인기 상품</title>
</head>
<body>

	<jsp:include page="menu.jsp" />
	<jsp:include page="slide.jsp" />
	<div class="container px-4 py-5" id="custom-cards">
		<h2 class="pb-2 border-bottom">Popular Products</h2>
		<div class="row row-cols-1 row-cols-lg-3 align-items-stretch g-4 py-5">
			<%
			ArrayList<Product> listOfProducts = productDAO.getAllProducts();
			for (int i = 0; i < listOfProducts.size(); i++) {
				if (productDAO.productCondition("popular", i)) {
			%>
			<div class="col">
					<a href="productdetails.jsp" class="card card-cover h-100 overflow-hidden text-bg-dark rounded-4 shadow-lg"
						style="background-image: url('../img/1.jpg');" type="submit">
						<div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
							<h3 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold"><%=listOfProducts.get(i).getPname()%></h3>
							<ul class="d-flex list-unstyled mt-auto">
								<li class="me-auto"><img src="https://github.com/twbs.png"
									alt="Bootstrap" width="32" height="32"
									class="rounded-circle border border-white"></li>
								<li class="d-flex align-items-center me-3"><svg
										class="bi me-2" width="1em" height="1em">
									<use xlink:href="#geo-fill"></use></svg> <small>수량개수 : <%=listOfProducts.get(i).getUnitsInStock()%></small></li>
								<li class="d-flex align-items-center"><small>가격 : <%=listOfProducts.get(i).getUnitPrice()%>
								</small></li>
							</ul>
						</div>
					</a>
			</div>
			<%
			}
			}
			%>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
	<script>
	
	</script>
</body>
</html>