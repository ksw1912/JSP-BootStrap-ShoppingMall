<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String sessionName = (String) session.getAttribute("sessionName");

//String bucketCount = (String) session.getAttribute("bucketCount");
%>
<nav class="py-2 bg-light border-bottom">
	<div class="container d-flex flex-wrap">
		<ul class="nav me-auto">
			<li class="nav-item"><a href="./welcome.jsp"
				class="nav-link link-dark px-2 active" aria-current="page">Home</a></li>
			<c:choose>
				<c:when test="${empty sessionName}">
					<li class="nav-item"><a href="./login.jsp"
						class="nav-link link-dark px-2">All Product</a></li>
					<li class="nav-item"><a href="./login.jsp"
						class="nav-link link-dark px-2">Popular</a></li>
					<li class="nav-item"><a href="./login.jsp"
						class="nav-link link-dark px-2">New Item</a></li>
				</c:when>
				<c:otherwise>
					<li class="nav-item"><a href="./productinfo.jsp"
						class="nav-link link-dark px-2">All Product</a></li>
					<li class="nav-item"><a href="#"
						class="nav-link link-dark px-2">Popular</a></li>
					<li class="nav-item"><a href="#"
						class="nav-link link-dark px-2">New Item</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
		<ul class="nav">
			<c:choose>
				<c:when test="${empty sessionName}">
					<li class="nav-item"><a href="<c:url value="./login.jsp"/>"
						class="nav-link link-dark px-2">로그인 </a></li>
				</c:when>
				<c:otherwise>
					<li class="nav-item"><a href="#"
						class="nav-link link-dark px-2"> <i class="bi bi-basket3-fill"></i>
							장바구니
					</a></li>
					<li style="padding-top: 7px; color: blue"><a href="./pw_modify.jsp"> <%=sessionName%></a>님
						환영합니다</li>
					<li class="nav-item"><a
						href="<c:url value="./processLogout.jsp"/>"
						class="nav-link link-dark px-2">로그아웃</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</nav>



<header class="py-3 mb-4 border-bottom">
	<div class="container">
		<a href="./welcome.jsp"
			class="align-items-center mb-3 mb-lg-0 me-lg-auto text-dark text-decoration-none">
			<span class="fs-2"> <i class="bi bi-windows"
				style="color: ffe4e1;"></i> Hs Store
		</span>
		</a> <a class="btn btn-primary float-end" style="color: #ffe4e1;" data-bs-toggle="offcanvas" href="#offcanvasExample"
			role="button" aria-controls="offcanvasExample"> Menu </a>
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
	<div class="offcanvas-body">
		<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
			<li class="nav-item"><a class="nav-link active"
				aria-current="page" href="./welcome.jsp">Home</a></li>
			<li class="nav-item"><a class="nav-link" href="./addProduct.jsp">AddProduct</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" role="button"
				data-bs-toggle="dropdown" aria-expanded="false"> Shop </a>
				<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item"
						href="<c:url value="./productinfo.jsp"/>">모든 상품</a></li>
					<li>
						<hr class="dropdown-divider" />
					</li>
					<li><a class="dropdown-item" href="PopularProduct.jsp">인기 있는 상품</a></li>
					<li><a class="dropdown-item" href="#!">새로운 상품</a></li>
				</ul></li>
		</ul>
	</div>
</div>



