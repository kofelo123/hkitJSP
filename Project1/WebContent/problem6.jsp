<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

	<%
		int odd=0,even=0;//홀수,짝수
		for(int i=1;i<=100;i++){
			if(i%2==0){
				even+=i;
			}else
				odd+=i;
				
		}
	%>

	<table border="1">
	<tr>
		<td colspan="2" style="text-align:center">결과는..</td>
	</tr>
	<tr>
	<td>짝수의 합은 <%=even %>입니다.</td>
	<td>홀수의 합은 <%=odd %>입니다.</td>
	</tr>		
	</table>

</body>
</html>