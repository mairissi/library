package library.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class getPending implements Command {
	
	public String execute(HttpServletRequest request,
			HttpServletResponse response)
				throws Exception {
			request.setAttribute("role", 1);
			request.setAttribute("status", 1);			
			return "allBooks.jsp";	
	}

}
