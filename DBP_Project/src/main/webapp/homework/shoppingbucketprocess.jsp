<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="ProductInfo.Product" %>
<jsp:useBean id="productDAO" class="ProductInfo.ProductRepository" scope="application" />
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("productId");
	ArrayList<String> productBucket  = new ArrayList<>();
	
	if (!productBucket.contains(id) && productDAO.productExist(id)) {
            productBucket.add(id);
            session.setAttribute("productBucket", productBucket); // 세션에서 장바구니 변경
    }
	
	session.setAttribute("bucketCount", productBucket.size());
%>

<c:redirect url="productinfo.jsp" />