<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title> 
</head>
<body>
<%

	session = request.getSession();
	String[] a = session.getValueNames();
	out.println("세션 ID : " + session.getId()+"<BR>");
	out.println("세션 유지 시간: " +session.getMaxInactiveInterval()+"<BR>");
	if(a.length == 0){
		session.putValue(session.getId(), "A");
	}else{
		String what = (String)session.getValue(a[0]);
		out.println("이름 :"+a[0] + " 값:"+what+"<BR>");
		session.putValue(session.getId(), what+"A");
	}
	
%>


<a href=sessionTest125.jsp>다시읽기</a>
</body>
</html>