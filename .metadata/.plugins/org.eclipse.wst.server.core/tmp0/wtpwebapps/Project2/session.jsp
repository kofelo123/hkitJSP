<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%= session.getId() %><br>
	<%= session.getCreationTime() %><br>
	<%= session.getLastAccessedTime() %><br>
	<% session.setMaxInactiveInterval(180); %>
	<%= session.getMaxInactiveInterval() %><br>
	
</body>
</html>