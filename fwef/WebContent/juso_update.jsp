<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*,java.text.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
String sql=null;
Connection con= null;
PreparedStatement st =null;
int cnt=0;

int id = Integer.parseInt(request.getParameter("id"));
System.out.println(id);
String name = request.getParameter("name");
String phonenum = request.getParameter("phonenum");
String email = request.getParameter("email");
String birthday = request.getParameter("birthday");
String company = request.getParameter("company");
String memo = request.getParameter("memo");



try {
	Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {
	out.println(e);
}

try {
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/addr","hkitJeongwon","gj0123"); 
} catch (SQLException e) {
	out.println(e);
}

try {
		sql = "update addrbook set name=?, phonenum=?, birthday=?, company=?, memo=?, email=? where id=?";
	    st = con.prepareStatement(sql);
	    st.setString(1, name);
	    st.setString(2, phonenum);
	    st.setString(3, birthday);
		st.setString(4, company);
		st.setString(5, memo);
		st.setString(6, email);
	    st.setInt(7, id);
		  cnt = st.executeUpdate(); 
		    if (cnt >0) 
		     out.println("정상적으로 수정되었습니다.");
		    else
		     out.println("수정되지 않았습니다.");
		  
		   
		  st.close();
		  con.close();
		 } catch (SQLException e) {
		  out.println(e);
		 } 
	response.sendRedirect("main.jsp");
%>
