<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
[<a href="freeboard_list.jsp?go=<%=request.getParameter("page") %>">게시판 목록으로 </a>]

<%
	String sql=null;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs= null;
	int cnt=0;
	int pos=0;
	String cont=request.getParameter("content");
	
	if(cont.length()==1)
		cont = cont+" ";
		while((pos=cont.indexOf("\'",pos)) != -1){
			String left=cont.substring(0, pos);
			String right=cont.substring(pos,cont.length());
			cont = left + "\'" + right;
			pos += 2;
		}
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
				String pwd = rs.getString("password");
				if(pwd.equals(request.getParameter("password"))){
					sql = "update freeboard set name= ?, email=?,";
					sql = sql+ "subject=?,content=? where id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, request.getParameter("name"));
					pstmt.setString(2, request.getParameter("email"));
					pstmt.setString(3, request.getParameter("subject"));
					pstmt.setString(4,cont);
					pstmt.setInt(5, id);
					cnt = pstmt.executeUpdate();
					if(cnt > 0)
						out.println("정상적으로 수정되었습니다.");
					else
						out.println("수정되지 않았습니다.");
				}else
					out.println("비밀번호가 틀립니다.");
				}
			rs.close();
			pstmt.close();
			con.close();
			}catch(SQLException e){
				e.printStackTrace();
		}
%>

</body>
</html>