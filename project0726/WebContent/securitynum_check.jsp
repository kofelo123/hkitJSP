<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  errorPage="error.jsp" import="java.sql.*,java.io.*,java.net.*"%>

<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String securitynum = request.getParameter("securitynum");
	String query = new String();
	
	int check_count = 0;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
	}catch(ClassNotFoundException e){
		out.println(e);
	}
	
	try{
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/member","hkitJeongwon","gj0213");
		stmt= conn.createStatement();
		
		query="select count(*) as count from member where securitynum='" + securitynum + "'";
		rs = stmt.executeQuery(query);
		rs.next();
		check_count = rs.getInt("count");
		rs.close();
		conn.close();
	}catch(SQLException e){
	}finally{
		
	}
%>
<!DOCTYPE html>
<html>
<head>
<title>주민등록번호 중복검사</title>
</head>
<body text="#000000" bgcolor="#FFFFFF">
<br/>
<br/>
<table width="300" border="1" height="40" bordercolorlight="#999999" bordercolordark="#FFFFFF" cellpadding="3" cellspacing="0" align="center" class="style1">
	<tr>
		<td>
		<%
			if(check_count > 0){
		%>
			[<%=securitynum%>]은 등록되어있는 주민등록번호 입니다.
		<%
			}else{
		%>
			[<%=securitynum%>]은 사용 가능합니다.
		<%
			}
		%>
		</td>
	</tr>
</table>
<br/>
<table width="300" border="0" cellspacing="3" cellpadding="0" algiin="center">
	<tr>
		<td align="center">
			<input type="button" value="확인" onClick="self.close()" class="oneborder">
		</td>
	</tr>
</table>

</body>
</html>