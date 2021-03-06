<%@page import="addr.dto.AddrDTO"%>
<%@page import="addr.dao.AddrDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<jsp:useBean id="addrDaoBean" class="addr.dao.AddrDAO"></jsp:useBean>
<jsp:useBean id="addrDtoBean" class="addr.dto.AddrDTO"></jsp:useBean>
<jsp:setProperty name="addrDtoBean" property="*"></jsp:setProperty> 
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function check(){
		with(document.insertForm){
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
			document.insertForm.submit();			
			}
		}
</script>
</head>

<body>
	
	<div align=center>
		<h1>주소록:등록화면</h1>
		<hr>
		<a href="new_controller.jsp?action=list">주소록 리스트</a><br>
		<br>
		<form name="insertForm" method="get" action="new_controller.jsp?action=save"> 
		<!-- <form name="insertForm" method="get" action="new_controller"> -->
			<table width="500" border='0' style="text-align:center;background-color:#7ec6ef;color:white;">
			<tr>
				<th>이름</th>
				<td align="left"><input type="text" name="name" placeholder="필수입력사항 입니다." ></td>			
			</tr>
			<tr>
				<th>e-mail</th>
				<td align="left"><input type="text" name="email" ></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td align="left"><input type="text" name="phonenum" placeholder="필수입력사항 입니다." ></td>
			</tr>
			<tr>
				<th>생일</th>
				<td align="left"><input type="date" name="birthday" placeholder="필수입력사항 입니다." ></td>
			</tr>
			<tr>
				<th>회사</th>
				<td align="left"><input type="text" name="company" ></td>
			</tr>
			<tr>
				<th>메모</th>
				<td align="left"><input type="text" name="memo" ></td>
			</tr>
			<input type="hidden" name="action" value="save">
			<tr>
				<td colspan="2"><input type="button" value="저장" onClick="check()">
				<input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
	</div>

</body>
</html>