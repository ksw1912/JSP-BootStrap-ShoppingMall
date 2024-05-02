<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="productDAO" class="ProductInfo.ProductRepository"
	scope="application" />
<%@ page import="java.util.ArrayList"%>
<%@ page import="ProductInfo.Product" %>
<%@ page import="Order.OrderInfo" %>
<%
	String TotalProductId = request.getParameter("TotalProductId");
	String name = request.getParameter("name");
	String zipCode = request.getParameter("zipCode");
	String address = request.getParameter("address");
	
	Product product = productDAO.getProductById(TotalProductId);
%>
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
<title>주문확정페이지</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	
	<div class="container bg-body-secondary p-5 mt-5 py-4 rounded-5">
		<h3>상품 정보</h3>
		<div class="row">
			<div class="col-md-4">
				<img src="../img/1.jpg" class="img-fluid rounded-start" alt="...">
			</div>
			<div class="col-6">
				<p>
					<b>상품명 : </b><%=product.getPname()%> 
				</p>
				<p>
				버튼(옵션) : 
				</p>
				<p>
				가격 : <%=product.getUnitPrice()%>
				</p>
			</div>
		</div>
		<hr>
	</div>
	
	<div class="container bg-body-secondary p-5 mt-5 py-4 rounded-5">
		<h3>배송정보</h3>
		<form action="./processShippingInfo.jsp" class="form-horizontal"
			method="post">
			<div class="row g-0 bg-light overflow-hidden">
				<div class="d-flex flex-column justify-content-center">
					<div class="p-4" style="line-height: 3em">
						<div class="form-group row">
							<label class="col-sm-2">성명 :</label>
							<div class="col-sm-3">
								<p>
									<span class="badge text-bg-primary"><%=name%></span>
								</p>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">우편번호 :</label>
							<div class="col-sm-3">
								<p>
									<span class="badge text-bg-primary"><%=zipCode%></span>
								</p>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">주소 :</label>
							<div class="col-sm-5">
								<p>
									<span class="badge text-bg-primary"><%=address%></span>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>

	<div class="container bg-body-secondary p-5 mt-5 py-4 rounded-5">
		<h3>총 주문 가격</h3>
		<hr>
		<h5>
		<%=product.getUnitPrice()%>
		</h5>
	</div>

	<div class="container bg-body-secondary p-5 mt-5 py-4 rounded-5">
		<h3 class="text-primary text-uppercase">주문이 완료되었습니다</h3>
</div>


	<jsp:include page="footer.jsp" />
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>