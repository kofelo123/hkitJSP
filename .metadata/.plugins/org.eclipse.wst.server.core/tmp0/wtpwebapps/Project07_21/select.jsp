<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<%
	String id = request.getParameter("id");
	String password = request.getParameter("password").trim();
	String sql="select * from woori where id=?";
	Connection con = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	
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
		pst = con.prepareStatement(sql);
		pst.setString(1, id);
		
		rs = pst.executeQuery();
		
		if(!(rs.next())) {%>
			해당되는 회원이 없습니다.
		<% } else
		{
			if(password.equals(rs.getString("password"))) { %>
			사용자 ID가 <%= id %> 인 회원의 정보는 다음과 같습니다.
			정보를 변경하려면 내용을 입력한 다음 <수정하기> 버튼을 누르세요.
			<form name="form1" method="post" action="update.jsp">
			<input type="hidden" name="id" value="<%=id%>">
			<br>이름 :
			<input type="text" name="name" value="<%=rs.getString("name")%>">
			<BR>E-mail :
			<input type="text" name="email" value="<%=rs.getString("email")%>">
			<input type="submit" name="change" value="수정하기">
			<a href="delete.jsp?id=<%=id%>"> 삭제하기</a>
			</form>
			
			<% } else { %>
			비밀번호가 틀립니다.
			<% }
		}
		rs.close();
		con.close();
		pst.close();
		}catch(SQLException e){
			out.println(e);
	}

%>
<a href="main.html"> 메인으로</a>&nbsp;
<a href="select.html"> 조회페이지로</a>


