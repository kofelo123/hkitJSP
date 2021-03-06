<%@page import="addr.dto.AddrDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="addr.*,java.util.*"%>
<jsp:useBean id="addrDaoBean" class="addr.dao.AddrDAO" scope="page"></jsp:useBean>
<jsp:useBean id="datas" scope="request" class="java.util.Vector" /> 

<%
	String keyword=request.getParameter("keyword");
	String category=request.getParameter("category");

	int where = 1;
	int totalgroup=0;
	int maxpages=5;
	int startpage=1;
	int endpage=startpage+maxpages-1;
	int wheregroup=1;

	if(request.getParameter("go") != null){ //페이지번호 링크를 누를때 go값 전달됨. -> where로 저장.
		where = Integer.parseInt(request.getParameter("go"));
		wheregroup = (where-1)/maxpages + 1;
		startpage=(wheregroup-1) * maxpages+1;
		endpage=startpage+maxpages-1;
	}else if (request.getParameter("gogroup") != null){//다음,이전,처음 ,마지막 링크누를시에 gogroup값 전달 -> wheregroup을 gogroup값을 변경한다.
		wheregroup = Integer.parseInt(request.getParameter("gogroup"));
		startpage=(wheregroup-1) * maxpages+1;
		where = startpage;
		endpage=startpage+maxpages-1;
	}
	
	int nextgroup = wheregroup + 1;
	int priorgroup = wheregroup-1;
	int startrow=0;
	int endrow=0;
	int maxrows=5;
	int totalrows=0;
	int totalpages=0;
	
	totalrows = datas.size();
	totalpages = (totalrows-1)/maxrows +1;
	startrow = (where-1) * maxrows;
	endrow=startrow+maxrows-1;
	if(endrow >= totalrows)
		endrow=totalrows-1;
	totalgroup = (totalpages-1)/maxpages +1;
	if(endpage>totalpages)
		endpage=totalpages;

%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script>
function check(id){
	pass = prompt('수정/삭제시 비밀번호입력');
	if(pass != 1234){
		alert('비밀번호 입력실패');
		}
	else
	location.href="new_controller.jsp?action=modify&id="+id;
}
function search(){
	with(document.search){
		if(keyword.value.length == 0){
			alert("검색어를 입력해 주세요!!");
			keyword.focus();
			return false;
			}
			document.search.submit();
		}
	}
	
</script>
</head>
<body>
	<a href="new_controller.jsp?action=insertForm">주소록등록</a>
	<form method="get" name="search" action="new_controller.jsp">
<tr>
	<td align="right" width="241">
		<select name="category">
			<option value="name">이름
			<option value="company">회사
			<option value="memo">메모
			<option value="nameMemo">이름+메모
		</select>
	</td>
	<td width="127" align="center">
		<input type="text" size="17" name="keyword">
	</td>
	<td width="115"><input type="button" value="검색" onClick="search();"></a></td>
</tr>

</form>
	<table width="800" border='1' style="text-align:center;background-color:#7ec6ef;color:white;border-color:blue;">
		<tr><th>번호</th><th>이름</th><th>전화번호</th><th>생일</th><th>회사</th><th>메모</th></tr>
		<%
			for(int i=startrow; i<=endrow;i++){
				AddrDTO adt = (AddrDTO)datas.get(i);
		%>
		<tr>
		<td><a href="javascript:check(<%=adt.getId() %>)" style='text-decoration:none'><%= adt.getId() %></a></td>
		<td><%=adt.getName() %></td>
		<td><%=adt.getPhonenum() %></td>
		<td><%=adt.getBirthday() %></td>
		<td><%=adt.getCompany() %></td>
		<td><%=adt.getMemo() %></td>
		</tr>
			<%
			}
			%>	
		
	</table>
	<%
	String action=request.getParameter("action");
	
	if(wheregroup > 1){
		
		out.print("[<a href=new_controller.jsp?action="+action+"&gogroup=1&keyword="+keyword+"&category="+category+">처음</a>]");
		out.print("[<a href=new_controller.jsp?action="+action+"&gogroup="+priorgroup+"&keyword="+keyword+"&category="+category+">이전</a>]");
	}else{
		System.out.println("where group:"+wheregroup);
		out.println("[처음]");
		out.println("[이전]"); }
	
	
	if(datas.size() !=0){
		for(int jj=startpage; jj<=endpage; jj++){
			if(jj==where){
				System.out.println("j-keywordue:"+jj);
				System.out.println("where:"+where);
				out.println("["+jj+"]");
				
			}
			else{
				out.print("<a href=new_controller.jsp?action="+action+"&go="+jj+"&keyword="+keyword+"&category="+category+">["+jj+"]</a>");
		}
		
		}
	}
	if(wheregroup < totalgroup){
		out.print("[<a href=new_controller.jsp?action="+action+"&gogroup=" + nextgroup+"&keyword="+keyword+"&category="+category+">다음</a>]");
		out.print("[<a href=new_controller.jsp?action="+action+"&gogroup="+ totalgroup+"&keyword="+keyword+"&category="+category+">마지막</a>]");
	}else{
		out.println("[다음]");
		out.println("[마지막]");
	}
	out.println("전체 방명록수 :"+totalrows);
	
	%>

</body>
</html>