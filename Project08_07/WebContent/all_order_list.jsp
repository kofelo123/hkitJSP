<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*,java.text.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<p align="center">
<font color="#0000ff" face="굴림" size=+1>
<string>전체주문서리스트</string></font></p>

<form method="post" name="search" action="all_order_list.jsp">
	<table border="0" width="95%">
		<tr>
			<td align="right">
			<font size="-1">이름으로 찾기</font>
			<input type="text" name="name">
			<input type="submit" value="검색">
			</td>
		</tr>
		<tr>
			<th>
				<font size="2">
					[<a href="main.html">메인으로</a>]
				</font>
			</th>
	</table>
</form>

<center>
	<table border="0" width="50%" cellpadding="4" cellspacing="4" style="font-size:10pt">
	<tr>
		<th width="5%" bgcolor="#DFEDFF">
			<font color="black" face="굴림">
				<nobr>주문번호</nobr>
			</font>
			</th>
			
		<th width="5%" bgcolor="#DFEDFF">
			<font color="black" face="굴림">
				<nobr>주문자이름</nobr>
			</font>
			</th>
			
		<th width="10%" bgcolor="#DFEDFF">
			<font color="black" face="굴림">
				<nobr>날짜</nobr>
			</font>
			</th>
			
<%
	String cond="";
	String n="";
	if(request.getParameter("name") != null){//이름으로찾기 여부
		if( !(request.getParameter("name").equals(""))){
			n = request.getParameter("name");
			cond = " where name like '%"+ n +"%'";
		}
	}

	Vector keyId = new Vector();
	Vector orderName = new Vector();
	Vector orderDate = new Vector();
	
	long id = 0;
	NumberFormat nf = NumberFormat.getInstance();
	
	int where=1;
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
	}else if(request.getParameter("gogroup") != null){
		wheregroup = Integer.parseInt(request.getParameter("gogroup"));
		startpage=(wheregroup-1) * maxpages+1;
		where = startpage;
		endpage=startpage+maxpages-1;
	}
	int nextgroup = wheregroup + 1;
	int priorgroup = wheregroup-1;
	
	int startrow=0;
	int endrow=0;
	int maxrows=5;
	int totalrows=0;
	int totalpages=0;
	Connection con = null;
	PreparedStatement pstmt = null;
	Statement st = null;
	ResultSet rs = null;
	
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
	//
	try{
		st = con.createStatement();
		String sql="select * from saleorder";
		sql=sql+cond+" order by id desc";
		rs=st.executeQuery(sql);
		if(!(rs.next())){
			out.println("주문내역이 없습니다.");
		}else{
			do{
				keyId.addElement(new Long(rs.getLong("id"))); 
				orderName.addElement(rs.getString("name"));
				String inputDate=rs.getString("orderDate");
				inputDate=inputDate.substring(0,8);
				orderDate.addElement(inputDate);
			}while(rs.next());
			
			totalrows = orderName.size();
			totalpages = (totalrows-1)/maxrows +1;
			startrow = (where-1) * maxrows;
			endrow=startrow+maxrows-1;
			if(endrow >= totalrows)
				endrow=totalrows-1;
			totalgroup = (totalpages-1)/maxpages +1;
			if(endpage>totalpages)
				endpage=totalpages;
			for(int j=startrow;j<=endrow;j++){
				id=((Long)keyId.elementAt(j)).longValue();
			
			out.println("<tr>");
			out.println("<th width=5% bgcolor=#eeeeee>");
			out.println("<a href=\"order_list.jsp?id="+id+"\">"+id+"</a></th>");
			out.println("<td width=5% bgcolor=#eeeeee>");
			out.println(orderName.elementAt(j)+"</td>");
			out.println("<td width=10% bgcolor=#eeeeee>");
			out.println(orderDate.elementAt(j)+"</td>");
			out.println("</tr>");
			
		}
		rs.close();
	}
	
	out.println("</table>");
	st.close();
	con.close();
	}catch(SQLException e){
		e.printStackTrace();
	}

	if(wheregroup > 1){
		out.print("[<a href=\"all_order_list.jsp?gogroup=1");
		out.print("&name="+n+"\">처음</A>]");
		out.print("[<a href=\"all_order_list.jsp?gogroup="+priorgroup);
		out.print("&name="+n+"\">이전</a>]");
		
	}else{
		out.println("[처음]");
		out.println("[이전]");
	}
	
	if(totalrows !=0){
		for(int jj=startpage; jj<=endpage; jj++){
			if(jj==where)
				out.println("["+jj+"]");
			else{
				out.print("[<a href=\"all_order_list.jsp?go="+jj);
				out.print("&name="+n+"\">"+jj + "</a>]");/* 역슬래시 왜필요한지?  */			
		}
		
	}
	}
	if(wheregroup < totalgroup){
		out.print("[<a href=\" all_order_list.jsp?gogroup=" + nextgroup);
		out.print("&name="+n+"\">다음</a>]");
		out.print("[<a href=\"all_order_list.jsp?gogroup="+ totalgroup);
		out.print("&name="+n+"\">마지막</a>]");
	}else{
		out.println("[다음]");
		out.println("[마지막]");
	}
	out.println("전체주문서개수 :"+totalrows);
	
	
%>
</center>
</body>

</html>