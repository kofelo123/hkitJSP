<%@page import="addr.dao.AddrDAO"%>
<%@page import="addr.dto.AddrDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*,addr.*"%>
<jsp:useBean id="addrDaoBean" class="addr.dao.AddrDAO" ></jsp:useBean>
<jsp:useBean id="addrDtoBean" class="addr.dto.AddrDTO" ></jsp:useBean>
<jsp:setProperty name="addrDtoBean" property="*"></jsp:setProperty>

<%
	String action = request.getParameter("action");

		
	if(action.equals("list")){
		request.setAttribute("datas", addrDaoBean.getAddressList());
		pageContext.forward("new_list.jsp");
	}else if(action.equals("searchList")){
		String category=request.getParameter("category");
		String keyword=request.getParameter("keyword");
		String searchSql ="";
		switch(category){
		case "name":
			searchSql=" where name ='"+keyword+"'";
			break;
		case "company":
			searchSql=" where company='"+keyword+"'";
			break;
		case "memo":
			searchSql=" where memo like '%"+keyword + "%'";
			break;
		case "nameMemo":
			searchSql=" where name ='"+keyword+"'";
			searchSql=searchSql+" or memo like '%"+keyword + "%'";
			break;
		}
		request.setAttribute("datas", addrDaoBean.getSearchAddressList(searchSql));
		pageContext.forward("new_list.jsp");
	}else if(action.equals("insertForm")){
		pageContext.forward("new_insert.jsp");
	}else if(action.equals("save")){
		addrDaoBean.insertData(addrDtoBean);	
		response.sendRedirect("new_controller.jsp?action=list");
	}else if(action.equals("modify")){
		int id=addrDtoBean.getId();
		 addrDtoBean=addrDaoBean.selectById(String.valueOf(id));
		 System.out.println("addrDtoBean 테스트:"+addrDtoBean);
		 request.setAttribute("addrDtoBean", addrDtoBean);
		 pageContext.forward("new_modify.jsp");
	}else if(action.equals("update")){
   		 addrDaoBean.updateBean(addrDtoBean);
		 response.sendRedirect("new_controller.jsp?action=list"); 
	}else if(action.equals("delete")){
	 	addrDaoBean.deleteById(String.valueOf(addrDtoBean.getId()));
		response.sendRedirect("new_controller.jsp?action=list"); 
	}


%>
