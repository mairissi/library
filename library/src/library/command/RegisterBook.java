package library.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.dao.BookDAO;
import library.model.Book;

public class RegisterBook implements Command {
	
	public String execute(HttpServletRequest request,
			HttpServletResponse response)
				throws Exception {
		System.out.println("registerBook");
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
		
		BookDAO bookDAO = new BookDAO();
		if (bookDAO.addBook(book)) {
			System.out.println("Sucess!");
			request.setAttribute("mensagem", "Usuario cadastrado com sucesso!");
			
			return "allBooks.jsp";
		}
		else {
			request.setAttribute("mensagem", "Erro ao cadastrar livro.");
			return "registerBook.jsp";
		}		
	}

}
