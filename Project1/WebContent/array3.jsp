<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<style>
	td{
				
	}
</style>
<body>

<%
	int number[] = {1,2,3,4,5,6,7,8,9,10};

	String[] season = new String[] {"봄","여름","가을","겨울"};
	
	String [] fruit = new String[3];
	fruit[0] = "바나나";
	fruit[1] = "사과";
	fruit[2] = "키위";
	
%>

<table border="1">
	<tr>
		<th>좋아하는 숫자는
		<td><%=number[8] %>
	</tr>
	<tr>
		<th>좋아하는 계절은
		<td><%=season[0] %>
	</tr>
	<tr>
		<th>좋아하는 과일은
		<td><%=fruit[2] %>
	</tr>
	<tr>
		<th>배열 number[]의 길이는
		<td><%=number.length %>
	</tr>
</table>

</body>
</html>