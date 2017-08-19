<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*,java.text.*"%>
<% request.setCharacterEncoding("UTF-8"); %>    

<% 
String name = request.getParameter("name");
String pnum = request.getParameter("pnum");
String email = request.getParameter("mail");
String birth = request.getParameter("birth");
String company = request.getParameter("company");
String memo = request.getParameter("memo");
int id = 1 ;

String sql = null;
Connection con = null;
PreparedStatement pst = null;
Statement st = null;
ResultSet rs = null;
int cnt = 0;

try{ 
	Class.forName("com.mysql.jdbc.Driver"); 
}catch(ClassNotFoundException e){ 
out.println(e.getMessage()); 
} 
 
try{ 
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jboard","root","1234");
	st = con.createStatement();
	sql = "select max(idjuso) from juso";
	rs = st.executeQuery(sql);
	if(!(rs.next()))
		id=1;
	else {
		id = rs.getInt(1)+1;
		rs.close();
	}
	sql = "insert into juso values(?, ?, ?, ?, ?, ?, ?)";
	pst = con.prepareStatement(sql);
	pst.setInt(1, id);
	pst.setString(2, name);
	pst.setString(3, pnum);
	pst.setString(4, birth);
	pst.setString(5, company);
	pst.setString(6, memo);
	pst.setString(7, email);
	
	cnt = pst.executeUpdate();
	if(cnt > 0)
		response.sendRedirect("main.jsp");
	else
		out.println("데이터가 입력되지 않았습니다.");
	pst.close();
	con.close();
}catch (SQLException e){
	out.println(e);
}
	
%>