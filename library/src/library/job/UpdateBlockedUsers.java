package library.job;

import java.util.Calendar;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import library.dao.BlockedUsersDAO;
import library.dao.BookControlDAO;
import library.dao.BookDAO;
import library.enums.BookStatus;
import library.model.BlockedUser;
import library.model.Book;
import library.model.BookControl;

public class UpdateBlockedUsers implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		// As tasks executam sempre que o servlet é iniciado. Depois disso, é executada
		// automaticamente depois que o delay ocorre.
		executeAtMidnight();
	}
	
	private void executeEveryMinute() {
		Timer timer = new Timer();
		Calendar date = Calendar.getInstance();
		date.set(
				Calendar.DAY_OF_WEEK,
				Calendar.SUNDAY
				);
		date.set(Calendar.HOUR, 0);
		date.set(Calendar.MINUTE, 0);
		date.set(Calendar.SECOND, 0);
		
		long executeEveryMinute = 1000 * 60;
		
		timer.schedule(
			new UpdateBlockedUsersTask(),
			date.getTime(),
			executeEveryMinute
		);	
	}
	
	private void executeAtMidnight() {
		Timer timer = new Timer();
		Calendar date = Calendar.getInstance();
		date.set(
				Calendar.DAY_OF_WEEK,
				Calendar.SUNDAY
				);
		date.set(Calendar.HOUR, 23);
		date.set(Calendar.MINUTE, 59);
		date.set(Calendar.SECOND, 59);
		
		long executeEvery24hours = 1000 * 60 * 60 * 24;
		
		timer.schedule(
			new UpdateBlockedUsersTask(),
			date.getTime(),
			executeEvery24hours
		);	
	}
}

class UpdateBlockedUsersTask extends TimerTask {
	
	private BlockedUsersDAO blockedDAO;
	private BookControlDAO bookControlDAO;
	private BookDAO bookDAO;
	
	public UpdateBlockedUsersTask() {
		this.blockedDAO = new BlockedUsersDAO();
		this.bookControlDAO = new BookControlDAO();
		this.bookDAO = new BookDAO();
	}
	
	@Override
	public void run() {
		System.out.println("Atualizando usuários bloqueados...");
		List<BookControl> expiredBooks = bookControlDAO.getExpired();
		
		for (BookControl expiredBook : expiredBooks) {
			boolean isUserAlreadyBlocked = blockedDAO.isBlocked(expiredBook.getUserCpf());
			int bookStatus = bookDAO.getStatus(expiredBook.getIsbn(), expiredBook.getCode());
			boolean isBookBorrowed = bookStatus == BookStatus.BORROWED.id();
			boolean isBookReserved = bookStatus == BookStatus.RESERVED.id();
			
			Book book = new Book();
			book.setIsbn(expiredBook.getIsbn());
			book.setCode(expiredBook.getCode());
			
			if ((!isUserAlreadyBlocked) && (isBookBorrowed)) {
				BlockedUser blockedUser = new BlockedUser();
				
				blockedUser.setBlockDate(Calendar.getInstance().getTimeInMillis());
				blockedUser.setCpf(expiredBook.getUserCpf());
				blockedUser.setBlockReason("Data de devolução expirada.");
				
				blockedDAO.add(blockedUser);
			} else if (isBookReserved) {
				bookDAO.updateStatus(book, BookStatus.AVAILABLE.id());				
			}
		}
	}
}