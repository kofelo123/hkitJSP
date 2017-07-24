/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.36
 * Generated at: 2017-07-24 08:03:59 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class select_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("\r\n");
 request.setCharacterEncoding("utf-8"); 
      out.write("\r\n");
      out.write("\r\n");

	String id = request.getParameter("id");
	String password = request.getParameter("password").trim();
	String sql="select * from woori where id=?";
	Connection con = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		
	}catch(ClassNotFoundException e){
		out.println(e.getMessage());
	}
	try{
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hkit_jsp","hkitJeongwon","gj0123");
	}catch(SQLException e){
		out.println(e);
	}
	
	try{
		pst = con.prepareStatement(sql);
		pst.setString(1, id);
		
		rs = pst.executeQuery();
		
		if(!(rs.next())) {
      out.write("\r\n");
      out.write("\t\t\t해당되는 회원이 없습니다.\r\n");
      out.write("\t\t");
 } else
		{
			if(password.equals(rs.getString("password"))) { 
      out.write("\r\n");
      out.write("\t\t\t사용자 ID가 ");
      out.print( id );
      out.write(" 인 회원의 정보는 다음과 같습니다.\r\n");
      out.write("\t\t\t정보를 변경하려면 내용을 입력한 다음 <수정하기> 버튼을 누르세요.\r\n");
      out.write("\t\t\t<form name=\"form1\" method=\"post\" action=\"update.jsp\">\r\n");
      out.write("\t\t\t<input type=\"hidden\" name=\"id\" value=\"");
      out.print(id);
      out.write("\">\r\n");
      out.write("\t\t\t<br>이름 :\r\n");
      out.write("\t\t\t<input type=\"text\" name=\"name\" value=\"");
      out.print(rs.getString("name"));
      out.write("\">\r\n");
      out.write("\t\t\t<BR>E-mail :\r\n");
      out.write("\t\t\t<input type=\"text\" name=\"email\" value=\"");
      out.print(rs.getString("email"));
      out.write("\">\r\n");
      out.write("\t\t\t<input type=\"submit\" name=\"change\" value=\"수정하기\">\r\n");
      out.write("\t\t\t<a href=\"delete.jsp?id=");
      out.print(id);
      out.write("\"> 삭제하기</a>\r\n");
      out.write("\t\t\t</form>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t");
 } else { 
      out.write("\r\n");
      out.write("\t\t\t비밀번호가 틀립니다.\r\n");
      out.write("\t\t\t");
 }
		}
		rs.close();
		con.close();
		pst.close();
		}catch(SQLException e){
			out.println(e);
	}


      out.write("\r\n");
      out.write("<a href=\"main.html\"> 메인으로</a>&nbsp;\r\n");
      out.write("<a href=\"select.html\"> 조회페이지로</a>\r\n");
      out.write("\r\n");
      out.write("\r\n");
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
