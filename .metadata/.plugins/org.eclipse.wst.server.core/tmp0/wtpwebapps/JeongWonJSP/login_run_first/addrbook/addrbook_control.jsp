<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="jspbook.addrbook.*"%>
    
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="ab" scope="page" class="jspbook.addrbook.AddrBean" />
<jsp:useBean id="addrbook" class="jspbook.addrbook.AddrBook" />
<jsp:setProperty name="addrbook" property="*" />

<%
	String action = request.getParameter("action");
	if(action.equals("list")){//리스트
		 request.setAttribute("datas",  ab.getDBList());//Arraylist타입으로 가져와서 "datas"에 저장후 
		 pageContext.forward("addrbook_list.jsp");// addrbook_list.jsp로 객체를 뿌려준다.
		
	}else if(action.equals("insert")){
		if(ab.insertDB(addrbook)){
			response.sendRedirect("addrbook_control.jsp?action=list");
		}
		else
			throw new Exception("DB 입력 오류");
		
	}else if(action.equals("edit")){//수정시
		AddrBook abook = ab.getDB(addrbook.getAb_id());
		if(!request.getParameter("upasswd").equals("1234")) {
			out.println("<script>alert('비밀번호가 틀렸습니다.!!');history.go(-1);</script>");
		}else{
			request.setAttribute("ab", abook);
			pageContext.forward("addrbook_edit_form.jsp");//pageContext.forward를 통해 request객체 를 가지고 edit_form으로 뿌린다.
		}
		
	}else if(action.equals("update")){//update와 delete는 request 객체를 담아서 전달할것이 없어서 그냥 response.sendRedirect한다.
		if(ab.updateDB(addrbook)){
			response.sendRedirect("addrbook_control.jsp?action=list");
		}else
			throw new Exception("DB 갱신오류");
		
	}else if(action.equals("delete")){
		if(ab.deleteDB(addrbook.getAb_id())){
			response.sendRedirect("addrbook_control.jsp?action=list");
		}else
			throw new Exception("DB 삭제 오류");
		
	}else {
		
	}
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>