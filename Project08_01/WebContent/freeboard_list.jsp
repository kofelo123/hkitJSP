<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
</head>
<body>
<p>
<p align="center"><font color="#0000ff" face="굴림" size="3"><string>자유 게시판</string></font>
<p>
<center>
	<table border="0"  width="600" cellpadding="4" cellspacing="0">
		<tr align="center">
			<td colspan="5" height="1" bgcolor="#1F4F8F"></td>
		</tr>
		<tr align="center" bgcolor="#87E8FF">
			<td width="42" bgcolor="#DFEDFF"><font size="2">번호</font></td>
			<td width="340" bgcolor="#DFEDFF"><font size="2">제목</font></td>
			<td width="84" bgcolor="#DFEDFF"><font size="2">등록자</font></td>
			<td width="78" bgcolor="#DFEDFF"><font size="2">날짜</font></td>
			<td width="49" bgcolor="#DFEDFF"><font size="2">조회</font></td>
		</tr>
		<tr align="center">
			<td colspan="5" bgcolor="#1F4F8F" height="1"></td>
		</tr>
<%
	Vector name = new Vector();
	Vector inputdate = new Vector();
	Vector email = new Vector();
	Vector subject = new Vector();
	Vector rcount = new Vector();
	Vector keyid=new Vector();
	
	int where = 1;
	
	int totalgroup=0;
	int maxpages=2;
	int startpage=1;
	int endpage=startpage+maxpages-1;
	int wheregroup=1;
	
	if(request.getParameter("go") != null){
		where = Integer.parseInt(request.getParameter("go"));
		wheregroup = (where-1)/maxpages + 1;
		startpage=(wheregroup-1) * maxpages+1;
		endpage=startpage+maxpages-1;
	}else if (request.getParameter("gogroup") != null){
		wheregroup = Integer.parseInt(request.getParameter("gogroup"));
		startpage=(wheregroup-1) * maxpages+1;
		where = startpage;
		endpage=startpage+maxpages-1;
	}
	int nextgroup=wheregroup+1;
	int priorgroup = wheregroup-1;
	
	int nextpage=where+1;
	int priorpage = where-1;
	int startrow=0;
	int endrow=0;
	int maxrows=2;
	int totalrows=0;
	int totalpages =0;
	
	int id=0;
	
	String em=null;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs= null;
	
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
		String sql="select * from freeboard order by id desc";
		pstmt = con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(!(rs.next())){
			out.println("게시판에 올린 글이 없습니다.");
		}else{
			do{
				keyid.addElement(new Integer(rs.getInt("id")));
				name.addElement(rs.getString("name"));
				email.addElement(rs.getString("email"));
				String idate = rs.getString("inputdate");
				idate = idate.substring(0,8);
				inputdate.addElement(idate);
				subject.addElement(rs.getString("subject"));
				rcount.addElement(new Integer(rs.getInt("readcount")));
			}while(rs.next());
			totalrows = name.size();
			totalpages = (totalrows-1)/maxrows +1;
			startrow = (where-1) * maxrows;
			endrow = startrow+maxrows-1;
			if( endrow >= totalrows)
				endrow=totalrows-1;
			
			totalgroup = (totalpages-1)/maxpages +1;
			if(endpage > totalpages)
				endpage=totalpages;
			
			for(int j=startrow;j<=endrow;j++){
				String temp=(String)email.elementAt(j);
				if((temp == null) || (temp.equals("")))
					em = (String)name.elementAt(j);
				else
					em = "<a href=mailto:" + temp + ">" + name.elementAt(j) + "</a>";
					
					id= totalrows-j;
					if(j%2 == 0){
						out.println("<tr bgcolor='#FFFFFF' onMouseOver=\" bgColor='#DFEDFF'\" onMouseOut=\"bgColor='\">");
					}else{
						out.println("<tr bgcolor='#F4F4F4' onMouseOver=\" bgColor='#DFEDFF'\" onMouseOut=\"bgColor='#F4F4F4'\">");
					}
					out.println("<td align='center'>");
					out.println(id+"</td>");
					out.println("<td>");
					String clink = "<a href=freeboard_read.jsp?id=" + keyid.elementAt(j);
					clink = clink + "&page=" + where + ">" + subject.elementAt(j)+ "</a>";
					out.println(clink+ "</td>");
					out.println("<td align='center'>");
					out.println(em + "</td>");
					out.println("<td align='center'>");
					out.println(inputdate.elementAt(j)+ "</td>");
					out.println("<td align='center'>");
					out.println(rcount.elementAt(j)+ ","+"</td>");
					out.println("</tr>");
					
			}
			rs.close();
		}
		out.println("</table>");
		pstmt.close();
		con.close();
	}catch(java.sql.SQLException e){
		out.println(e);
	}
	
	if(wheregroup >1) {
		out.println("[<a href='freeboard_list.jsp?gogroup=1'>처음</a>]");
		out.println("[<a href=freeboard_list.jsp?gogroup="+priorgroup +">이전</a>]");
	}else{
		out.println("[처음]");
		out.println("[이전]");
	}
	if(name.size() !=0){
		for(int jj=startpage; jj<=endpage; jj++){
			if(jj==where)
				out.println("["+jj+"]");
			else
				out.println("[<a href=freeboard_list.jsp?go="+jj+">" + jj + "</a>]");
		}
	}
	
	if( wheregroup < totalgroup){
		out.println("[<a href=freeboard_list.jsp?gogroup=" + nextgroup + ">다음</a>]");
		out.println("[<a href=freeboard_list.jsp?gogroup=" + totalgroup + ">마지막</a>]");
	}else {
		out.println("[다음]");
		out.println("[마지막]");
	}
	out.println("전체 글수 : " +totalrows);
%>
	<table border="0" width="600" cellpadding="0" cellspacing="0">
		<tr>
			<td align="right" valign="bottom">
			<a href="freeboard_write.html"><img src="image/write.gif" width="66" height="21" border="0"></a>
			</td>
		</tr>
	</table>
		

</body>
</html>