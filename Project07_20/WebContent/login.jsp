<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<script>
	function trim(str) {
		return str.replace(/^\s*|\s*$/g, "");
	}
	function check() {
		with (document.loginForm) {

			if(!trim(id.value)){
					alert("아이디를 입력해주세요.");
					id.focus();
					return false;
				}
			
			if(!trim(pw.value)){
					alert("비밀번호를 입력해주세요.");
					pw.focus();
					return false;
				}
			
			if(!trim(repw.value)){
					alert("비밀번호재확인을 입력해주세요.");
					repw.focus();
					return false;
				}
			if(!trim(name.value)){
					alert("이름을 입력해주세요.");
					name.focus();
					return false;
				}
			if(!trim(email.value)){
					alert("이메일을 입력해주세요.");
					email.focus();
					return false;
				}
			if(!trim(call.value)){
					alert("전화번호를 입력해주세요.");
					call.focus();
					return false;
				}
			
			if(pw.value!=repw.value){
				alert("비밀번호 재확인이 동일하지 않습니다.");
				repw.focus();
				return false;
			}
			document.loginForm.submit();
		}

	}
</script>
</head>
<body style="background:#eef5a3">
	<form name="loginForm" method="post" action="main.jsp">
		<table border="1" style="border-collapse:collapse;border:3px gray solid;" >
			<tr>
				<td colspan="2" align="center" style="background:#ad5537;color:white;font-weight:bold;">회원가입</td>
			</tr>
			<tr>
				<td style="font-weight:bold;">아이디</td>
				<td><input type="text" name="id" size="10px"></td>
			</tr>
			<tr>
				<td style="font-weight:bold;">패스워드</td>
				<td><input type="password" name="pw" size="10px"></td>
			</tr>
			<tr>
				<td style="font-weight:bold;">패스워드 확인</td>
				<td><input type="password" name="repw" size="10px"></td>
			</tr>
			<tr>
				<td style="font-weight:bold;">이름</td>
				<td><input type="text" name="name" size="10px"></td>
			</tr>
			<tr>
				<td style="font-weight:bold;">이메일</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td style="font-weight:bold;">전화번호</td>
				<td><input type="text" name="call" size="15px"></td>
			</tr>
			<tr>
				<td colspan="2" style="padding-left:20%;"><input type="button" onClick="check()" value="회원가입">&nbsp;&nbsp;<input
					type="reset" value="다시쓰기"></td>
			</tr>
		</table>
	</form>
</body>
</html>