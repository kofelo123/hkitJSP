<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<!-- html식 주석: 이것은 출력되지 않는다. 브라우저에서 "소스 보기"를 하면 보인다.  -->
<%-- JSP식 주석: 이것도 출력되지 않는다. 브라우저에서 "소스보기"를 해도 보이지 않는다.		 --%>

<%
  //자바식 주석: 한 줄만 주석으로 처리된다.
  //out.print("한 줄씩 주석 처리할 때 사용한다.");

 /*
 	자바식 주석: 이 범위에 포함되는 코드들은 수행되지 않는다.
 	out.print("하나");
 	out.print("둘");
 	out.print("셋");
 	여러 줄을 주석 처리 할 떄 사용한다.
 */
 
 out.print("주석 처리가 되지 않은 코드는 수행됩니다.");
%>
</body>
</html>