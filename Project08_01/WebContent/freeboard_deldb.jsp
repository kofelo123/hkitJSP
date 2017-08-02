<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
[<a href="freeboard_list.jsp?go=<%=request.getParameter("page") %>">게시판 목록으로</a>]
<%
	String sql= null;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs= null;
	int cnt= 0;
	
	int id = Integer.parseInt(request.getParameter("id"));
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
	}catch(ClassNotFoundException e){
		out.println(e);
	}
	
	try{
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/member","hkitJeongwon","gj0123");
		
	}catch(SQLException e){
		out.println(e);
	}
	
	try{
		sql = "select * from freeboard where id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, id);
		rs = pstmt.executeQuery();
		if(!(rs.next())){
			out.println("해당 내용이 없습니다.");
		}else{
			String pwd= rs.getString("password");
			if(pwd.equals(request.getParameter("password"))){
				sql = "delete from freeboard where id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, id);
				cnt = pstmt.executeUpdate();
				if(cnt > 0)
					out.println("정상적으로 삭제되었습니다.");
				else
					out.println("삭제되지 않았습니다.");
			}else{
				out.println("비밀번호가 틀립니다.");
			}
		}
		rs.close();
		pstmt.close();
		con.close();
			}catch(SQLException e){
				out.println(e);
		}
%>

</body>
</html>