package library.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Logout implements Command {
	
	public String execute(HttpServletRequest request,
			HttpServletResponse response)
				throws Exception {
		
		HttpSession session = request.getSession();
		session.setAttribute("user", null);
		session.setAttribute("cpf", null);
		session.setAttribute("role", null);
		
		request.setAttribute("currentUser", 0);
		request.setAttribute("status", null);
		return "allBooks.jsp";
	}

}
