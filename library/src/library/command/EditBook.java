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
		request.setAttribute("isbn", Integer.toString(book.getIsbn()));
		request.setAttribute("publisher", book.getPublisher());
		request.setAttribute("quantity", book.getQuantity());
		request.setAttribute("description", book.getDescription());
		request.setAttribute("imgurl", book.getImgUrl());
		request.setAttribute("alert", "alert alert-success");
		request.setAttribute("message", "Livro removido com sucesso!");
		request.setAttribute("role", 1);
		
		return "registerBook.jsp";
	}
}
