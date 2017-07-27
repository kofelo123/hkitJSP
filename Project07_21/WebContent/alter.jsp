<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
	Connection conn = null;
	Statement st = null;
	ResultSet rs = null;
	String a = null;
	
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
		st.executeUpdate("ALTER TABLE woori	CHANGE COLUMN name name CHAR(20) NOT NULL");
		st.executeUpdate("alter table woori add password integer");
		st.executeUpdate("alter table woori add email char(30)");
	}catch(SQLException e){
		out.println(e);
	}
	
	try{
		rs = st.executeQuery("select * from woori");
		ResultSetMetaData rsmd = rs.getMetaData();
		out.println("테이블이 수정되었습니다.<BR>");
		out.println(rsmd.getColumnCount()+"개의 컬럼(필드)을 가지고 있으며<BR>");
		for(int i=1; i<=rsmd.getColumnCount();i++){
			out.println(i+"번쨰 칼럼은 " + rsmd.getColumnName(i));
			out.println("이고 유형은 "+ rsmd.getColumnTypeName(i));
			out.println("이며 크기는 "+ rsmd.getPrecision(i)+"<BR>");
			
		}
		rs.close();
		st.close();
		conn.close();
	}catch(SQLException e){
		out.println(e);
	}
%>
<a href=main.html>main 으로</a>