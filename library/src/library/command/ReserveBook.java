package library.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.dao.BookControlDAO;
import library.dao.BookDAO;
import library.enums.BookStatus;
import library.model.Book;
import library.model.BookControl;

public class ReserveBook extends BookControlCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		BookControl control = createBookControlFromRequest(request);
		BookControlDAO dao = getDao();
		
		String message = "Erro ao realizar reserva.";
		String alertType = "alert alert-danger";
		String returnPage = "allBooks.jsp";
		
		if (control.getCode() != -1) {
			if (canReserveBook(control)) {
				if (dao.add(control)) {
					
					Book book = new Book();
					book.setIsbn(control.getIsbn());
					book.setCode(control.getCode());
					
					BookDAO.updateStatus(book, BookStatus.RESERVED.id());
					
					message = "Reserva realizada com sucesso!";
					alertType = "alert alert-success";
				}
			}
			else {
				message = "O usuário informado não pode realizar mais reservas.";
			}
		}
		else {
			message = "Este livro não está disponível para reserva.";
		}
		
		request.setAttribute("alert", alertType);
		request.setAttribute("message", message);
		
		return returnPage;
	}
	
	@Override
	protected BookControl createBookControlFromRequest(HttpServletRequest request) {
		BookControl bc = super.createBookControlFromRequest(request);
		bc.setExpireDate(getExpireDateForReservation());
		bc.setRenewalNumber(0);
		bc.setCode(BookDAO.getFirstAvailableCode(bc.getIsbn()));
		
		return bc;
	}	
}
