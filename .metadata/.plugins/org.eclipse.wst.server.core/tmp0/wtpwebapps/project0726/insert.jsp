<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="insert" errorPage="error.jsp" import="java.sql.*,java.text.*,java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<%
	String userid = request.getParameter("userid");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String securitynum1 = request.getParameter("securitynum1");
	String securitynum2 = request.getParameter("securitynum2");
	String securitynum = securitynum1+"-"+securitynum2;
	String email = request.getParameter("email");
	String zipcode1 = request.getParameter("zipcode1");
	String zipcode2 = request.getParameter("zipcode2");
	String zipcode = zipcode1+"-"+zipcode2;
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String phone = phone1+"-"+phone2+"-"+phone3;
	String query = new String();
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	int check_count = 0;
	
	java.util.Date yymmdd = new java.util.Date();
	SimpleDateFormat myformat = new SimpleDateFormat("YY-MM-d h:mm a");
	String regdate = myformat.format(yymmdd);
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
	}catch(ClassNotFoundException e){
		out.println(e);
	}
	
	try{
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/member","hkitJeongwon","gj0123");
		stmt = conn.createStatement();
		query = "insert into member values (?,?,?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, userid);
		pstmt.setString(2, username);
		pstmt.setString(3, password);
		pstmt.setString(4, securitynum1+"-"+securitynum2);
		pstmt.setString(5, email);
		pstmt.setString(6, zipcode1+"-"+zipcode2);
		pstmt.setString(7, address1);
		pstmt.setString(8, address2);
		pstmt.setString(9, phone1+"-"+phone2+"-"+phone3);
		pstmt.setString(10, regdate);
		pstmt.executeUpdate();
	}catch(SQLException e){
		out.println("<script>alert('가입처리가 되지 않았습니다. 다시 시도해 주세요.');history.back();</script>");
	}finally{
		conn.close();
	}
%>

<html>
	<head>
		<title>가입 완료</title>
		
	</head>
	
	<body text="#000000" bgcolor="#FFFFFF">
	<br>
	<br>
	<form name="join" method="post" action="modify.jsp">
		<input type="hidden" name="userid" value="<%=userid %>">
		<input type="hidden" name="mode" value="modify">
		<table width="500" border="1" bordercolorlight="#999999" bordercolordark="#FFFFFF" cellpadding="3" cellspacing="0" align="center" class="style2">
			<tr align="center">
				<td colspan="2">가입을 축하드립니다. 입력하신 내용을 확인하세요.</td>
			</tr>
			<tr>
				<td width="15%" align="right">아이디</td>
				<td width="75%"><%=userid %></td>
			</tr>
			
			<tr>
				<td width="15%" align="right">이름</td>
				<td width="75%"><%=username %></td>
			</tr>
			<tr>
				<td width="15%" align="right">비밀번호</td>
				<td width="75%">보안상 기재 X</td>
			</tr>
			
			<tr>
				<td width="15%" align="right">주민등록번호</td>
				<td width="75%"><%=securitynum1+"-"+securitynum2 %></td>
			</tr>
			
			<tr>
				<td width="15%" align="right">EMAIL</td>
				<td width="75%"><%=email %></td>
			</tr>
			
			<tr>
				<td width="15%" align="right">우편번호</td>
				<td width="75%"><%=zipcode1+"-"+zipcode2%></td>
			</tr>
			
			<tr>
				<td width="15%" align="right">주소1</td>
				<td width="75%"><%=address1 %></td>
			</tr>
			
			<tr>
				<td width="15%" align="right">주소2</td>
				<td width="75%"><%=address2%></td>
			</tr>
			
			<tr>
				<td width="15%" align="right">휴대폰</td>
				<td width="75%">
			
			
			<%
				if(phone.equals("--")){
					out.println("<font color='blue'>선택하지 않았습니다.</font>");
				}else{
					out.println(phone);
				}
			%>
			</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="확 인" onClick="location='left_Frame.jsp'">
					<input type="button" value="수 정" onClick="doSubmit()"></td>
			</tr>
		</table>
	</form>
	
	</body>
</html>