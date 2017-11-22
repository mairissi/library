package library.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.dao.BookDAO;

public class DeleteBook implements Command {
	
	public String execute(HttpServletRequest request,
			HttpServletResponse response)
				throws Exception {
		int isbn = Integer.parseInt(request.getParameter("isbn"));
		
		if (BookDAO.deleteBook(isbn)) {
			System.out.println("Sucess!");
			request.setAttribute("alert", "alert alert-success");
			request.setAttribute("message", "Livro removido com sucesso!");
			request.setAttribute("role", 1);
			
			return "allBooks.jsp";
		}
		else {
			request.setAttribute("alert", "alert alert-danger");
			request.setAttribute("message", "Erro ao remover livro.");
			return "registerBook.jsp";
		}		
	}

}
