<%@ page contentType="text/html; charset=utf-8"%>
<div id="myCarousel" class="carousel slide mb-6 h-50"
	data-bs-ride="carousel">
	<div class="carousel-indicators">
		<button type="button" data-bs-target="#myCarousel"
			data-bs-slide-to="0" class="" aria-label="Slide 1"></button>
		<button type="button" data-bs-target="#myCarousel"
			data-bs-slide-to="1" aria-label="Slide 2" class="active"
			aria-current="true"></button>
		<button type="button" data-bs-target="#myCarousel"
			data-bs-slide-to="2" aria-label="Slide 3" class=""></button>
	</div>
	<div class="carousel-inner">
		<div class="carousel-item">
			<img src="homework/img/1.jpg" class="d-block w-100" width="100%"
				height="100%" alt="...">
			<div class="container">
				<div class="carousel-caption">
					<h1>ALL Products</h1>
					<p>All Products</p>
					<p>
						<a class="btn btn-lg btn-outline-light"
							href="/DBP_Project/productController?action=productInfo">Views</a>
					</p>
				</div>
			</div>
		</div>
		<div class="carousel-item active">
			<img src="homework/img/1.jpg" class="d-block w-100" width="100%"
				height="100%" alt="...">
			<div class="container">
				<div class="carousel-caption">
					<h1>Popular Products</h1>
					<p>Popular Products</p>
					<p>
						<a class="btn btn-lg btn-outline-light"
							href="/DBP_Project/productController?action=popular">Views</a>
					</p>
				</div>
			</div>
		</div>
		<div class="carousel-item">
			<img src="homework/img/1.jpg" class="d-block w-100" width="100%"
				height="100%" alt="...">
			<div class="container">
				<div class="carousel-caption">
					<h1>NEW Products</h1>
					<p>NEW Products</p>
					<p>
						<a class="btn btn-lg btn-outline-light"
							href="/DBP_Project/productController?action=new">Views</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<button class="carousel-control-prev" type="button"
		data-bs-target="#myCarousel" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Previous</span>
	</button>
	<button class="carousel-control-next" type="button"
		data-bs-target="#myCarousel" data-bs-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Next</span>
	</button>
</div>