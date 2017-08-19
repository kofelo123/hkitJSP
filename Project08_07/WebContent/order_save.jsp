<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*,java.text.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<script>

</script>
<%
	session = request.getSession();

	String[] a = session.getValueNames();
	
	String cardno="";
	String wname = request.getParameter("wname");
	String addr = request.getParameter("addr");
	String tel = request.getParameter("tel");
	String pay = request.getParameter("pay");
	int quant=Integer.parseInt(request.getParameter("qty"));
	int productId=Integer.parseInt(request.getParameter("pid"));
	
	if(pay.equals("card"))
		cardno=request.getParameter("number");
	
	int count = Integer.parseInt(request.getParameter("count"));
	long total = Long.parseLong(request.getParameter("total"));
	
	long id = 0;
	int num = 0;
	int qty=0;
	String pname="";
	
	java.util.Date yymmdd = new java.util.Date();
	SimpleDateFormat myformat = new SimpleDateFormat("yy-MM-d h:mm a");
	String ymd = myformat.format(yymmdd);
	String sql= null;
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int cnt = 0;
	int cnt2 = 0;
	int price= 0;
	
	//
	int stock=0;
	int quantity=0;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
	}catch(ClassNotFoundException e){
		e.printStackTrace();
	}
	
	try{
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/member","hkitJeongwon","gj0123");

		sql = "select max(id) from saleorder";
		pstmt=con.prepareStatement(sql);
		rs= pstmt.executeQuery();
		
		if(rs.next())
			id=rs.getLong(1) + 1;
		else
			id=1;
		
		sql="insert into saleorder(id,name,orderdate,addr,tel,pay,cardno,prodcount,total)values(?,?,?,?,?,?,?,?,?)";
		pstmt=con.prepareStatement(sql);
		pstmt.setLong(1, id);
		pstmt.setString(2, wname);
		pstmt.setString(3, ymd);
		pstmt.setString(4, addr);
		pstmt.setString(5, tel);
		pstmt.setString(6, pay);
		pstmt.setString(7, cardno);
		pstmt.setLong(8, count);
		pstmt.setLong(9, total);
		cnt = pstmt.executeUpdate();
		
		if(cnt >0){
			for(int i=0; i< a.length;i++){
				long pid = Long.parseLong(a[i].trim());
				qty = ((Integer)session.getValue(a[i])).intValue();
				num=i+1;
				sql = "select pname,downprice from product where id=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setLong(1, pid);
				rs=pstmt.executeQuery();
				rs.next();
				pname=rs.getString(1);
				price=rs.getInt(2);
				sql= "insert into item(orderid,mynum,prodid,pname,quantity,price) values(?,?,?,?,?,?)";
				pstmt=con.prepareStatement(sql);
				pstmt.setLong(1, id);
				pstmt.setInt(2, num);
				pstmt.setLong(3, pid);
				pstmt.setString(4, pname);
				pstmt.setInt(5, qty);
				pstmt.setInt(6, price);
				
				cnt2=cnt2+pstmt.executeUpdate();
			}
			
			if(cnt2==count){
				out.println("주문이 정상적으로 처리되었습니다.");
				session.invalidate();
				sql="update product set stock=stock-"+quant+" where id=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, productId);
				pstmt.executeUpdate();
				out.println("[<a href=\"order_list.jsp?id="+id+"\">주문서보기</a>]");
			}else{
				out.println("상품에 대한 주문이 처리되지 못했습니다.");
				out.println("[<a href=\"shop_list.jsp\">상품 목록으로</a>]");
			}
		}
		pstmt.close();
		con.close();
	}catch(SQLException e){
		e.printStackTrace();
	}
%>