<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*,java.text.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
[<a href="shop_list.jsp">쇼핑 목록으로</a>]
<%
	String sql = null;
	Connection con = null;
	PreparedStatement pstmt1 = null;
	PreparedStatement pstmt2 = null;
	ResultSet rs1=null;
	ResultSet rs2=null;
	
	int count=0;
	int price=0;
	int qty=0;
	String cond="";
	long id=0;
	
	if(request.getParameter("id")!=null){
		id = Long.parseLong(request.getParameter("id"));
		cond = " where id=?";
	}else
		cond = " order by id desc";
	
	NumberFormat nf = NumberFormat.getNumberInstance();
	String totalstr="";
	
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
		sql = "select * from saleorder"+cond;
		pstmt1=con.prepareStatement(sql);
		pstmt1.setLong(1, id);
		rs1=pstmt1.executeQuery();
		if(!(rs1.next()))
			out.println("해당 내용이 없습니다.");
		else{
			do{
				totalstr = nf.format(rs1.getLong("total"));
				count = rs1.getInt("prodcount");
				id=rs1.getLong("id");
				out.println("<table width=500 border=0>");
				out.println("<tr><th colspan=2 bgcolor=003399>");
				out.println("<font color=white>주문 내역서</font></th></tr>");
				out.println("<tr><td width=20% bgcolor=eeeeee>");
				out.println("주문 번호</td>");
				out.println("<td bgcolor=eeeeee>"+id+"</td></tr>");
				out.println("<tr><td width=20% bgcolor=eeeeee>");
				out.println("주문 날짜</td>");
				out.println("<td bgcolor=eeeeee>"+rs1.getString("orderdate")+"</td></tr>");
				out.println("<tr><td bgcolor=eeeeee>고객 이름</td>");
				out.println("<td bgcolor=eeeeee>"+rs1.getString("name")+"</td></tr>");
				out.println("<tr><td bgcolor=eeeee>결제 유형</td>");
				out.println("<td bgcolor=eeeeee>");
				out.println(rs1.getString("pay")+"("+rs1.getShort("cardno")+")");
				out.println("</td></tr>");
				out.println("<tr><td bgcolor=eeeeee>배달 주소</td>");
				out.println("<td bgcolor=eeeeee>"+rs1.getString("addr")+"</td></tr>");
				out.println("<tr><td bgcolor=eeeeee>전화 번호</td>");
				out.println("<td bgcolor=eeeeee>"+rs1.getString("tel"));
				out.println("</td></tr></table>");
				
				sql = "select * from item where orderid=? order by mynum";
				pstmt2=con.prepareStatement(sql);
				pstmt2.setLong(1, id);
				rs2 = pstmt2.executeQuery();
				
				if(rs2.next()){
					out.println("<TABLE width=500 border=0 >");
				     out.println("<TR><TH colspan=2 bgcolor=0033cc>");
				     out.println("<FONT color=white>상품 코드</FONT></TH>");
				     out.println("<TH  bgcolor=0033cc>");
				     out.println("<FONT color=white>상품 이름</FONT></TH>");
				     out.println("<TH  bgcolor=0033cc>");
				     out.println("<FONT color=white>주문 수량</FONT></TH>");
				     out.println("<TH  bgcolor=0033cc>");
				     out.println("<FONT  color=white>판매가격</FONT></TH>");
				     out.println("<TH  bgcolor=0033cc>");
				     out.println("<FONT color=white>판매가격*수량</FONT></TH></TR>");
				     
				     do{
				    	 qty=rs2.getInt("quantity");
				    	 price=rs2.getInt("price");
				    	 
				    	 out.println("<TR><TH width=5% bgcolor=0033cc>");
				         out.println("<FONT color=white>"+rs2.getInt("mynum"));
				         out.println("</FONT></TH>");
				         out.println("<TD width=15% bgcolor=eeeeee>");
				         out.println(rs2.getLong("prodid")+"</TD>");
				         out.println("<TD width=100 bgcolor=eeeeee>");
				         out.println(rs2.getString("pname")+"</TD>");
				         out.println("<TD align=right bgcolor=eeeeee>"+qty+"</TD>");
				         out.println("<TD align=right bgcolor=eeeeee>");
				         out.println(nf.format(price)+"</TD>");
				         out.println("<TD align=right bgcolor=eeeeee>");
				         out.println(nf.format(price*qty)+"</TD></TR>");
				     }while(rs2.next());
				     out.println("<tr><td align=right colspan=6>");
				     out.println("주문 상품 :"+count+"품목&nbsp;합계금액 :"+totalstr+"원");
				     out.println("</td></tr></table><br>");
				}
			}while(rs1.next());
		}
		pstmt1.close();
		pstmt2.close();
		con.close();
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>