<%@ page contentType="text/html; charset=utf-8"%>
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
<title>상품 등록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />

	<div class="container-fluid mt-4 mb-4 text-center ">
		<div class="border border-start w-75 p-3">
			<form name="newProduct" action="./processAddProduct.jsp"
				class="form-horizontal" method="post">


				<img class="mb-4" src="/docs/5.2/assets/brand/bootstrap-logo.svg"
					alt="" width="72" height="57">
				<h1 class="h3 mb-3 fw-normal">상품 등록</h1>

				<div class="form-floating">
					<input type="text" class="form-control" name="productId"> <label
						for="floatingInput">상품 코드</label>
				</div>
				<div class="form-floating">
					<input type="text" class="form-control" name="name"> <label
						for="floatingInput">상품명</label>
				</div>
				<div class="form-floating">
					<input type="number" class="form-control" name="unitPrice"> <label
						for="floatingInput">가격</label>
				</div>
				<div class="form-floating">
					<input type="text" class="form-control" name="description">
					<label for="floatingInput">상세 정보</label>
				</div>
				<div class="form-floating">
					<input type="text" class="form-control" name="manufacturer">
					<label for="floatingInput">제조사</label>
				</div>
				<div class="form-floating">
					<input type="text" class="form-control" name="category"> <label
						for="floatingInput">분류</label>
				</div>
				<div class="form-floating">
					<input type="number" class="form-control" name="unitsInStock">
					<label for="floatingInput">재고 수</label>
				</div>


				<div class="form-group row mb-3 mt-3">
					<label class="col-sm-2 text-muted">상태</label>
					<div class="col-sm-5">
						<input type="radio" name="condition" value="New" class="text-muted"> Popular  
						<input
							type="radio" name="condition" value="Old" class="text-muted"> General <input
							type="radio" name="condition" value="Refurbished" class="text-muted"> New
					</div>
				</div>

				<button class="w-100 btn btn-lg btn-primary" type="submit">상품 등록</button>
				<p class="mt-5 mb-3 text-muted">© made-김서원</p>

			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
