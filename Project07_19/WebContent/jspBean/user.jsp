<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="info" scope="page" class="key.User" /> 
<jsp:setProperty name="info" property="name" />
<jsp:setProperty name="info" property="num" /> 
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<center>
	<table border="0" width="300">
		<form method="POST">
			<tr>
				<th bgcolor=#996699 colspan=2>
					<font color=whitd size=+1>JSP Bean테스트</font>
				</th>
			</tr>
			<tr>
				<th width=20% bgcolor=#BB6699 width=40%>
					<font color="white" size=-1>이름</font>
				</th>
				<td bgcolor=#99ccff width=60%>
					<input type="text" name="name" value=<%=info.getName()%> size=10>
				</td>
			</tr>
			<tr>
				<th width="40%" bgcolor=#BB6699 >
					<FONT color="white" size="-1">학번</FONT>
			<TD bgcolor=#99ccff>
				<input type="text" name="num" value=<%=info.getNum() %> size=10>
			</TD>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="보내기">
					<input type="reset" value="다시쓰기">
				</td>
			</tr>
		</form>
	</table>
	</center>
	<jsp:include page="setget.jsp" />
</body>
</html>