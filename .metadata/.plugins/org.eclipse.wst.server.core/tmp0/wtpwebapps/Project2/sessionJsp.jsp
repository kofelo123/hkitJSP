<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	<h3>session 테스트</h3>
	<%
		session = request.getSession();
		session.putValue("id", "admin");
		session.putValue("pw", "12345");
		
	%>
		
	<a href="test2.jsp">새화면열기</a>	
	

</body>
</html>