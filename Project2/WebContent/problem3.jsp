<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<h1>Session Example1</h1>
	<%
		if (session.getValue("id") == null) {
			out.print("세션의 시간이 경과를 하였거나 다른 이유로 연결을 할 수가 없습니다.");
		} else {
			out.print(session.getValue("id") + "님이 좋아하시는 계절과 과일은<br>" + request.getParameter("season") + "과"
					+ request.getParameter("fruit") + "입니다.<br>");
			out.print("세션 ID :" + session.getId());
			out.print("<br>" + "세션 유지 시간:" + session.getMaxInactiveInterval() + "초");
		}
	%>
</body>
</html>