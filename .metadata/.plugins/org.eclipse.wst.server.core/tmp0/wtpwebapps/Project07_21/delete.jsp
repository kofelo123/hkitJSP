<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
	String id = request.getParameter("id");
	Connection con = null;
	Statement st = null;
	String sql = null;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
	}catch(ClassNotFoundException e){
		out.println(e.getMessage());
	}
	
	try{
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hkit_jsp","hkitJeongwon","gj0123");
		
		st = con.createStatement();
		sql = "delete from woori where id= '" + id + "'";
		st.executeUpdate(sql);
			
		con.close();
		st.close();
		
	}catch(SQLException e){
		
	}
%>
<jsp:forward page="selectall.jsp" />