package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Bean;
import DAO.EmpImpl;

/**
 * Servlet implementation class EmploySignUp
 */
@WebServlet("/EmploySignUp")
public class EmploySignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmploySignUp() {
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
		// TODO Auto-generated method stub
		doGet(request, response);
		
		Bean bean = new Bean();
		bean.setUsername(request.getParameter("euname"));
		bean.setPassword(request.getParameter("epwd"));
		bean.setCPassword(request.getParameter("econpwd"));
		bean.setName(request.getParameter("eName"));
		bean.setGender(request.getParameter("eGender"));
		bean.setAddress(request.getParameter("eAddress"));
		bean.setArea(request.getParameter("eArea"));
		bean.setCity(request.getParameter("eCity"));
		bean.setState(request.getParameter("eState"));
		bean.setMobile(request.getParameter("eMobile"));
		
		boolean pass = true;
		int a;
		
		EmpImpl impl = new EmpImpl();
		pass = impl.passsCheck(bean);
		if(pass)
		{
			a = impl.EmploySignUp(bean);
			if(a!=0)
			{
				response.sendRedirect("EmploySignIn.html");
			}
		}
		else
		{
			response.sendRedirect("EmployCPassMismatch.html");				
		}
		
	}

}
