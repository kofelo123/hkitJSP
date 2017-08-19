<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script>
	function view(temp){
		filename = "http://localhost:8080/Project08_07/upload/"+temp;
		i = window.open(filename,"win","height=350,width=450,toolbar=0,menubar=0,scrollbars=1,resizable=1,status=0");
			}
</script>
</head>
<body>
<%
	String ca="";
	String pn="";
	
	if(request.getParameter("cat") != null)
		if(!(request.getParameter("cat").equals("")))
			ca=request.getParameter("cat");
	if(request.getParameter("pname") != null)
		if(!(request.getParameter("pname").equals("")))
			pn = request.getParameter("pname");
	
	String sql=null;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	long id = Long.parseLong(request.getParameter("id"));
	String url = "http://localhost:8080/Project08_07/upload/";//?
	String small=null;
	
	out.print("[<a href=\"product_list.jsp?go="+ request.getParameter("go"));
	out.print("&cat="+ ca +"&pname"+pn+"\">상품 목록으로</a>]");
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
	}catch(ClassNotFoundException e){
		e.printStackTrace();
	}
	
	try{
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/member","hkitJeongwon","gj0123");
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	try{
		sql = "select * from product where id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setLong(1, id);
		rs= pstmt.executeQuery();
		
		if(!(rs.next())){
			out.println("해당 내용이 없습니다.");
		}else{
			small=url+rs.getString("small");
			out.println("<table width=500 border=0 >");
			out.println("<tr><th rowspan=3>");
			 out.println("<A href=JavaScript:view(\""+rs.getString("large")+"\")>"); 
			   out.println("<IMG width=100 height=100 src="+small+">");
			   out.println("<BR>확대</A></TH>");
			   out.println("<TH bgcolor=#003399>");
			   out.println("<FONT face=굴림 color=white>");
			   out.println(rs.getString("pname")+"("+rs.getLong("id")+")");
			   out.println("---작성자:"+rs.getString("wname"));
			   out.println("</FONT></TH></TR>");  
			   out.println("<TR>");
			   out.println("<TD>");
			   out.println("<U>상세 설명 :</U><BR>");
			   out.println(rs.getString("description") );
			   out.println("</TD></TR>"); 
			   out.println("<TR><TD align=right>");   
			   out.println("제조(공급)원:"+rs.getString("sname")+"<BR>");
			   out.println("시중가:<STRIKE>"+rs.getString("price")+"</STRIKE>원");
			   out.println("판매가:"+rs.getString("downprice")+"원");
			   out.println("</TD></TR>");  
			   out.println("</TABLE>");
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