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
<title>구매완료페이지</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="container mt-3 text-center">
		<h3 class="display-5 fw-bolder">구매 완료되었습니다</h3>
		<h5 class="fw-bolder">Thank you</h5>
	</div>
	<div class="container mt-4 p-1 mb-4 text-center">
		<button type="button" class="btn btn-outline-primary btn-lg" onclick="window.location.href='/DBP_Project/productController?action=productInfo'">쇼핑 더하기</button>
		<button type="button" class="btn btn-outline-primary btn-lg" onclick="window.location.href='/DBP_Project/productController?action=welcome'">처음 페이지</button>
	</div>
	<jsp:include page="footer.jsp" />
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>