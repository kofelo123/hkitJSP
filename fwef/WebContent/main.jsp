<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*,java.text.*"%>
<% request.setCharacterEncoding("UTF-8"); %>  
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

</head>
<body>
<center> 

<h1>주소록 : 목록화면</h1><br>

<A href="juso.html">주소록 등록</A>

<br><br>

<table width="600" cellspacing="0"  border=1>
<tr>
<th width=15%>번호</th>
<th width=15%>이름</th>
<th width=25%>전화번호</th>
<th width=15%>생일</th>
<th width=15%>회사</th>
<th width=15%>메모</th>
</tr>

<%
Connection con = null;
Statement st =null;
ResultSet rs =null;

try{ 
	Class.forName("com.mysql.jdbc.Driver"); 
}catch(ClassNotFoundException e){ 
out.println(e); 
} 
 
try{ 
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/addr","hkitJeongwon","gj0123");
}catch(SQLException e) {
	out.println(e);
}
try{
	st =con.createStatement();
	String sql ="select * from addrbook order by id desc";  
	rs = st.executeQuery(sql);
	if(!rs.next()){
		out.println("-------------------");
	}else {
		do{
			out.println("<tr>");
			out.println("<th width=15% >");
			%>
			<A href=juso_read.jsp?id=<%= rs.getInt("id")%>><%=rs.getInt("id") %></a></th>
			<%
			out.println("<th width=15% >");
			out.println(rs.getString("name")+"</th>");
			out.println("<th width=15% >");
			out.println(rs.getString("phonenum")+"</th>");
			out.println("<th width=15% >");
			out.println(rs.getString("birthday")+"</th>");
			out.println("<th width=15% >");
			out.println(rs.getString("company")+"</th>");
			out.println("<th width=15% >");
			out.println(rs.getString("memo")+"</th>");
			out.println("</tr>");
		}while(rs.next());
		
	}
	rs.close();
	st.close();
	con.close();
}catch(SQLException e) {
	out.println(e);
}
%>
</table>
</center>
</body>
</html>