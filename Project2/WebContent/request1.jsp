<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%="인코딩 방식 : " + request.getCharacterEncoding() + "<p>" %>
<%="MIME 타입  : " + request.getContentType() + "<P>" %>
<%="요청정보 길이 : " + request.getContentLength() + "<P>" %>
<%="헤어 이름 : " + request.getHeaderNames() + " <P>" %>
<%= "웹 전달 경로 : " + request.getPathInfo() + "<P>"%>
<%= "클라이언트 이름 : " + request.getRemoteHost() + "<P>" %>
<%= "클라이언트 IP 주소 : " + request.getRemoteAddr() + "<P>" %>
<%= "클라이언트 URL 경로 : " + request.getRequestURL() + "<P>" %>
<%= "전송 방식 : " + request.getMethod() + "<P>" %>
<%= "프로토콜 이름 : " +request.getProtocol() +"<P>" %>
<%= "서버 이름 : " + request.getServerName() +"<P>" %>
<%= "서버 포트 번호: " + request.getServerPort() + "<P>" %>
<%="파타메트 : " + request.getParameter("msg")%>
<%="파타메트 : " + request.getParameter("age")%>
<%= request.getContextPath() %> 