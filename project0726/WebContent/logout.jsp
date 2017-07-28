<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" import="java.io.*,java.text.*"%>
<%
	session=request.getSession(false);
	session.invalidate();
	response.sendRedirect("left_Frame.jsp");
%>
<script language="javascript">
	
</script>
