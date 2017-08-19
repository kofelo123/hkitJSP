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
<string>상품목록</string></font></p>

<form method="post" name="search" action="product_list.jsp">
	<table border="0" width="95%">
		<tr>
			<td align="right">
			<font size="-1">상품명으로 찾기</font>
			<input type="text" name="pname">
			<input type="submit" value="검색">
			</td>
		</tr>
		<tr>
			<th>
				<font size="1">
					[<a href="main.html">메인으로</a>]
					<a href="product_list.jsp">전체</a>
					<a href="product_list.jsp?cat=11">가구</a>
					<a href="product_list.jsp?cat=22">전기/전자</a>
					<a href="product_list.jsp?cat=33">부엌용품</a>
					<a href="product_list.jsp?cat=44">의류</a>
					<a href="product_list.jsp?cat=55">보석 및 악세사리</a>
					<a href="product_list.jsp?cat=66">헬스 기구</a>
					<a href="product_list.jsp?cat=77">컴퓨터 관련</a>
					<a href="product_list.jsp?cat=88">기타</a>
				</font>
			</th>
	</table>
</form>

<center>
	<table border="0" width="95%" cellpadding="4" cellspacing="4" style="font-size:10pt">
	<tr>
		<th width="5%" bgcolor="#DFEDFF">
			<font color="black" face="굴림">
				<nobr>번호</nobr>
			</font>
			</th>
			
		<th width="25%" bgcolor="#DFEDFF">
			<font color="black" face="굴림">
				<nobr>상품명</nobr>
			</font>
			</th>
			
		<th width="10%" bgcolor="#DFEDFF">
			<font color="black" face="굴림">
				<nobr>코드번호</nobr>
			</font>
			</th>
			
		<th width="15%" bgcolor="#DFEDFF">
			<font color="black" face="굴림">
				<nobr>제조원</nobr>
			</font>
			</th>
			
		<th width="10%" bgcolor="#DFEDFF">
			<font color="black" face="굴림">
				<nobr>판매시작일</nobr>
			</font>
			</th>
			
		<th width="10%" bgcolor="#DFEDFF">
			<font color="black" face="굴림">
				<nobr>판매가(원)</nobr>
			</font>
			</th>
			
		<th width="10%" bgcolor="#DFEDFF">
			<font color="black" face="굴림">
				<nobr>재고량</nobr>
			</font>
			</th>
			
		<th width="15%" bgcolor="#DFEDFF">
			<font color="black" face="굴림">
				<nobr>분류</nobr>
			</font>
			</th>
			
			</tr>
<%
	String cond="";
	String ca="";//category request 받을 변수
	String pn="";//pname request 받을변수
	
	if(request.getParameter("cat") != null){ //카테고리 여부
		if( !(request.getParameter("cat").equals(""))){
			ca=request.getParameter("cat");
			cond = " where category = '" + ca +"'";
		}
	}
	
	if(request.getParameter("pname") != null){//상품명으로찾기 여부
		if( !(request.getParameter("pname").equals(""))){
			pn = request.getParameter("pname");
			cond = " where pname like '%"+ pn+"%'";
		}
	}
	
	Vector pname= new Vector();
	Vector sname= new Vector();
	Vector keyid= new Vector();
	Vector cat= new Vector();
	Vector dprice= new Vector();
	Vector inputdate= new Vector();
	Vector stock= new Vector();
	String category=null;
	
	long id= 0;
	
	NumberFormat nf = NumberFormat.getInstance();
	String downprice=null;
	
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
		String sql = "select * from product";
		sql=sql+cond+" order by id";
		rs = st.executeQuery(sql);
		if(!(rs.next())){
			out.println("상품이 없습니다.");
		}else{
			do{
				keyid.addElement(new Long(rs.getLong("id")));
				cat.addElement(rs.getString("category"));
				pname.addElement(rs.getString("pname"));
				sname.addElement(rs.getString("sname"));
				dprice.addElement(new Integer(rs.getInt("downprice")));
				String idate = rs.getString("inputdate");
				idate = idate.substring(0,8);
				inputdate.addElement(idate);
				stock.addElement(new Integer(rs.getInt("stock")));
			}while(rs.next());
			
			totalrows = pname.size();
			totalpages = (totalrows-1)/maxrows +1;
			startrow = (where-1) * maxrows;
			endrow=startrow+maxrows-1;
			if(endrow >= totalrows)
				endrow=totalrows-1;
			totalgroup = (totalpages-1)/maxpages +1;
			if(endpage>totalpages)
				endpage=totalpages;
			for(int j=startrow;j<=endrow;j++){
				id=((Long)keyid.elementAt(j)).longValue();//왜여기서 미리 꺼내야하는지는 잘 모르겠다.
				downprice=nf.format(((Integer)dprice.elementAt(j)).intValue());
				switch(Integer.parseInt((String)cat.elementAt(j))){
					case 11:
						category="가구";
						break;
					case 22:
						category="전기/전자";
						break;
					case 33:
						category="부엌용품";
						break;
					case 44:
						category="의류";
						break;
					case 55:
						category="보석및 악세사리";
						break;
					case 66:
						category="헬스기구";
						break;
					case 77:
						category="컴퓨터관련";
						break;
					case 88:
						category="기타";
						break;
					default:
						break;
				}
				out.println("<TR>");
				out.println("<TH width=5% bgcolor=#eeeeee>");
				out.println(j+1+"</th>");
				out.println("<td width=25% bgcolor=#eeeeee>");
				out.println("<a href=\"product_read.jsp?id="+id + "&go=" + where);
				out.println("&cat="+ca+"&pname="+pn+"\">"+pname.elementAt(j));
				out.println("</a></td>");
				out.println("<td width=10% bgcolor=#eeeeee>");
				out.println(id + "</td>");
				out.println("<td width=15% bgcolor=#eeeeee>");
				out.println(sname.elementAt(j) + "</td>");
				out.println("<td width=10% bgcolor=#eeeeee>");
				out.println(inputdate.elementAt(j)+"</td>");
				out.println("<td width=-10% bgcolor=#eeeeee algin=right>");
				out.println(downprice+ "</td>");                     
				out.println("<td width=10% bgcolor=#eeeeee algin=right>");
				out.println(stock.elementAt(j) +"</td>");
				out.println("<td width=15% bgcolor=#eeeeee>");
				out.println(category +"</td>");
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
		out.print("[a href=\"product_list.jsp?gogroup=1");
		out.print("&cat="+ca+"&pname="+pn+"\">처음</A>]");
		out.print("[<a href=\"product_list.jsp?gogroup="+priorgroup);
		out.print("&cat="+ca+"&pname="+pn+"\">이전</a>]");
		
	}else{
		out.println("[처음]");
		out.println("[이전]");
	}
	
	if(totalrows !=0){
		for(int jj=startpage; jj<=endpage; jj++){
			if(jj==where)
				out.println("["+jj+"]");
			else{
				out.print("[<a href=\"product_list.jsp?go="+jj);
				out.print("&cat="+ca+"&pname="+pn+"\">"+jj + "</a]");			
		}
		
	}
	}
	if(wheregroup < totalgroup){
		out.print("[<a href=\" oruduct_list.jsp?gogroup=" + nextgroup);
		out.print("&cat="+ca+"&pname="+pn+"\">다음</a>]");
		out.print("[a href=\"product_list.jsp?gogroup="+ totalgroup);
		out.print("&cat="+ca+"&pname="+pn+"\">마지막</a>]");
	}else{
		out.println("[다음]");
		out.println("[마지막]");
	}
	out.println("전체상품수 :"+totalrows);
	
	
%>
</center>
</body>

</html>