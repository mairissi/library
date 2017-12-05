package library.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.dao.BookDAO;
import library.enums.Roles;
import library.model.Book;

public class UpdateBook extends BookCommand {
	
	public String execute(HttpServletRequest request,
			HttpServletResponse response)
				throws Exception {

		Book book = createBookFromRequest(request);
		
		if (BookDAO.updateBook(book)) {
			System.out.println("Sucess!");
			request.setAttribute("alert", "alert alert-success");
			request.setAttribute("message", "Livro atualizado com sucesso!");
			request.setAttribute("role", Roles.ADMIN.id());
			
			return "allBooks.jsp";
		}
		else {
			request.setAttribute("alert", "alert alert-danger");
			request.setAttribute("message", "Erro ao atualizar livro.");
			return "registerBook.jsp";
		}		
	}

}
