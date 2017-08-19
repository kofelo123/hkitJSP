<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<center>
	<%
		String sql=null;
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e){
			e.printStackTrace();
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
				String em=rs.getString("email");
				if((em != null) && (!(em.equals(""))))
					em = "<a href=mailto:" + em + ">" + rs.getString("name")+"</a>";
					else
						em = rs.getString("name");
				out.println("<table width='600' cellspacing='0' cellpadding='2'>");
				out.println("<tr>");
				out.println("<td height='22'>&nbsp;</td></tr>");
				out.println("<tr align='center'>");
				out.println("<td height='1' bgcolor='#1F4F8F'>");
				out.println("</tr>");
				out.println("<tr align='center' bgcolor='#DFEDFF'>");
				out.println("<td class='button' bgcolor='#DFEDFF'>");
				out.println("<div align='eft'><font size='2'>"+rs.getString("subject")+ "</div></td>");
				out.println("</tr>");
				out.println("<tr align='center' bgcolor='#FFFFFF'>");
				out.println("<td align='center' bgcolor='#F4F4F4'>");
				out.println("<table width='100%' border='0' cellpadding='0' cellspacing='4' height='1'>");
				out.println("<tr bgcolor='#F4F4F4'>");
				out.println("<td width='13%' height='7'></td>");
				out.println("<td width='51%' height='7'>글쓴이 : "+ em +"</td>");
				out.println("<td width='25%' height='7'></td>");
				out.println("<td width='1%' height='7'></td>");
				out.println("</tr>");
				out.println("<tr bgcolor='#F4F4F4'>");
				out.println("<td width='13%'></td>");
				out.println("<td width='51%'>작성일 : " + rs.getString("inputdate") + "</td>");
				out.println("<td width='25%'>조회 : " + rs.getInt("readcount")+"</td>");
				out.println("<td width='11%'></td>");
				out.println("</tr>");
				out.println("</table>");
				out.println("</td>");
				out.println("</tr>");
				out.println("<tr align='center'>");
				out.println("<td bgcolor='#1F4F8F' height=''></td>");
				out.println("</tr>");
				out.println("<tr align='center'>");
				out.println("<td style='padding:10 0 0 0'>");
				out.println("<div align='left'><br>");
				out.println("<font size='3' color='#333333'><PRE>"+rs.getString("content") + "</PRE></div>");
				out.println("<br>");
				out.println("</td>");
				out.println("</tr>");
				out.println("<tr align='center'>");
				out.println("<td class='button' height='1'></td>");
				out.println("</tr>");
				out.println("<tr align='center'>");
				out.println("<td bgcolor='#1F4F8F' height='1'></td>");
				out.println("</tr>");
				out.println("</table>");
		%>
			<table width="600" border="0" cellpadding="0" cellspacing="5">
			<tr>
				<td align="right" width="450"><a href="freeboard_list.jsp?go=<%=request.getParameter("page") %>">
				<img src="image/list.jpg" border="0"></a></td>
				<td width="70" align="right"><a href="freeboard_rwrite.jsp?id=<%= request.getParameter("id")%>&page=<%=request.getParameter("page") %>"><img src="image/reply.jpg" border="0"></a></td>
				<td width="70" align="right"><a href="freeboard_upd.jsp?id=<%=id %>&page=1"><img src="image/edit.jpg" border="0"></a></td>
				<td width="70" align="right"><a href="freeboard_del.jsp?id=<%=id %>&page=1"><img src="image/del.jpg" border="0"></a></td>
			</tr>
			</table>	
			<%
				sql = "update freeboard set readcount = readcount + 1 where id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, id);
				pstmt.executeUpdate();
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch(SQLException e){
			out.println(e);
		}
			%>
	

</center>
</body>
</html>