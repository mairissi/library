package library.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.dao.BookDAO;
import library.model.Book;

public class getDetails implements Command {
	
	public String execute(HttpServletRequest request,
			HttpServletResponse response)
				throws Exception {
		Integer isbn = Integer.parseInt(request.getParameter("isbn"));
		if(isbn != null) {
			request.setAttribute("isbn", isbn);		
			return "bookDescription.jsp";
		}
		return "bookList.jsp";
	}
}
