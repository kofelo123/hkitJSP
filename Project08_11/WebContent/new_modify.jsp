<%@page import="addr.dao.AddrDAO"%>
<%@page import="addr.dto.AddrDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*,addr.*"%>
<jsp:useBean id="addrDtoBean" scope="request" class="addr.dto.AddrDTO" />


<%request.setCharacterEncoding("utf-8"); %>
<%System.out.println(addrDtoBean); %>
<!DOCTYPE html>
<html>
 <meta charset="UTF-8">
<head>
<title>Insert title here</title>
<script>
 function del(id){
	 	result = confirm("정말 삭제하시겠습니까?");
	 	if(result==true)
		location.href="new_controller.jsp?id="+id+"&action=delete";
	 }

 function check(){
		with(document.addrForm){
			if(name.value.length == 0){
				alert("이름은 반드시 입력해야 합니다.");
				name.focus();
				return false;
				}
			if(phonenum.value.length == 0){
				alert("전화번호는 반드시 입력해야 합니다.");
				phonenum.focus();
				return false;
				}
			if(birthday.value.length == 0){
				alert("생일은 반드시 입력해야 합니다.");
				birth.focus();
				return false;
				}
			document.addrForm.submit();			
			}
		}
</script>
</head>

<body>
<div align="center">

		<h1>주소록:수정화면</h1>
		<hr>
		<a href="new_controller.jsp?action=list">주소록 리스트</a><br>
		<br>
		<form name="addrForm" method="get" action="new_controller.jsp">
		 
			<table width="500" border='0' style="text-align:center;background-color:#7ec6ef;color:white">
	
			<tr>
				<th>이름</th>
				<td align="left"><input type="text" name="name" value=<%=addrDtoBean.getName() %>></td>
			</tr>
			<tr>
				<th>e-mail</th>
				<td align="left"><input type="text" name="email" value=<%=addrDtoBean.getEmail() %> ></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td align="left"><input type="text" name="phonenum" value=<%=addrDtoBean.getPhonenum() %>></td>
			</tr>
			<tr>
				<th>생일</th>
				<td align="left"><input type="date" name="birthday" value=<%=addrDtoBean.getBirthday() %>></td>
			</tr>
			<tr>
				<th>회사</th>
				<td align="left"><input type="text" name="company" value=<%=addrDtoBean.getCompany() %>></td>
			</tr>
			<tr>
				<th>메모</th>
				<td align="left"><input type="text" name="memo" value=<%=addrDtoBean.getMemo() %>></td>
			</tr>
			<input type="hidden" name="action" value="update">
			<input type="hidden" name="id" value=<%=addrDtoBean.getId() %>>
			<tr>
				<td colspan="2" ><input type="button" value="저장" onClick="check();">
				<input type="reset" value="취소">
				<input type="button" value="삭제" onClick="del(<%=addrDtoBean.getId()%>);"></td>
			</tr>
			

		</table>
	</form>
	
</div>

</body>
</html>