<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
	String admPwd = "manager";
	String password =request.getParameter("password");
	if(admPwd.equals(password))
		response.sendRedirect(response.encodeRedirectURL("select_all.jsp"));
	else{
%>
<script>alert("인증이 허용된 사람만 가능 핳ㅂ니다. 확인 버튼을 누르세요.!");
</script>
<!DOCTYPE html>
<html>
<head>
<title>우리 회원 정보관리</title>
</head>
<body>
	<table width="500" border="1" bordercoorlight="#999999" bordercolordark="#FFFFFF" cellpadding="3" cellspacing="0" align="center" class="style2">
		<th background="image/sky_bar.gif">관리자승인</th>
		<tr>
			<td align="center">
				<form name="form1" method="post" action="admin.jsp">
					<br>관리자 비밀번호 :
					<input type="password" name="password">
					<p>
					<input type="submit" name="change" value="확인" >&nbsp;
					<input type="button" value="취소" onClick="javascript:history.go(-1);">
				</form>
				</td>
				</tr>
				<tr>
					<td algin="center">Copyright by Jeongwon JSP STUDY</td>
				</tr>
	</table>

</body>
</html>
<%}%>