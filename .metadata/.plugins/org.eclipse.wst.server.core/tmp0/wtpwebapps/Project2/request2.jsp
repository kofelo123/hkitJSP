<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String FormData="";
	for(int i=1;i<4;i++){
		FormData=request.getParameter("data"+i);
		out.print("웹 브라우저에서 받은 데이터 : " +FormData+"<br>");		
	}
	

%>
