/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.36
 * Generated at: 2017-08-16 07:35:41 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;
import java.text.*;

public final class list_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("java.text");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

final java.lang.String _jspx_method = request.getMethod();
if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
return;
}

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');
 request.setCharacterEncoding("utf-8"); 
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write(" <meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<script>\r\n");
      out.write("\tfunction check(id){\r\n");
      out.write("\t\t\tpass = prompt('수정/삭제시 비밀번호입력');\r\n");
      out.write("\t\t\tlocation.href=\"addr_modify.jsp?id=\"+id+\"&pass=\"+pass;\r\n");
      out.write("\t\t}\r\n");
      out.write("\r\n");
      out.write("\tfunction search(){\r\n");
      out.write("\t\twith(document.search){\r\n");
      out.write("\t\t\tif(val.value.length == 0){\r\n");
      out.write("\t\t\t\talert(\"검색어를 입력해 주세요!!\");\r\n");
      out.write("\t\t\t\tval.focus();\r\n");
      out.write("\t\t\t\treturn false;\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\tdocument.search.submit();\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("<div align=\"center\">\r\n");
      out.write("<h1>주소록:목록화면</h1>\r\n");
      out.write("<hr>\r\n");
      out.write("<a href=\"addr_insert.jsp\">주소록 등록</a><br><br>\t\t\r\n");
      out.write("<form method=\"post\" name=\"search\" action=\"list.jsp\">\r\n");
      out.write("<tr>\r\n");
      out.write("\t<td align=\"right\" width=\"241\">\r\n");
      out.write("\t\t<select name=\"search\">\r\n");
      out.write("\t\t\t<option value=\"name\">이름\r\n");
      out.write("\t\t\t<option value=\"company\">회사\r\n");
      out.write("\t\t\t<option value=\"memo\">메모\r\n");
      out.write("\t\t\t<option value=\"nameMemo\">이름+메모\r\n");
      out.write("\t\t</select>\r\n");
      out.write("\t</td>\r\n");
      out.write("\t<td width=\"127\" align=\"center\">\r\n");
      out.write("\t\t<input type=\"text\" size=\"17\" name=\"val\">\r\n");
      out.write("\t</td>\r\n");
      out.write("\t<td width=\"115\"><input type=\"button\" value=\"검색\" onClick=\"search();\"></a></td>\r\n");
      out.write("\t\r\n");
      out.write("</tr>\r\n");
      out.write("\r\n");
      out.write("</form>\r\n");
      out.write("<table width=\"800\" border='1' style=\"text-align:center;background-color:#7ec6ef;color:white;border-color:blue;\">\r\n");
      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t<td>번호</td>\r\n");
      out.write("\t<td>이 름</td>\r\n");
      out.write("\t<td>전화번호</td>\r\n");
      out.write("\t<td>생 일</td>\r\n");
      out.write("\t<td>회 사</td>\r\n");
      out.write("\t<td>메 모</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t");

	Vector id= new Vector();
	Vector name= new Vector();
	Vector phonenum= new Vector();
	Vector birthday= new Vector();
	Vector company= new Vector();
	Vector memo= new Vector();
	Vector email=new Vector();
	
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
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql="";
	String searchSql="";
	String val="";
	String searchVal="";
	try{
		Class.forName("com.mysql.jdbc.Driver");
	}catch(ClassNotFoundException e){
		e.printStackTrace();
	}
	
	try{
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/addr","hkitJeongwon","gj0123");
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	try{
		val=request.getParameter("val");
		System.out.println("val="+val);
		if(val != null){
			searchVal=request.getParameter("search");
			switch(searchVal){
			case "name":
				searchSql=" where name ='"+val+"'";
				break;
			case "company":
				searchSql=" where company='"+val+"'";
				break;
			case "memo":
				searchSql=" where memo like '%"+val + "%'";
				break;
			case "nameMemo":
				searchSql=" where name ='"+val+"'";
				searchSql=searchSql+" or memo like '%"+val + "%'";
				break;
			}
		}
		sql="select * from addrbook"+ searchSql +" order by id desc";
		pstmt=con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(!(rs.next())){
			out.println("주소록 데이터가 존재하지 않습니다.");
		}
		do{
			id.addElement(rs.getString("id"));
			name.addElement(rs.getString("name"));
			phonenum.addElement(rs.getString("phonenum"));
			birthday.addElement(rs.getString("birthday"));
			company.addElement(rs.getString("company"));
			memo.addElement(rs.getString("memo"));
			email.addElement(rs.getString("email"));
		}while(rs.next());
		totalrows = id.size();
		totalpages = (totalrows-1)/maxrows +1;
		startrow = (where-1) * maxrows;
		endrow=startrow+maxrows-1;
		if(endrow >= totalrows)
			endrow=totalrows-1;
		totalgroup = (totalpages-1)/maxpages +1;
		if(endpage>totalpages)
			endpage=totalpages;
		
		for(int j=startrow; j<=endrow;j++){
		out.println("<tr>");
		out.println("<td>");																											
		
      out.write("  \r\n");
      out.write("\t\t<a href=\"javascript:check(");
      out.print( id.elementAt(j));
      out.write(")\" style='text-decoration:none'>");
      out.print( id.elementAt(j));
      out.write("</a></td>\r\n");
      out.write("\t\t");

		out.println("<td>");
		out.println(name.elementAt(j)+"</td>");
		out.println("<td>");
		out.println(phonenum.elementAt(j)+"</td>");
		out.println("<td>");
		out.println(birthday.elementAt(j)+"</td>");
		out.println("<td>");
		out.println(company.elementAt(j)+"</td>");
		out.println("<td>");
		out.println(memo.elementAt(j)+"</td>");
		out.println("</tr>");
		}
		out.println("</table>");
		rs.close();
		pstmt.close();
		con.close();
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	if(wheregroup > 1){
		
		out.print("[<a href=list.jsp?gogroup=1&val="+val+"&search="+searchVal+">처음</a>]");
		out.print("[<a href=list.jsp?gogroup="+priorgroup+"&val="+val+"&search="+searchVal+">이전</a>]");
	}else{
		System.out.println("where group:"+wheregroup);
		out.println("[처음]");
		out.println("[이전]"); }
	
	
	if(id.size() !=0){
		for(int jj=startpage; jj<=endpage; jj++){
			if(jj==where){
				System.out.println("j-value:"+jj);
				System.out.println("where:"+where);
				out.println("["+jj+"]");
				
			}
			else{
				out.print("<a href=list.jsp?go="+jj+"&val="+val+"&search="+searchVal+">["+jj+"]</a>");
		}
		
		}
	}
	if(wheregroup < totalgroup){
		out.print("[<a href=list.jsp?gogroup=" + nextgroup+"&val="+val+"&search="+searchVal+">다음</a>]");
		out.print("[<a href=list.jsp?gogroup="+ totalgroup+"&val="+val+"&search="+searchVal+">마지막</a>]");
	}else{
		out.println("[다음]");
		out.println("[마지막]");
	}
	out.println("전체 방명록수 :"+totalrows);


      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
