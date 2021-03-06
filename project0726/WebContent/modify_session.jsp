<%@ page language="java" contentType="text/html; charset=UTF-8" errorPage="error.jsp" import="java.sql.*,java.io.*,java.net.*,java.util.*,java.text.*"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<%
	Connection conn = null;
	Statement stmt= null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	String mode = request.getParameter("mode");
	//변경부분
/* 	String userid = request.getParameter("userid"); */
	String userid = (String)session.getAttribute("member_id");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String securitynum1 = request.getParameter("securitynum1");
	String securitynum2 = request.getParameter("securitynum2");
	String email = request.getParameter("email"); 
	String zipcode1 = request.getParameter("zipcode1"); 
	String zipcode2 = request.getParameter("zipcode2"); 
	String address1  = request.getParameter("address1"); 
	String address2 = request.getParameter("address2"); 
	String phone1 = request.getParameter("phone1"); 
	String phone2 = request.getParameter("phone2"); 
	String phone3 = request.getParameter("phone3"); 
	String securitynum = new String(); 
	String query = new String();
	String selected = new String();
	StringTokenizer st_securitynum = null;
	StringTokenizer st_zipcode = null;
	StringTokenizer st_phone = null;
	
	java.util.Date yymmdd = new java.util.Date();
	SimpleDateFormat myformat = new SimpleDateFormat("yy-MM-d h:mm a");
	String regdate = myformat.format(yymmdd);
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
	}catch(ClassNotFoundException e){
		out.println(e);
	}
	
	try{
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/member","hkitJeongwon","gj0123");
		stmt = conn.createStatement();
		if(mode.equals("null") || mode.equals("modify")){
			query = "select * from member where userid='"+userid+"'";
			rs = stmt.executeQuery(query);
			
			if(rs.next()){
				username = rs.getString("username");
				password = rs.getString("password");
				
				st_securitynum = new StringTokenizer(rs.getString("securitynum"),"-");
				email = rs.getString("email");
				st_zipcode = new StringTokenizer(rs.getString("zipcode"), "-");
				address1 = rs.getString("address1");
				address2 = rs.getString("address2");
				st_phone = new StringTokenizer(rs.getString("phone"),"-");
				
			if(st_securitynum.hasMoreTokens()){
				securitynum1 = st_securitynum.nextToken();
			}
			
			if(st_securitynum.hasMoreTokens()){
				securitynum2 = st_securitynum.nextToken();
			}
			
			if(st_zipcode.hasMoreTokens()){
				zipcode1 = st_zipcode.nextToken();
			}
			if(st_zipcode.hasMoreTokens()){
				zipcode2 = st_zipcode.nextToken();
			}
			if(st_phone.hasMoreTokens()){
				phone1 = st_phone.nextToken();
			}
			if(st_phone.hasMoreTokens()){
				phone2 = st_phone.nextToken();
			}
			if(st_phone.hasMoreTokens()){
				phone3 = st_phone.nextToken();
			}
			
		}
			rs.close();
			mode = "update";
		}else if(mode.equals("update")){
			query ="update member set username=?, password=?, email=?, zipcode=?, address1=?, address2=?, phone=? where userid='" + userid + "'";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			pstmt.setString(3, email);
			pstmt.setString(4, zipcode1+"-"+zipcode2);
			pstmt.setString(5, address1);
			pstmt.setString(6, address2);
			pstmt.setString(7, phone1+"-"+phone2+"-"+phone3);
			pstmt.executeUpdate();
			response.sendRedirect("left_Frame.jsp");
			}
		}catch(SQLException e){
			
	}finally{
		conn.close();
	}
%>
<!DOCTYPE html>
<html>
<head>
<title>회원정보 수정</title>
<script>
	function MM_openBrWindow(theURL,winName,features){
			window.open(theURL,winName,features);
		}
	function doSubmit(){
		form = document.join;
		if(!form.username.value){
			alert('이름을 입력하지 않았습니다.');
			form.username.focus();
			return;
			}
		if(!form.email.value){
			alert('Email을 입력하지 않았습니다.');
			form.email.focus();
			return;
			}
		if(!form.email.value.indexOf("@") < 0){
			alert('Email주소 형식이 틀립니다.');
			form.email.focus();
			return;
			}
		if(!form.email.value.indexOf(".") < 0){
			alert('Email주소 형식이 틀립니다.');
			form.email.focus();
			return;
			}
		if(!form.zipcode1.value || !form.zipcode2.value){
			alert('우편번호를 입력하지 않았습니다.');
			MM_openBrWindow('zipcode_search.jsp','zipcode_search','scrollbars=yes,width=500,height=250');
			return;
		}
		if(!form.address1.value){
			alert('주소1를 입력하지 않았습니다.');
			MM_openBrWindow('zipcode_search.jsp','zipcode_search','scrollbars=yes,width-500,height=250');
			return;
			}
		if(!form.address2.value){
			alert('주소2를 입력하지 않았습니다.');
			form.address2.focus();
			return;
			}
		form.submit();
			}
</script>

</head>
<body bgcolor="#FFFFFF" text="#000000">
<div align="center">
	<form name="join" method="post" action="modify_session.jsp">
		<table width="622" height="536" border="1" cellspacing="0" cellpadding="0" bordercolor="#A3C2F6">
			<tr>
				<td width="15%" align="right"><font color="#FF0000" class="style2"><font color="#FF0000" size=1>★</font></font><font class="style2">아이디&nbsp;
				&nbsp;</font></td>
				<td width="75%">&nbsp;
					<input type="text" name="userid" size="10" maxlength="10" class="box" value="<%=userid %>" readonly></font></font></td>
				</tr>
				
			<tr>
				<td width="15%" align="right"><font color="#FF0000" size=1>★</font><font class="style2">비밀번호&nbsp;&nbsp;</font></td>
				<td width="75%">&nbsp;
					<input type="text" name="password" size="12" maxlength="12" class="box" value="<%=password %>"><font class="style2">다시한번&nbsp;&nbsp;
					</font>
					<input type="password" name="password2" size="12" maxlength="12" class="box" value="<%=password %>">
					<font class="style2">(영문+숫자 4~12자리)</font></td>
			</tr>
			<tr>
				<td width="15%" align="right"><font color="#FF0000" size=1>★</font><font class="style2">이름&nbsp;
				&nbsp;</font></td>
				<td width="75%">&nbsp;
					<input type="text" name="username" size="10" maxlength="10" class="box" value="<%=username%>"></td>
			</tr>				
			<tr>
						<td width="15%" align="right"><font color="#FF0000" size=1>★</font><font class="style2">주민등록번호&nbsp;&nbsp;</font>
						<td width="75%">&nbsp;<input type="text" name="securitynum1" size="6" maxlength="6" class="box" value="<%=securitynum1 %>" readonly>-
						<input type="text" name="securitynum2" size="7" maxlength="7" class="box" value="<%=securitynum2 %>" readonly></td>
					</tr>
					<tr>
						<td width="15%" align="right"><font color="#FF0000" size=1>★</font><font class="style2">EMAIL&nbsp;&nbsp;</font>
						<td width="75%"><input type="text" name="email" size="20" maxlength="50" class="box" value="<%=email %>"></td>
					</tr>
					<tr>
						<td width="15%" align="right"><font color="#FF0000" size=1>★</font><font class="style2">우편번호&nbsp;&nbsp;</font>
						<td width="75%"><input type="text" name="zipcode1" size="3" maxlength="3" class="box" readonly value="<%=zipcode1%>"> -
						<input type="text" name="zipcode2" size="3" maxlength="3" class="box" readonly value="<%=zipcode2%>">
						<input type="button" name="button" value="우편번호검색" onClick="MM_openBrWindow('zipcode_search.jsp','zipcodesearch','scrollbars=yes,width=500,height=250')">
						<font color="#0099FF" > 우편번호 검색 버튼을 누르세요.</font></td>
					</tr>
					<tr>
						<td width="15%" align="right"><font color="#FF0000" size=1>★</font><font class="style2">주소&nbsp;&nbsp;</font>
						<td width="75%">&nbsp;<input type="text" name="address1" size="50" maxlength="100" class="box" readonly value="<%=address1%>"></td>
					</tr>
					<tr>
						<td width="15%" align="right"><font color="#FF0000" size=1>★</font><font class="style2">나머지주소&nbsp;&nbsp;</font></td>
						<td width="75%">&nbsp;<input type="text" name="address2" size="50" maxlength="100" class="box" value="<%=address2 %>"></td>
					</tr>
					<tr>
						<td width="15%" align="right"><font class="style2">휴대폰&nbsp;&nbsp;</font></td>
						<td width="75%">&nbsp;
						<input type="text" name="phone1" size="4" maxlength="4" class="box" value="<%=phone1%>"> -
						<input type="text" name="phone2" size="4" maxlength="4" class="box" value="<%=phone2%>"> -
						<input type="text" name="phone3" size="4" maxlength="4" class="box" value="<%=phone3%>"> </td>
					</tr>
				</table>
				<br/>
				<table width="614" border="0" cellspacing="0" cellpadding="0" align="center">
					<tr>
						<td width=100% align="center">
							<input type="hidden" name="mode" value="update">
							<input type="button" value="등 록" onClick="doSubmit()">&nbsp;
							<input type="button" value="취 소" onClick="javascript:history.go(-1);">
						</td>
					</tr>
		</table>
	</form>
	</td></tr></table>
</div>
	<div align="center">
	<table border="0" cellpadding="0" cellspacing="0" width="639">
		<tr>
			<td width="180">
				<table border="0" cellpadding="0" cellspacing="0" width="180">
				<tr>
					<td bgcolor="#FECE00" width="44" nowrap>&nbsp;</td>
					<td bgcolor="#FFFFFF" width="1" nowrap>&nbsp;</td>
					<td bgcolor="#FE8C14" width="44" nowrap>&nbsp;</td>
					<td bgcolor="#FFFFFF" width="1" nowrap>&nbsp;</td>
					<td bgcolor="#8CCA2D" width="44" nowrap>&nbsp;</td>
					<td bgcolor="#FFFFFF" width="1" nowrap>&nbsp;</td>
					<td bgcolor="#4DAACE" width="44" nowrap>&nbsp;</td>
					<td bgcolor="#FFFFFF" width="1" nowrap>&nbsp;</td>
				</tr>
	</table>
	</td>
	<td bgcolor="#A8A8A8" width="453">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="2" height="1"></td>
	</tr>
	</table>
	<table width="638" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td bgcolor="#FFFFFF" width="638" nowrap><p align="center"><br>
			Copyright by JeongWon JSP STUDY</p></td>
		</tr>
	</table>
</div>
</body>
</html>

