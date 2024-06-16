<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Manage</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="homework/style.css" type="text/css">

</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="contaier-fluid">
		<div class="row">
			<jsp:include page="dashboard.jsp" />
			<div class="col-md-9 ms-sm-auto col-lg-10 px-md-4 my-3">
				<h2>회원 목록</h2>
				<div class="list-group overflow-x-auto">
					<div
						class="list-group-item d-flex justify-content-between align-items-center bg-light ">
						<span class="flex-grow-1 text-center">회원명</span> <span
							class="flex-grow-1 text-center">회원아이디</span> <span
							class="flex-grow-1 text-center">비밀번호</span> <span
							class="flex-grow-1 text-center">전화번호</span>

					</div>
					<c:forEach var="u" varStatus="i" items="${users}">
						<a
							href="/DBP_Project/productController?action=manageUpdateUser&userId=${u.id}"
							class="list-group-item list-group-item-action  d-flex justify-content-between align-items-center"
							aria-current="true"> <span class="form-check"> <input
								class="form-check-input flex-shrink-0 product-checkbox"
								type="checkbox" value="${u.id}" id="flexCheckDefault${i.count}">
						</span> <span class="flex-grow-1 text-center">${u.name}</span> <span
							class="flex-grow-1 text-center">${u.id}</span> <span
							class="flex-grow-1 text-center">${u.pw}</span> <span
							class="flex-grow-1 text-center">${u.number}</span>
						</a>
					</c:forEach>
				</div>
				<div class="mt-3">
					<button type="button" class="btn btn-outline-secondary btn-sm"
						onclick="addProduct()">
						<i class="bi bi-database-fill-add"></i> 추가
					</button>
					<!-- <button type="button" class="btn btn-outline-secondary btn-sm"
						onclick="deleteSelectedUsers()">
						<i class="bi bi-trash-fill"></i> 삭제
					</button>
					 -->
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
<script>
	function addProduct() {
		window.location.href = '/DBP_Project/productController?action=join';
	}

	function deleteSelectedUsers() {
		var form = document.createElement("form");
		form.method = "POST";
		form.action = "/DBP_Project/productController?action=processUpdateUser";

		var productCheckboxes = document.querySelectorAll(".product-checkbox");
		productCheckboxes.forEach(function(checkbox) {
			if (checkbox.checked) {
				var input = document.createElement("input");
				input.type = "hidden";
				input.name = "userIds";
				input.value = checkbox.value;
				form.appendChild(input);
			}
		});

		document.body.appendChild(form);
		form.submit();
	}
</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</html>
