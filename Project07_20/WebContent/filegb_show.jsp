<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<link href="style.css" rel="stylesheet" type="test/css">
<title>Insert title here</title>
</head>
<body>

<%
	File board_file = new File("C:/pro/write.txt");
	String s =null;
	
	try{
		FileReader in1 = new FileReader(board_file);
		BufferedReader in2 = new BufferedReader(in1);
		while((s=in2.readLine()) != null){
			out.println(s);
		}
		in2.close();
		
	}catch(IOException e){
		out.println(e.getMessage());
	}
%>
<center>
	<a href="filegb_write3.html"><img src="image/write.gif" width="54" height="19" border=0 ></a><
</center>

</body>
</html>