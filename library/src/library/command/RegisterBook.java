package library.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.dao.BookDAO;
import library.model.Book;

public class RegisterBook implements Command {
	
	public String execute(HttpServletRequest request,
			HttpServletResponse response)
				throws Exception {
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		int isbn = Integer.parseInt(request.getParameter("isbn"));
		String publisher = request.getParameter("publisher");
		//int quantity = Integer.parseInt(request.getParameter("quantity"));
		String description = request.getParameter("description");
		Book book = new Book();
		book.setTitle(title);
		book.setAuthor(author);
		book.setIsbn(isbn);
		book.setPublisher(publisher);
		//book.setQuantity(quantity);
		book.setDescription(description);
		
		if (BookDAO.addBook(book)) {
			System.out.println("Sucess!");
			request.setAttribute("alert", "alert alert-success");
			request.setAttribute("message", "Livro cadastrado com sucesso!");
			request.setAttribute("role", 3);
			
			return "allBooks.jsp";
		}
		else {
			request.setAttribute("alert", "alert alert-danger");
			request.setAttribute("message", "Erro ao cadastrar livro.");
			return "registerBook.jsp";
		}		
	}

}
