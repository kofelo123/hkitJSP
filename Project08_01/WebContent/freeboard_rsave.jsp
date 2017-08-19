<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*,java.text.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
	String na = request.getParameter("name");
	String em= request.getParameter("email");
	String sub = request.getParameter("subject");
	String cont= request.getParameter("content");
	String pw = request.getParameter("password");
	int mid = Integer.parseInt(request.getParameter("mid"));
	int rnum= Integer.parseInt(request.getParameter("rnum"));
	int step= Integer.parseInt(request.getParameter("step"))+1;
	int id = 0;
	int pos=0;
	if(cont.length()==1)
		cont = cont+" " ;
		
	java.util.Date yymmdd = new java.util.Date();
	SimpleDateFormat myformat = new SimpleDateFormat("yy-MM-d h:mm a");
	String ymd=myformat.format(yymmdd);
	
	String sql=null;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int cnt=0;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
	}catch(ClassNotFoundException e){
		out.println(e.getMessage());
	}
	try{
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/member","hkitJeongwon","gj0123");
		
		
		sql = "select max(id) from freeboard"; //max함수로 id가장큰것을 찾는다.(id가 PK인데 DB에서 autoincrement방법 말고 max로 찾는다.)
		
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if(!(rs.next()))//ResultSet에 없으면 아무글도 없을때
			id=1;
		else{
			id= rs.getInt(1)+1;//
			rs.close();
			
		}
		if(step == 1){
			sql = "select max(replynum) from freeboard where masterid="+mid;
			rs=pstmt.executeQuery(sql);
			if(!(rs.next()))
				rnum=1;
			else
				rnum=rs.getInt(1)+1;
		}
		
		sql="insert into freeboard values(?,?,?,?,?,?,?,?,?,?,?)";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, id);
		pstmt.setString(2, na);
		pstmt.setString(3, pw);
		pstmt.setString(4, em);
		pstmt.setString(5, sub);
		pstmt.setString(6, cont);
		pstmt.setString(7, ymd);
		pstmt.setInt(8, mid);//
		pstmt.setInt(9, 0);//
		pstmt.setInt(10, rnum);//
		pstmt.setInt(11, step);//
		
		cnt = pstmt.executeUpdate();
	/* 	if(cnt >0)
			out.println("데이터가 성공적으로 입력되었습니다.");
		else
			out.println("데이터가 입력되지 않았습니다.");
	 */	
		pstmt.close();
		con.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		response.sendRedirect("freeboard_list.jsp?go="+request.getParameter("page"));
	%>
	 




<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

</body>
</html>