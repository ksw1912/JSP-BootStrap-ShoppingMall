<%@ page contentType="text/html; charset=utf-8"%>
<div class="container mt-4">
	<!--회전식-->
	<div id="demo" class="carousel slide" data-bs-ride="carousel">
		<!--표시기 /점-->
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#demo" data-bs-slide-to="0"
				class="active"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
		</div>
		<!-- 슬라이드 쇼/회전 목마 -->
		<div class="card text-bg-dark">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="card-img-top" src="../img/1.jpg" alt="Los Angeles"
						class="d-block w-100" width="900" height="200">
					<div class="card-img-overlay">
						<h5 class="card-title">Card 제목</h5>
						<p class="card-text">음 모로하지</p>
						<p class="card-text">
							<small>ㅇㅅㅇ</small>
						</p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="../img/1.jpg" alt="Chicago" class="d-block w-100" width="900"
						height="200">
				</div>
				<div class="carousel-item">
					<img src="../img/1.jpg" alt="New York" class="d-block w-100" width="900"
						height="200">
				</div>
			</div>
		</div>
	</div>
	<ul class="nav nav-pills mt-3">
		<li class="nav-item"><a class="nav-link active"
			aria-current="page" href="productinfo.jsp">모든 상품</a></li>
		<li class="nav-item"><a class="nav-link" href="PopularProduct.jsp">인기상품</a></li>
		<li class="nav-item"><a class="nav-link" href="#">새로운 상품</a></li>
	</ul>
</div>
