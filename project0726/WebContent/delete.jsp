<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
	Object mem_id = session.getAttribute("member_id");
	session.putValue(session.getId(), mem_id);
	String userid = (String)session.getValue(session.getId());
	if(userid == null)
		session.putValue(session.getId(), mem_id);
		userid = (String)session.getValue(session.getId());
		if(userid == null)
			session.putValue(session.getId(), mem_id);
			userid = (String)session.getValue(session.getId());
			Connection con = null;
			Statement st = null;
			String sql = null;
			
			try{
				Class.forName("com.mysql.jdbc.Driver");
			}catch(ClassNotFoundException e){
				out.println(e.getMessage());
			}
			
			try{
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/member","hkitJeongwon","gj0123");
				st = con.createStatement();
				sql = "delete from member where userid= '" + userid + "'";
				st.executeUpdate(sql);
				con.close();
				st.close();
			}catch(SQLException e){
				out.println(e);
			}
			session.invalidate();//세션삭제
%>

<jsp:forward page="left_Frame.jsp" />