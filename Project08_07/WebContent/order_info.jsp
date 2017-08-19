<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.text.*,java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<%
	int total = Integer.parseInt(request.getParameter("total"));
	int count = Integer.parseInt(request.getParameter("count"));
	
	int qty = Integer.parseInt(request.getParameter("quantity"));
	int id =Integer.parseInt(request.getParameter("id"));
	int stock=0;
	NumberFormat nf = NumberFormat.getNumberInstance();
	String totalstr = nf.format(total);
	String sql="";
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<script language="javascript">
	function check(f) {
		blank = false;
		for (i = 0; i < f.elements.length; i++) {
			if (f.elements[i].value == "") {
				if (f.elements[i].name != "number")
					blank = true;
				if ((f.elements[i].name == "number") && (f.pay.value == "card"))
					blank = true;
			}
		}
		if (blank == true)
			alert("모든 항목을 입력하셔야 합니다.");
		else
			f.submit();
	}
	
</script>
</head>
<body>

<%
	Connection con = null;
	PreparedStatement pstmt=null;
	ResultSet rs= null;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
	}catch(ClassNotFoundException e){
		e.printStackTrace();
	}
	
	try{
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/member","hkitJeongwon","gj0123");
		sql="select stock from product where id=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, id);
		rs=pstmt.executeQuery();
		rs.next();
		stock=rs.getInt(1);
		System.out.println(stock);
		System.out.println(qty);
		System.out.println(stock-qty);
		
		if(stock-qty<0){
			out.print("<SCRIPT LANGUAGE='JavaScript'>");
			out.print("alert('재고부족');");
			out.print("javascrpt:history.go(-1);");
			out.print("</SCRIPT>");
			
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
	<P>
		[<A href="sale_list.jsp">장바구니 다시 보기</A>]
	<FORM method=post action="order_save.jsp">
		<TABLE border=0 width=400>
			<TR>
				<TH bgcolor=#003399 colspan=2><FONT size=+1 color=white>
						주문서 작성하기</FONT></TH>
			</TR>
			<TR>
				<TH width=30% bgcolor=#0033cc><FONT size=-1 color=white>이름</FONT>
				</TH>
				<TD bgcolor=#eeeeee><INPUT type=text name=wname size=30>
				</TD>
			</TR>
			<TR>
				<TH width=30% bgcolor=#0033cc><FONT size=-1 color=white>결제
						유형</FONT></TH>
				<TD bgcolor=#eeeeee><FONT size=-1> <INPUT type=radio
						name=pay value="card">카드 <INPUT type=radio name=pay
						value="cash">온라인 입금
				</FONT></TD>
			</TR>
			<TR>
				<TH width=30% bgcolor=#0033cc><FONT size=-1 color=white>카드
						번호</FONT></TH>
				<TD bgcolor=#eeeeee><INPUT type=text name=number size=30>
				</TD>
			</TR>
			<TR>
				<TH width=30% bgcolor=#0033cc><FONT size=-1 color=white>배달
						주소</FONT></TH>
				<TD bgcolor=#eeeeee><INPUT type=text name=addr size=30>
				</TD>
			</TR>
			<TR>
				<TH width=30% bgcolor=#0033cc><FONT size=-1 color=white>전화번호</FONT>
				</TH>
				<TD bgcolor=#eeeeee><INPUT type=text name=tel size=30>
				</TD>
			</TR>
			<TR>
				<TH width=30% bgcolor=#0033cc><FONT size=-1 color=white>주문
						총 금액</FONT></TH>
				<TD bgcolor=#eeeeee><%=totalstr%>원</TD>
			</TR>
			<TR>
				<TD colspan=2><INPUT type=hidden name=total value=<%=total%>>
					<INPUT type=hidden name=count value=<%=count%>>
					<input type=hidden name=qty value=<%=qty %>>
					<input type=hidden name=pid value=<%=id %>>
					 <INPUT	type=button value=" 확인 " onClick="check(this.form)"> <INPUT
					type=reset value=" 다시쓰기 "></TD>
			</TR>
		</TABLE>
		</CENTER>
	</FORM>
</BODY>
</HTML>