<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<p>
<p align="center">
	<font color="#0000ff" face="굴림" size="3">
		<STRONG>자유 게시판(검색모드)</STRONG>
	</font>
</p>
<form method="post" name="search" action="freeboard_search.jsp">
	<table border="0" width="95%">
		<tr>
			<td align="left" width="30%" valign="bottom">
				[<A href="freeboard_list.jsp">자유 게시판(일반모드)</A>]</td>
			<td align="right" width="70%" valign="bottom">
				<font size="2" face="굴림">
					<select name="stype">
<%
	String cond = null;
	int what = 1;
	String val = null;
	if(request.getParameter("stype")!= null){
		what = Integer.parseInt(request.getParameter("stype"));
		val = request.getParameter("sval");
		if(what == 1){
			out.println("<OPTION value=1 selected>이름");
			cond = " where name like '%"+ val + "%'";
		}else
			out.println("<OPTION value=1>이름");
		if(what==2){
			out.println("<OPTION value=2 selected>제목");
			cond = " where subject like '%" + val + "%'";
		
		}else
			out.println("<OPTION value=2>제목");
		if(what==3){
			out.println("<OPTION value=3 selected>내용");
			cond = " where content like '%" + val + "%'";
		
		}else
			out.println("<OPTION value=3>내용");
		if(what==4){
			out.println("<OPTION value=4 selected>이름/제목");
			cond = " where name like '%" + val + "%'";
			cond = cond + " or subject like '%" + val + "%'";
		
		}else
			out.println("<OPTION value=4>이름/제목");
		if(what==5){
			out.println("<OPTION value=5 selected>이름/내용");
			cond = " where name like '%" + val + "%'";
			cond = cond+" or content like '%" + val + "%'";
		}else
			out.println("<OPTION value=5>이름/sodyd");
		if(what==6){
			out.println("<OPTION value=6 selected>제목/내용");
			cond = " where subject like '%" + val + "%'";
			cond = cond + " or content like '%"+ val+ "%'";
		}else
			out.println("<OPTION value=6>제목/내용");
		if(what==7){
			out.println("<OPTION value=7 selected>이름/제목/내용");
			cond = " where name like '%" + val + "%'";
			cond = cond + " or subject like '%" + val + "%'";
			cond = cond + " or content like '%" + val + "%'";
	}else
		out.println("<OPTION value=7>이름/제목/내용");
	if(val.trim().equals(""))
		cond = "";
	}
%>
	</select>
	</font>
	<input type="text" name="sval" value="<%=request.getParameter("sval") %>">
	<input type="submit" value="검색">
	</td>
	</tr>
	</table>
</form>
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
	
	Vector step = new Vector();
	Vector keyid=new Vector();//PK id값을 저장할 벡터.
	
	int where = 1; //보여줄 페이지
	
	int totalgroup=0;//전체그룹수
	int maxpages=2;//한그룹에 포함시킬 페이지수
	int startpage=1;//그룹의 시작페이지
	int endpage=startpage+maxpages-1;//그룹의 마지막페이지
	int wheregroup=1;//보여줄 페이지 그룹
	
	if(request.getParameter("go") != null){ //페이지번호 링크를 누를때 go값 전달됨. -> where로 저장.
		where = Integer.parseInt(request.getParameter("go"));
		wheregroup = (where-1)/maxpages + 1;
		startpage=(wheregroup-1) * maxpages+1;
		endpage=startpage+maxpages-1;
	}else if (request.getParameter("gogroup") != null){//다음,이전,처음 ,마지막 링크누를시에 gogroup값 전달 -> wheregroup을 gogroup값을 변경한다.
		wheregroup = Integer.parseInt(request.getParameter("gogroup"));
		startpage=(wheregroup-1) * maxpages+1;
		where = startpage;
		endpage=startpage+maxpages-1;
	}
	int nextgroup=wheregroup+1;//다음그룹, 이전그룹을 계산
	int priorgroup = wheregroup-1;
	
	int nextpage=where+1;
	int priorpage = where-1;
	int startrow=0;//보여줄 페이지에 포함되는 첫번쨰 로우 와 마지막 번쨰 로우를 저장
	int endrow=0;
	int maxrows=5;//페이지당 보여줄 로우
	int totalrows=0;//전체로우개수(게시판 올린 글수)
	int totalpages =0;//전체 페이지수
	
	int id=0; //pk키
	
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
		String sql="select * from freeboard "+cond+" order by id desc";
		pstmt = con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(!(rs.next())){
			out.println("해당하는 글이 없습니다.");
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
				step.addElement(new Integer(rs.getInt("step")));
			}while(rs.next());//아래부터 페이징관련 속성들 계산.
			totalrows = name.size();//Vector name의 사이즈로 전체로우개수 얻음.
			totalpages = (totalrows-1)/maxrows +1;//전체페이지수 구하기 (총게시글-1/페이지당게시글 )+1
			startrow = (where-1) * maxrows;//페이지의 시작,끝 로우 id계산
			endrow = startrow+maxrows-1;
			if( endrow >= totalrows)//초과되는경우 계산
				endrow=totalrows-1;
			
			totalgroup = (totalpages-1)/maxpages +1;
			if(endpage > totalpages)
				endpage=totalpages;
			
			for(int j=startrow;j<=endrow;j++){
				String temp=(String)email.elementAt(j);
				if((temp == null) || (temp.equals("")))//email 값이 null이나 공백이 아니면 이름을 보여줄때 링크형태로 메일을 보낼수있기위한 태그를 앞뒤로 추가.
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
					int stepi= ((Integer)step.elementAt(j)).intValue();
					if(stepi > 0 ){
						for(int count=0; count < stepi; count++)
							out.println("&nbsp;&nbsp;");
					}
					String clink = "<a href=freeboard_read.jsp?id=" + keyid.elementAt(j);
					clink = clink + "&page=" + where + ">" + subject.elementAt(j)+ "</a>";
					out.println(clink+ "</td>");
					out.println("<td align='center'>");
					out.println(em + "</td>");
					out.println("<td align='center'>");
					out.println(inputdate.elementAt(j)+ "</td>");
					out.println("<td align='center'>");
					out.println(rcount.elementAt(j)+"</td>");
					out.println("</tr>");
					
			}
			rs.close();
		}
		out.println("</table>");
		pstmt.close();
		con.close();
	}catch(java.sql.SQLException e){
		e.printStackTrace();
	}
	
	if(wheregroup >1) {
		out.print("[<a href='freeboard_list.jsp?gogroup=1'");
		out.print("&stype="+ what+"&sval=" + val +">처음</A>]");
		out.print("[<a href=freeboard_list.jsp?gogroup="+priorgroup);
		out.print("&stype="+ what+"&sval=" + val +">이전</a>]");
	}else{
		out.println("[처음]");
		out.println("[이전]");
	}
	if(name.size() !=0){
		for(int jj=startpage; jj<=endpage; jj++){
			if(jj==where)
				out.println("["+jj+"]");
			else{
				out.print("[<a href=freeboard_search.jsp?go="+jj);
				out.print("&stype=" + what+"&sval=" + val +">" + jj + "</a>]");
				
			}
		}
	}
	
	if( wheregroup < totalgroup){
		out.print("[<a href=freeboard_list.jsp?gogroup=" + nextgroup);
		out.print("&stype="+ what+"&sval=" + val +">다음</a>]");
		out.print("[<a href=freeboard_list.jsp?gogroup=" + totalgroup);
		out.print("&stype="+ what+"&sval=" + val +">마지막</a>]");
	}else {
		out.println("[다음]");
		out.println("[마지막]");
	}
	out.println("검색된 글수 : " +totalrows);
%>
<!-- 	<table border="0" width="600" cellpadding="0" cellspacing="0">
		<tr>
			<td align="right" valign="bottom">
			<a href="freeboard_write.html"><img src="image/write.gif" width="66" height="21" border="0"></a>
			</td>
		</tr>
	</table> -->
<!-- 	<form method="post" name="msgsearch" action="freeboard_search.jsp">
	<table border="0" width="600" cellpadding="0" cellspacing="0">
		<tr>
			<td align="right" width="241">
				<select name="stype">
					<option value="1">이름
					<option value="2">제목
					<option value="3">내용
					<option value="4">이름+제목
					<option value="5">이름+내용
					<option value="6">제목+내용
					<option value="7">이름+제목+내용
				</select>
			</td>
			<td width="127" align="center">
				<input type="text" size="17" name="sval">
			</td>
			<td width="115">&nbsp;<a href="#" onClick="check();"><img src="image/search.gif" border="0" align='absmiddle'></a></td>
			<td align="right" valign="bottom" width="117"><a href="freeboard_write.html"><img src="image/write.gif" border="0"></a></td>
		</tr>
	</table>
	</form>		
 -->
</body>
</html>
</body>
</html>