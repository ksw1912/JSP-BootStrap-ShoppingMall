<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
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
<title>ShoppingMall</title>
</head>
<body>
	<jsp:include page="menu.jsp" />

	<div class="container-fluid">
		<div class='box'>
			<div class='wave -one'></div>
			<div class='wave -two'></div>
			<div class='wave -three'></div>
			<div class='title'>Welcome to Hs Shopping Mall!</div>
			<%!int pageCount = 0;

	void addCount() {
		pageCount++;
	}%>
			<%
			addCount();
			%>
			<div class='small-title'>
				이 사이트 방문자로는 <span style="color: white"> <%=pageCount%>
				</span> 번째 입니다.
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp" />
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>