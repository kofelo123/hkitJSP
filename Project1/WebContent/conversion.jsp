<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<%!
	public float show(float f){
		return f;
	}

	public float devide(){
		int a=10, b=5, c;
		c=a/b;
		return c;
	}
%>

	

<%= "show() 메서드의 호출 결과는 : " + show(5)  %>
<%= "<br>devide() 메서드의 호출 결과는 : " + devide() %>
</body>
</html>