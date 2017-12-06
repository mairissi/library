package library.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.dao.BookDAO;
import library.model.Book;

public class RegisterBook extends BookCommand {
	
	public String execute(HttpServletRequest request,
			HttpServletResponse response)
				throws Exception {
		
		Book book = createBookFromRequest(request);
		
		processRequest(request, response);
		return "registerBook.jsp";
//		if (BookDAO.addBook(book, 1)) {
//			System.out.println("Sucess!");
//			request.setAttribute("alert", "alert alert-success");
//			request.setAttribute("message", "Livro cadastrado com sucesso!");
//			return "allBooks.jsp";
//		}
//		else {
//			request.setAttribute("alert", "alert alert-danger");
//			request.setAttribute("message", "Erro ao cadastrar livro.");
//			return "registerBook.jsp";
//		}		
	}

}
