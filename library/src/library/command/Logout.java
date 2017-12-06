package library.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Logout implements Command {
	
	public String execute(HttpServletRequest request,
			HttpServletResponse response)
				throws Exception {
		request.getSession().setAttribute("user", null);
		request.setAttribute("currentUser", 0);
		request.setAttribute("status", null);
		return "allBooks.jsp";
	}

}
