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
<title>구매정보 및 배송상태</title>
</head>
<body>

	<jsp:include page="menu.jsp" />
	<jsp:include page="slide.jsp" />
	<div
		class="hero d-flex flex-column align-items-center justify-content-center text-center">
		<div class="container mt-3 mb-5">
			<h1>구매정보 및 배송상태</h1>
			<div class="list-group overflow-x-auto mt-3">
				<div
					class="list-group-item d-flex justify-content-between align-items-center bg-light px-3">
					<span class="ml-3 grow-1 text-center">주문코드</span> <span
						class="grow-1 text-center ">상품명</span> <span
						class="grow-1 text-center me-5">개수</span> <span
						class="grow-1 text-center me-5 mx-3">배송상태</span> <span
						class="grow-1 text-center me-5">구매 날짜</span>
				</div>
				<c:forEach var="orderInfo" items="${orderlist}">
                    <c:forEach var="orderDetail" items="${orderInfo.orderDetails}">
                        <a
                            href="/DBP_Project/productController?action=productdetails&productId=${orderDetail.productId}"
                            class="list-group-item list-group-item-action d-flex justify-content-between align-items-center"
                            aria-current="true">
                            <span class="ml-3 grow-1 text-center">${orderDetail.orderId}</span>
                            <span class="grow-1 text-center ">${orderDetail.productId}</span> 
                            <span class="grow-1 text-center ">${orderDetail.productCount}</span> 
                            <span class="grow-1 text-center ">${orderDetail.orderStatus}</span>
                            <span class="grow-1 text-center mx-4">${orderInfo.orderDate}</span>
                        </a>
                    </c:forEach>
                </c:forEach>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>