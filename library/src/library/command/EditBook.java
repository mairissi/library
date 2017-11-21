package library.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.dao.BookDAO;
import library.model.Book;

public class EditBook implements Command {
	
	public String execute(HttpServletRequest request,
			HttpServletResponse response)
				throws Exception {
		String isbn = request.getParameter("isbn");
		Book book = BookDAO.getBook(Integer.parseInt(isbn));
		request.setAttribute("title", book.getTitle());
		request.setAttribute("author", book.getAuthor());
		request.setAttribute("isbn", book.getIsbn());
		request.setAttribute("publisher", book.getPublisher());
		request.setAttribute("quantity", book.getQuantity());
		request.setAttribute("description", book.getDescription());
		request.setAttribute("imgurl", book.getImgUrl());
		return "registerBook.jsp";
	}
}
