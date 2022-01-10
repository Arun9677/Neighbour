package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.transform.Templates;

import DAO.Bean;
import DAO.EmpImpl;

/**
 * Servlet implementation class SignIn
 */
@WebServlet("/SignIn")
public class SignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignIn() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		Bean bean = new Bean();
		bean.setUsername(request.getParameter("siName"));
		bean.setPassword(request.getParameter("siPass"));
		
		HttpSession session = request.getSession(true);
		session.setAttribute("Name", request.getParameter("siName"));
		
		boolean check;
		
		EmpImpl impl = new EmpImpl();
		check = impl.SignIn(bean);
		
		if(check)
		{
			response.sendRedirect("EmployPage.html");
		}
		else {
			response.sendRedirect("EmployPasswordMismatch.html");
		}
		
	}

}
