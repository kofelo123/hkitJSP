package spms.servlets;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

@SuppressWarnings("serial")
public class AppInitServlet extends HttpServlet {

	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("AppInitServlet 준비…");
		super.init(config); //super = HttpServlet 으로부터 상속받은 init()의 기능을 그대로 수행하겠다는 의미.
		try {
			ServletContext sc = this.getServletContext();
			Class.forName(sc.getInitParameter("driver"));
			Connection conn = DriverManager.getConnection(
						sc.getInitParameter("url"),
						sc.getInitParameter("username"),
						sc.getInitParameter("password"));
			
			sc.setAttribute("conn", conn);
		} catch(Throwable e) {
			throw new ServletException(e);
		}
	}
	
	@Override
	public void destroy() {
		System.out.println("AppInitServlet 마무리...");
		super.destroy();
		Connection conn = (Connection)this.getServletContext().getAttribute("conn"); 
		try {
			if (conn != null && conn.isClosed() == false) {
				conn.close();
			}
		} catch (Exception e) {}
		
	}
}
