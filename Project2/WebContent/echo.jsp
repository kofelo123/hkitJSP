<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="myEcho" class="MyEcho.Echo" scope="page"/>
<jsp:setProperty name="myEcho" property="msg"/>
<jsp:getProperty name="myEcho" property="msg"/>
<%
	out.print("Echo 빈즈에서 받은 내용 : " + myEcho.getMsg() + "<BR>");
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

</body>
</html>

