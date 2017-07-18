<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	<B>이제 move.jsp로 이동합니다.</B><P>
	
	<%-- <jsp:forward page="move.jsp" /> --%>
	<%response.sendRedirect("http://www.naver.com"); %>
</body>
</html>