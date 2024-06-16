<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="py-2 bg-light border-bottom">
	<div class="container d-flex flex-wrap">
		<ul class="nav me-auto">
			<li class="nav-item"><a
				href="/DBP_Project/productController?action=welcome"
				class="nav-link link-dark px-2 active" aria-current="page">Home</a></li>
			<c:choose>
				<c:when test="${empty sessionName}">
					<li class="nav-item"><a
						href="/DBP_Project/productController?action=login"
						class="nav-link link-dark px-2">All Product</a></li>
					<li class="nav-item"><a
						href="/DBP_Project/productController?action=login"
						class="nav-link link-dark px-2">Popular</a></li>
					<li class="nav-item"><a
						href="/DBP_Project/productController?action=login"
						class="nav-link link-dark px-2">New Item</a></li>
				</c:when>

				<c:otherwise>
					<li class="nav-item"><a
						href="/DBP_Project/productController?action=productInfo"
						class="nav-link link-dark px-2">All Product</a></li>
					<li class="nav-item"><a
						href="/DBP_Project/productController?action=popular"
						class="nav-link link-dark px-2">Popular</a></li>
					<li class="nav-item"><a
						href="/DBP_Project/productController?action=new"
						class="nav-link link-dark px-2">New Item</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
		<ul class="nav">
			<c:choose>
				<c:when test="${empty sessionName}">
					<li class="nav-item"><a
						href="<c:url value="/productController?action=login"/>"
						class="nav-link link-dark px-2">로그인 </a></li>
				</c:when>
				<c:otherwise>
					<li class="nav-item">
						<div class="dropdown">
							<a class="nav-link link-dark px-2" role="button"
								id="dropdownMenuLink" data-bs-toggle="dropdown"
								aria-expanded="false"> <i class="bi bi-basket3-fill"></i>
								장바구니
							</a>
							<ul class="dropdown-menu" aria-labelledby="dropdown-menu">
								<c:if test="${not empty carts}">
									<c:forEach var="c" items="${carts}">
										<li class="dropdown-item"><a class="dropdown-item"
											href="#"><img
												src="${pageContext.request.contextPath}/images/${c.product.productImg}"
												class="img" width="130" height="130"> <b>${c.product.productId}</b>
												<span class="text-end justify-content-end"> <br>
													<p class="text-end">
														<b>수량 : ${c.cartInCount}</b>
													</p>
											</span> </a></li>
									</c:forEach>
								</c:if>
							</ul>
						</div>
					</li>
					<li style="padding-top: 7px; color: blue"><a
						href="/DBP_Project/productController?action=pwModify"
						class="icon-link icon-link-hover"
						style="--bs-icon-link-transform: translate3d(0, -.125rem, 0);"><i
							class="bi bi-person-circle "></i> ${sessionName}</a>님 환영합니다</li>
					<li class="nav-item"><a
						href="<c:url value="/productController?action=processLogOut"/>"
						class="nav-link link-dark px-2">로그아웃</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</nav>

<header class="py-3 border-bottom shadow-lg">
	<div class="container">
		<a href="/DBP_Project/productController?action=welcome"
			class="align-items-center mb-3 mb-lg-0 me-lg-auto text-dark text-decoration-none">
			<span class="fs-2"> <i class="bi bi-windows"
				style="color: ffe4e1;"></i> Hs Store
		</span>
		</a> <a class="btn btn-primary float-end shadow-sm"
			style="color: #ffe4e1;" data-bs-toggle="offcanvas"
			href="#offcanvasExample" role="button"
			aria-controls="offcanvasExample"> Menu </a>
	</div>
</header>

<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasExample"
	aria-labelledby="offcanvasNavbarLabel">
	<div class="offcanvas-header">
		<h5 class="offcanvas-title" id="offcanvasNavbarLabel">ShoppingMall
			Menu</h5>
		<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
			aria-label="Close"></button>
	</div>
	<c:choose>
		<c:when test="${empty sessionName}">

			<div class="offcanvas-body">
				<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page"
						href="/DBP_Project/productController?action=welcome">Home</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Shop </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item"
								href="/DBP_Project/productController?action=login">모든
									상품</a></li>
							<li>
								<hr class="dropdown-divider" />
							</li>
							<li><a class="dropdown-item"
								href="/DBP_Project/productController?action=login">인기 있는
									상품</a></li>
							<li><a class="dropdown-item" href="#!">새로운 상품</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page"
						href="/DBP_Project/productController?action=login">구매정보
							및 배송 상태</a></li>
		</c:when>



		<c:otherwise>


			<div class="offcanvas-body">
				<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page"
						href="/DBP_Project/productController?action=welcome">Home</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Shop </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item"
								href="/DBP_Project/productController?action=productInfo">모든
									상품</a></li>
							<li>
								<hr class="dropdown-divider" />
							</li>
							<li><a class="dropdown-item"
								href="/DBP_Project/productController?action=popular">인기 있는
									상품</a></li>
							<li><a class="dropdown-item" href="#!">새로운 상품</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page"
						href="/DBP_Project/productController?action=userPurchaseInfo">구매정보
							및 배송 상태</a></li>
		</c:otherwise>



	</c:choose>



	<hr>
	<c:if test="${sessionId == 'admin'}">
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			href="#" role="button" data-bs-toggle="dropdown"
			aria-expanded="false"> <i class="bi bi-hammer"></i> ManageMode
		</a>
			<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
				<li>&nbsp;ManageMode</li>
				<li>
					<hr class="dropdown-divider" />
				</li>
				<li><a href="/DBP_Project/productController?action=manage"
					class="dropdown-item"><i class="bi bi-card-list"></i> Product
						Manage</a></li>
				<li><a
					href="/DBP_Project/productController?action=manageMember"
					class="dropdown-item"><i class="bi bi-person-lines-fill"></i>
						Member Manage</a></li>
				<li><a
					href="/DBP_Project/productController?action=managePurchase"
					class="dropdown-item"><i class="bi bi-bag-fill"></i> purchase
						Manage</a></li>
			</ul></li>
	</c:if>
	</ul>
</div>
</div>

