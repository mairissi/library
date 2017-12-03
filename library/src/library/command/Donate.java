package library.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Donate implements Command {
	
	public String execute(HttpServletRequest request,
			HttpServletResponse response)
				throws Exception {
		int role = Integer.parseInt(request.getParameter("role"));
		request.setAttribute("role", role);
		request.setAttribute("status", 2);
		return "registerBook.jsp";
	}

}
