package library.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.dao.BookControlDAO;
import library.dao.BookDAO;
import library.enums.BookStatus;
import library.model.Book;
import library.model.BookControl;

public class BorrowBook extends BookControlCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		BookControl control = createBookControlFromRequest(request);
		BookControlDAO dao = getDao();
		
		if (control.getCode() != -1) {
			if (canBorrowBook(control)) {
				if (dao.add(control)) {
					
					Book book = new Book();
					book.setIsbn(control.getIsbn());
					book.setCode(control.getCode());
					
					BookDAO.updateStatus(book, BookStatus.BORROWED.id());
					
					// success
					request.setAttribute("alert", "alert alert-success");
					request.setAttribute("message", "Empréstimo realizado com sucesso!");
					return "allBooks.jsp";
				}
				
				// error
				request.setAttribute("alert", "alert alert-danger");
				request.setAttribute("message", "Erro ao efetuar empréstimo.");
				
				return "allBooks.jsp";
			}
			
			// error
			request.setAttribute("alert", "alert alert-danger");
			request.setAttribute("message", "O usuário informado n�o pode efetuar mais empréstimos.");
		}
		else {
			request.setAttribute("alert", "alert alert-danger");
			request.setAttribute("message", "Esse livro não esté disponível para empréstimos.");
		}
		
		return "allBooks.jsp";
	}
	
	@Override
	protected BookControl createBookControlFromRequest(HttpServletRequest request) {
		BookControl bc = super.createBookControlFromRequest(request);
		bc.setRenewalNumber(0);
		bc.setExpireDate(super.getExpireDateForBorrow());
		bc.setCode(BookDAO.getFirstAvailableCode(bc.getIsbn()));
		
		return bc;
	}
}
