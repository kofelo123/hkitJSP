<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="spms.vo.Member"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%!
	public static class Mymember {
		int no;
		String name;

		public int getNo() {
			return no;
		}

		public void setNo(int no) {
			this.no = no;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

	}
	%>
	<%
		Mymember member = new Mymember();
		member.setNo(100);
		member.setName("홍길동");
		pageContext.setAttribute("memer", member);
	%>

	${member.name}
	<br>
	<c:set target="${member }" property="name" value="임꺽정" />
	${member.name }
	<br>

</body>
</html>