<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<%
	Connection con = null;
	Statement st = null;
	ResultSet rs = null;
	String a = null;

	try {
		Class.forName("com.mysql.jdbc.Driver");

	} catch (ClassNotFoundException e) {
		out.println(e);
	}

	try {
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hkit_jsp", "hkitJeongwon", "gj0123");
	} catch (SQLException e) {
		out.println(e);
	}
	
	try{
		st = con.createStatement();
		rs = st.executeQuery("select * from woori order by id");
	
%>

	<html>
		<body>
			<center>
				<table border="1">
					<tr>
						<th>사용자 ID</th>
						<th>이름</th>
						<th>E-mail</th>
					</tr>
					<% if (!(rs.next())) { %>
						<TR><TD colspan=4> 등록된 회원이 없습니다.</TD></TR>
					<% }else{
						do{
							out.println("<TR>");
							out.println("<TD>" + rs.getString("id") + "</TD>");
							out.println("<TD>" + rs.getString("name") + "</TD>");
							out.println("<TD>" + rs.getString("email") + "</TD>");
							out.println("</TR>");
						}while(rs.next());
					}
					rs.close();
					st.close();
					con.close();
	}catch(SQLException e){
		System.out.println(e);
	}
					%>
	
				</table>
				[<a href="main.html">main으로</a>]&nbsp;[<a href="insert.html">회원 등록페이지로</a>]
			</center>
		</body>
	</html>