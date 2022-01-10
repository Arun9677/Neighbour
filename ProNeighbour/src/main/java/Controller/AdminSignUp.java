package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthScrollPaneUI;

import DAO.Bean;
import DAO.EmpImpl;

/**
 * Servlet implementation class SignUp
 */
@WebServlet("/AdminSignUp")
public class AdminSignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSignUp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		Bean bean = new Bean();
		bean.setUsername(request.getParameter("uname"));
		bean.setPassword(request.getParameter("pwd"));
		bean.setCPassword(request.getParameter("conpwd"));
		bean.setName(request.getParameter("Name"));
		bean.setGender(request.getParameter("Gender"));
		bean.setAddress(request.getParameter("Address"));
		bean.setArea(request.getParameter("Area"));
		bean.setCity(request.getParameter("City"));
		bean.setState(request.getParameter("State"));
		bean.setMobile(request.getParameter("Mobile"));
		
		boolean pass = true;
		
		EmpImpl impl = new EmpImpl();
		pass = impl.passsCheck(bean);
		if(pass)
		{
			impl.SignUp(bean);
			response.sendRedirect("Test.html");
		}
		else
		{
			response.sendRedirect("PasswordMismatch.html");				
		}
		
	}

}
