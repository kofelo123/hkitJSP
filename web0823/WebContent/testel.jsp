<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="spms.vo.Member"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%
		pageContext.setAttribute("member", new Member()
											.setNo(100)
											.setName("홍길동")
											.setEmail("hong@test.com"));
	%>
	
	${member.name }
	<h3>값 설정 방식</h3>
	<c:set var="username1" value="홍길동"/>
	<c:set var="username2">임꺽정</c:set>
	${username1 }<br>
	${username2 }<br>
	
	<h3>기본 보관소 - page</h3>
	${pageScope.username1 }<br>
	${requestScope.username1 }<br>
	
	<h3>보관소 지정 - scope 속성</h3>
	<c:set var="username3" scope="request">일지매</c:set>
	${pageScope.username3 }<br>
	${requestScope.username3 }<br>
	
	<h3>기존의 값 덮어씀</h3>
	<% pageContext.setAttribute("username4","똘이장군"); %>
	기존 값=${username4}<br> 
	<c:set var="username4" value="주먹대장" />
	덮어쓴 값=${username4 }<br>
</body>
</html>