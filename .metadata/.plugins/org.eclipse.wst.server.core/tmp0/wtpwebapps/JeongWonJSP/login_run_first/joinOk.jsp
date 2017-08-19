<%@page import="java.sql.Timestamp"%>
<%@page import="jspbook.login.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dto" class="jspbook.login.MemberDto"/>
<jsp:setProperty name="dto" property="*" /><!-- *로 모두 넣기 위해서는 DTO의 각변수명이 폼의 변수명이 일치해야한다. -->
<%
		dto.setrDate(new Timestamp(System.currentTimeMillis()));//회원가입 한 날짜와 시간을 저장하는 setter 서버에서 입력받는거라 따로 set한다
		MemberDao dao = MemberDao.getInstance();
		if(dao.confirmId(dto.getId()) == MemberDao.MEMBER_EXISTENT) {//이미존재하는 아이디인지 검사 - db에서 dto의 아이디를 검색해서 있는지
%>
		<script language="javascript">
			alert("아이디가 이미 존재 합니다.");
			history.back();
		</script>
<%
		} else {
			int ri = dao.insertMember(dto);
			if(ri == MemberDao.MEMBER_JOIN_SUCCESS) { //insert성공시에  세션설정한다.
				session.setAttribute("id", dto.getId());
%>
			<script language="javascript">
				alert("회원가입을 축하 합니다.");
				document.location.href="login_First_Run.jsp";
			</script>
<%
			} else {
%>
			<script language="javascript">
				alert("회원가입에 실패했습니다.");
				document.location.href="login_First_Run.jsp.jsp";
			</script>
<%
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