package com.cal;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Calculator
 */
@WebServlet("/CS")
public class Calculator extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Calculator() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int val1=Integer.parseInt(request.getParameter("val1"));
		String option=request.getParameter("option");
		int val2=Integer.parseInt(request.getParameter("val2"));
		
		PrintWriter out = response.getWriter();
		
		switch (option) {
		case "add":
			out.println("ADD->"+val1+"+"+val2+"="+(val1+val2));
			break;
		case "sub":
			out.println("SUV->"+val1+"-"+val2+"="+(val1-val2));
			break;
		case "mul":
			out.println("MUL->"+val1+"*"+val2+"="+(val1*val2));
			break;
		case "div":
			out.println("DIV-"+val1+"/"+val2+"="+(val1/val2));
			break;
		
		}
	}

}
