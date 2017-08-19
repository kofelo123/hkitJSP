<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.text.*,java.sql.*"%>
<% request.setCharacterEncoding("utf-8"); %>

<%
	try{
		session=request.getSession();
		String id=request.getParameter("id");
		int qty = Integer.parseInt(request.getParameter("quantity"));
		
		//
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
	
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		//
		
		String ca="";
		String pn="";
		
		if(request.getParameter("cat") != null)
			if(!(request.getParameter("cat").equals("")))
					ca=request.getParameter("cat");
			
		if (request.getParameter("pname") != null) 
			  if ( !(request.getParameter("pname").equals("")) ) 
			   pn=request.getParameter("pname");
		
		String[] a = session.getValueNames();
		
		for(int i=0; i< a.length; i++){
			if(id.equals(a[i])){
				int old=((Integer)session.getValue(id)).intValue();
				qty =qty+old;//세션에 원래있던것에 이번에 장바구니로 담을수량을 더한다
			}
		}
		//여기서 stock-qty<0 분기문을 둘것. 
			
		try{
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/member","hkitJeongwon","gj0123");
			String sql="select stock from product where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(id));
			rs=pstmt.executeQuery();
			rs.next();
			int stock=rs.getInt(1);
			System.out.println(stock);
			System.out.println(qty);
			System.out.println(stock-qty);
			
			if(stock-qty<0){
				out.print("<SCRIPT LANGUAGE='JavaScript'>");
				out.print("alert('재고부족');");
				out.print("javascrpt:history.go(-1);");
				out.print("</SCRIPT>");
				 /* out.println("javascript:ab()"); */
		
			/* response.sendRedirect("shop_list.jsp?go=1");  */ //javascript와 같이 안먹힌다.
				
			}
			pstmt.close();
			con.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		
			
		
			/* if(stock-qty<0){
				out.println("<script>alert('재고부족,메인페이지로이동')</script>");
				response.sendRedirect("main.html");
			} */
		//
		
		session.putValue(id, new Integer(qty));   
		 out.println("바구니에 넣었습니다.");
		 out.print("[<A href=\"shop_list.jsp?go="+ request.getParameter("go"));
		 out.print("&cat="+ ca +"&pname="+pn+"\">계속 쇼핑하기</A>]");
		 out.print("[<A href=\"sale_list.jsp?go="+ request.getParameter("go"));
		 out.print("&cat="+ ca +"&pname="+pn+"\">장바구니 보기</A>]");
		 
		} catch (Exception e) {
		e.printStackTrace();
		} 
		%>