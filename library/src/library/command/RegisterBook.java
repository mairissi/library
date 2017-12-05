package library.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.dao.BookDAO;
import library.enums.BookStatus;
import library.enums.Roles;
import library.model.Book;

public class RegisterBook extends BookCommand {
	
	public String execute(HttpServletRequest request,
			HttpServletResponse response)
				throws Exception {
		
		Book book = createBookFromRequest(request);
		
//		int quantity = Integer.parseInt(request.getParameter("quantity"));
		int role = Integer.parseInt(request.getParameter("role"));
		
		
		int status;
		if(role == Roles.ADMIN.id()) {
			status = BookStatus.AVAILABLE.id();
		}else {
			status = BookStatus.PENDING.id();
		}
		
		if (BookDAO.addBook(book, status)) {
			System.out.println("Sucess!");
			request.setAttribute("alert", "alert alert-success");
			request.setAttribute("message", "Livro cadastrado com sucesso!");
			request.setAttribute("role", role);
			return "allBooks.jsp";
		}
		else {
			request.setAttribute("role", role);
			request.setAttribute("alert", "alert alert-danger");
			request.setAttribute("message", "Erro ao cadastrar livro.");
			return "registerBook.jsp";
		}		
	}

}
