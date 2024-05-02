<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="UserInfo.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="ul" class="UserInfo.UserRepository"
		scope="application" />

	<%
		// request 정보 확인
		request.setCharacterEncoding("utf-8");
		String r_id = request.getParameter("id");
		String r_pw = request.getParameter("password");
		User user = ul.getUserById(r_id,r_pw);
	%>


	<% 
	if (user != null) {
		String name = user.getName();
	 session.setAttribute("sessionName",name); 
	 response.sendRedirect("welcome.jsp");
	} 
	else {
	%>
	<script>
		alert("계정이 존재하지 않습니다");
		location.href="login.jsp";
	</script>
	<% 
		}
		%>

</body>
</html>