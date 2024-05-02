<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="UserInfo.User" %>
<jsp:useBean id="ul" class="UserInfo.UserRepository" scope="application" />
<%
	String sessionName = (String) session.getAttribute("sessionName"); 
	String pw_moidfy = request.getParameter("pw_modify");
 	User user = ul.getUserinfo(sessionName);
 	user.setPw(pw_moidfy);
%>	
<script>
alert("수정되었습니다");
location.href="welcome.jsp";
</script>