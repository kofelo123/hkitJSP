<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String id = request.getParameter("id");
	int password = Integer.parseInt(request.getParameter("password"));
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String sql = null;
	Connection conn = null;
	Statement st = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	int cnt = 0;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
	}catch(ClassNotFoundException e){
		out.println(e.getMessage());
	}
	
	try{
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hkit_jsp","hkitJeongwon","gj0123");
		st= conn.createStatement();
		rs= st.executeQuery("select * from woori where id = '"+id +"'");
		
		if(!(rs.next())){
			
			sql = "insert into woori values(?,?,?,?)";
			
			pst=conn.prepareStatement(sql);
			
			pst.setString(1, id);
			pst.setString(2, name);
			pst.setInt(3, password);
			pst.setString(4, email);
			
			cnt = pst.executeUpdate();
			/* st=conn.createStatement();
			sql="insert into woori(id,password,name,email)";
			sql=sql+" values('"+ id +"',"+ password + ",";
			sql=sql+ "'"+ name +"','"+ email +"')";
			cnt = st.executeUpdate(sql); */
			if(cnt >0)
				out.println("데이터가 성공적으로 입력되었습니다.");
			else
				out.println("데이터가 입력되지 않았습니다.");
		}else
			out.println("id가 이미 등록되어 있습니다.");
		
		pst.close();
		st.close();
		conn.close();
			
		}catch(SQLException e){
			out.println(e.getMessage());
	}
%>
[<a href="main.html"> main으로</a>]
&nbsp;[<a href="insert.html">회원 등록 페이지로</a>]