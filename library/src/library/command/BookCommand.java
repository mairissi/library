package library.command;

import javax.servlet.http.HttpServletRequest;

import library.model.Book;

public abstract class BookCommand implements Command {
	
	protected Book createBookFromRequest(HttpServletRequest request) {
		Book book = new Book();
		
		book.setTitle(request.getParameter("title"));
		book.setAuthor(request.getParameter("author"));
		book.setIsbn(Integer.parseInt(request.getParameter("isbn")));
		book.setPublisher(request.getParameter("publisher"));
		book.setDescription(request.getParameter("description"));
		
		return book;
	}
}
