<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	String sql = null;
	Connection con = null;
	Statement st= null;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
	}catch(ClassNotFoundException e){
		out.println(e.getMessage());
	}
	
	try{
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hkit_jsp","hkitJeongwon","gj0123");		
	}catch(SQLException e){
		out.println(e);
	}
	
	try{
		st=con.createStatement();
		
		sql="update woori set " ;
		sql = sql + "name ='" + name + "'," + " email = '" + email + "'";
		sql = sql + " where id = '" + id + "'" ;
		st.executeUpdate(sql);
		con.close();
		st.close();
	}catch(SQLException e){
		out.println(e);
	}
%>
<jsp:forward page="selectall.jsp" />