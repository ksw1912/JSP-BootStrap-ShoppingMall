<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="UserInfo.User"%>
<jsp:useBean id="userDAO" class="UserInfo.UserRepository"
	scope="application" />

<%
	String name = request.getParameter("name");
	String id = request.getParameter("Id");
	String pw  =request.getParameter("Password");
	String tel = request.getParameter("tel");
	
	
	User user = new User(id,pw,name,tel);
	userDAO.addUser(user);

%>
<script>
	alert("가입되었습니다");
	location.href="./welcome.jsp";
</script>
