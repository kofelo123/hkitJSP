<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="info" scope="page" class="key.User" />

현재 값:
<jsp:getProperty name="info" property="name"/>
<jsp:getProperty name="info" property="num"/>

<br>
Form 으로부터 설정된 값:
<jsp:setProperty name="info" property="name"/>
<jsp:setProperty name="info" property="num"/>
<jsp:getProperty name="info" property="name"/>
<jsp:getProperty name="info" property="num"/>

<br>
직접 설정한 값 : 
<jsp:setProperty name="info" property="name" value="모짜르트" />
<jsp:setProperty name="info" property="num" value="123456" />
<jsp:getProperty name="info" property="name"/>
<jsp:getProperty name="info" property="num"/>


<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

</body>
</html>