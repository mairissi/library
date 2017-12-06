package library.control;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import library.command.Command;

/**
 * Servlet implementation class ControleServlet
 */
@WebServlet("/control")
public class ControleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		updateSessionPath(request.getSession());
		
		String getCommand = request.getParameter("command");
		String commandName = "library.command." + getCommand;
		try {
			Command command = (Command) Class.forName(commandName).newInstance();
			String view = command.execute(request, response);
			request.getRequestDispatcher(view).
							forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	private void updateSessionPath(HttpSession session) {
		if (session != null && session.getAttribute("realPath") == null) {
			session.setAttribute("realPath", getServletContext().getRealPath("/"));
		}
	}
	
}
