<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<% request.setCharacterEncoding("UTF-8"); %>  
<!DOCTYPE html>
<html>
<head>
<script language="javascript">
function check(){
	with(document.wnth){
		if(name.value.length == 0){
			alert("이름을 입력해 주세요!!");
			name.focus();
			return false;
		}
		if(phonenum.value.length == 0){
			alert("번호를 입력해 주세요!!");
			pnum.focus();
			return false;
		}
		if(birthday.value.length == 0){
			alert("생일을 입력해 주세요!!");
			birth.focus();
			return false;
		}
		document.wnth.submit();
	}
}	
function del(id){
    result = confirm("정말 삭제하시겠습니까?");
    if(result==true)
   location.href="juso_delete.jsp?id="+id;
 }
</script>
<title>Insert title here</title>
</head>
<body>
<%
String sql = null;
Connection con = null;
PreparedStatement st = null;
ResultSet rs = null;

int id = Integer.parseInt(request.getParameter("id"));

try {
	Class.forName("com.mysql.jdbc.Driver"); 
} catch (ClassNotFoundException e) {
	out.println(e);
}

try {
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/addr","hkitJeongwon","gj0123");
} catch (SQLException e) {
	out.println(e);
}

try {
	sql = "select * from addrbook where id = ? ";
	  st = con.prepareStatement(sql);
	  st.setInt(1, id);
	  rs = st.executeQuery();
	
	if (!(rs.next())) {
		out.println("해당 내용이 없습니다");
	} else {
%>
<center>
<h1>주소록 : 수정-삭제 화면</h1>
<br>
<br>
<form name="wnth" method=post action="juso_update.jsp" >
<table table width="350" cellspacing="0"  border=1>
<tr>
<th width=30% height =40>이름</th>
<td><input type=text name=name size=30 value=<%=rs.getString("name")%>></td>
</tr>
<tr>
<th width=30% height =40>email</th>
<td><input type=text name=email size=30 value=<%=rs.getString("email")%>></td>
</tr>
<tr>
<th width=30% height =40>전화번호</th>
<td><input type=text name=phonenum size=30 value=<%=rs.getString("phonenum")%>></td>
</tr>
<tr>
<th width=30% height =40>생일</th>
<td><input type=text name=birthday size=30 value=<%=rs.getString("birthday")%>></td>
</tr>
<tr>
<th width=30% height =40>회사</th>
<td><input type=text name=company size=30 value=<%=rs.getString("company")%>></td>
</tr>
<tr>
<th width=30% height =40>메모</th>
<td><input type=text name=memo size=30 value=<%=rs.getString("memo")%>></td>
</tr>
<input type=hidden name=id value=<%=rs.getInt("id") %>>
<tr>
<td colspan="2" align="center">
<input type="button" value="　　수정　　" onClick="check();">&nbsp;
<input type="button" value="　　취소　　" onClick="javascript:history.go(-1)">&nbsp;
<input type="button" value="　　삭제　　" onClick="del(<%=id%>);">
</tr>
</table>
</form>
</center>
<%
	}
	rs.close();
	st.close();
	con.close();
} catch (SQLException e) {
	out.println(e);
}
%>

</body>
</html>