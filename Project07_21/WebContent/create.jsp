<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
	Connection conn = null;
	Statement st = null;
	ResultSet rs = null;
	String a =null;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		 
	}catch(ClassNotFoundException e){
		out.println(e);
	}
	
	try{
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hkit_jsp","hkitJeongwon","gj0123");
	}catch(SQLException e){
		out.println(e);
	}

	try{
		st = conn.createStatement();
		st.executeUpdate("create table woori(id char(10) primary key, name char(10))");
	}catch(SQLException e){
		out.println(e);
	}
	
	try{
		rs=st.executeQuery("select * from woori");
		ResultSetMetaData rsmd = rs.getMetaData();
		out.println("새로운  테이블이 생성되었습니다.<BR>");
		out.println(rsmd.getColumnCount()+"개의 컬럼(필드)을 가지고 있으며<BR>");
		out.println("첫번쨰 칼럼은 "+ rsmd.getColumnName(1)+"<BR>");
		out.println("두번쨰 칼럼은 "+ rsmd.getColumnName(2)+"<BR>");
		rs.close();
		st.close();
		conn.close();
	}catch(SQLException e){
		out.println(e);
	}


%>
<a href=main.html>main으로</a>