<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="loginId" scope="page" class="login.User" />
<jsp:setProperty name="loginId" property="*" />
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body style="background:#eef5a3">


<table border="1">
			<tr>
				<td colspan="2" align="center" style="background:#ad5537;color:white;font-weight:bold;"><jsp:getProperty name="loginId" property="name"/> 회원님이 작성하신 내용입니다. 확인해 주세요</td>
			</tr>
			<tr>
				<td style="width:150px;font-weight:bold;" >아이디</td>
				<td><%= loginId.getId() %></td>
			</tr>
			<tr>
				<td style="font-weight:bold;">패스워드</td>
				<td><%= loginId.getPw() %></td>
			</tr>
			<tr>
				<td style="font-weight:bold;">이름</td>
				<td><%= loginId.getName() %></td>
			</tr>
			<tr>
				<td style="font-weight:bold;">이메일</td>
				<td><%= loginId.getEmail() %></td>
			</tr>
			<tr>
				<td style="font-weight:bold;">전화번호</td>
				<td><%= loginId.getCall() %></td>
			</tr>
			<tr>
				<td colspan="2" style="padding-left:20%;"><input type="button"  value="확인완료" onClick="self.close()">&nbsp;&nbsp;<input
					type="reset" value="다시쓰기" onClick="this.href=history.back();"></td>
			</tr>
		</table>
		
	
		
</body>
</html>