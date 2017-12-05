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
		BookControlDAO dao = new BookControlDAO();
		
		if (dao.canBorrow(control.getUserCpf())) {
			if (dao.add(control)) {
				
				Book book = new Book();
				book.setIsbn(control.getIsbn());
				book.setCode(control.getCode());
				
				BookDAO.updateStatus(book, BookStatus.BORROWED.id());
				
				// success
				request.setAttribute("alert", "alert alert-success");
				request.setAttribute("message", "Empr�stimo realizado com sucesso!");
				return "allBooks.jsp";
			}
			
			// error
			request.setAttribute("alert", "alert alert-danger");
			request.setAttribute("message", "Erro ao efetuar empr�stimo.");
			
			return "allBooks.jsp";
		}
		
		// error
		request.setAttribute("alert", "alert alert-danger");
		request.setAttribute("message", "O usu�rio informado n�o pode efetuar mais empr�stimos.");
		
		return "allBooks.jsp";
	}
	
	@Override
	protected BookControl createBookControlFromRequest(HttpServletRequest request) {
		BookControl bc = super.createBookControlFromRequest(request);
		bc.setRenewalNumber(0);
		bc.setExpireDate(super.getExpireDateForBorrow());
		
		return bc;
	}
}
