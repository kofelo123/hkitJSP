<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("ValidMem") == null) {
%>
	<jsp:forward page="login_First_Run.jsp" />
<%
	}

	String name = (String)session.getAttribute("name");
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="black">
	
	<h2 ><font color="red"><%= name %>님 안녕하세요.</font></h2>
	<h3><font color="orange">정보수정 버튼은 로그인 정보를 수정합니다, 주소록보기 버튼은 주소록 프로그램으로 넘어갑니다.</font></h3>
	<form action="logout.jsp" method="post">
		<input type="submit" value="로그아웃">&nbsp;&nbsp;&nbsp;<input type="button" value="정보수정" onclick="javascript:window.location='modify.jsp'">&nbsp;&nbsp;&nbsp;
		<input type="button" value="주소록보기" onclick="javascript:window.location='addrbook/index.jsp'"> <!-- 주소록쪽으로 이동한다 -->
	</form>

</body>
</html>