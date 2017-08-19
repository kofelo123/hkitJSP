<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*,java.text.*,com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
    
<%request.setCharacterEncoding("utf-8"); %>
<%
 /* 	String fileurl= "C:/Pro/hkit_jsp";

	String saveFolder="upload"; */ 
	String saveFolder="upload";
	String fileurl=application.getRealPath(saveFolder);
	String encType="utf-8";
	int Maxsize = 5*1024*1024;
	
	/* ServletContext context = getServletContext(); */
	MultipartRequest multi = null;
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	multi = new MultipartRequest(request,fileurl,Maxsize,encType,policy);
	
	String wn = multi.getParameter("wname");
	String cat= multi.getParameter("category");
	String pn = multi.getParameter("pname");
	String sn = multi.getParameter("sname");
	int price = Integer.parseInt(multi.getParameter("price"));
	int dprice = Integer.parseInt(multi.getParameter("dprice"));
	int stock = Integer.parseInt(multi.getParameter("stock"));
	String des = multi.getParameter("description");
	
	long id=0;
	
	java.util.Date yymmdd = new java.util.Date();
	SimpleDateFormat myformat = new SimpleDateFormat("yy-MM-d h:mm a");
	
	String ymd = myformat.format(yymmdd);
	String sql=null;
	Connection con =null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int cnt = 0;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
	}catch(ClassNotFoundException e){
		e.printStackTrace();
	}
	
	try{
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/member","hkitJeongwon","gj0123");
		
		sql="select max(id) from product where category=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, cat);
		rs=pstmt.executeQuery();
		rs.next();
		id = rs.getLong(1);
		
		if(id==0)
			id=Integer.parseInt(cat+"00001");
		else
			id= id+1;
		
		Enumeration files = multi.getFileNames();
		String fname1 = (String) files.nextElement();
		String filename1 = multi.getFilesystemName(fname1);
		String fname2 = (String) files.nextElement();
		String filename2 = multi.getFilesystemName(fname2);
		
		if(filename2 == null)
			filename2=filename1;
		sql = "insert into product(id,category,wname,pname,sname,price,downprice,inputdate,stock,small,large,description) values(?,?,?,?,?,?,?,?,?,?,?,?)";
		pstmt=con.prepareStatement(sql);
		pstmt.setLong(1, id);
		pstmt.setString(2, cat);
		pstmt.setString(3, wn);
		pstmt.setString(4, pn);
		pstmt.setString(5, sn);
		pstmt.setInt(6, price);
		pstmt.setInt(7, dprice);
		pstmt.setString(8, ymd);
		pstmt.setInt(9, stock);
		pstmt.setString(10, filename2);
		pstmt.setString(11, filename1);
		pstmt.setString(12, des);
		cnt = pstmt.executeUpdate();
		
		if(cnt > 0)
			out.println("상품을 등록했습니다.");
		else
			out.println("상품이 등록되지 않았습니다.");
		
		pstmt.close();
		con.close();
		
	}catch(SQLException e){
		System.out.println("2번째");
		e.printStackTrace();
	}
	%>
	<p>
	<a href="product_list.jsp">[상품 목록으로]</a> &nbsp;
	<a href="product_write.html">[상품 올리는 곳으로]</a>
	
