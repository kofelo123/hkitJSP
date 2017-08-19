<%@page import="jspbook.login.MemberDto"%>
<%@page import="jspbook.login.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	MemberDao dao = MemberDao.getInstance(); //객체생성
	int checkNum = dao.userCheck(id, pw); // db에 일치하는 아이디 비밀번호 있는지 검사해서 3가지경우(데이터가  없을때,비밀번호다를때,정상)로 나눈다.
	if(checkNum == -1) { 
%>
		<script language="javascript">
			alert("아이디가 존재하지 않습니다.");
			history.go(-1);
		</script>
<%
	} else if(checkNum == 0) {
%>
		<script language="javascript">
			alert("비밀번호가 틀립니다.");
			history.go(-1);
		</script>
<%
	} else if(checkNum == 1) {
		MemberDto dto = dao.getMember(id);//정보가져오는것
		
		if(dto == null) {//정보를 못가져왔을때, 아이디 비밀번호가 일치했는데 dto를 못가져오는것은 어떤 경우인지?
%>
		<script language="javascript">
			alert("존재하지 않는 회원 입니다.");
			history.go(-1);
		</script>
<%
		} else { //완전한 성공적일때 세션에 set하고  main.jsp으로 이동.
			String name = dto.getName();
			session.setAttribute("id", id);
			session.setAttribute("name", name);
			session.setAttribute("ValidMem", "yes");//정상로그인이후 세션 살아있을때 까지 로그인 다시하지않고 바로 로그인.
			response.sendRedirect("main.jsp");
		}
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