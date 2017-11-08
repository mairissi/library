package library.control;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		System.out.println("control");
		
		String getCommand = request.getParameter("command");
		String nomeClasse = "library.command." + getCommand;
		try {
			Class classe = Class.forName(nomeClasse);
			Command command = (Command) classe.newInstance();
			String view = command.execute(request, response);
			request.getRequestDispatcher(view).
							forward(request, response);
		} catch (Exception e) {
			throw new ServletException(e);
		}
		
	}

}
