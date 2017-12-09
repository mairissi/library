<%@page import="library.enums.BookEnum"%>
<%@ page
	import="library.dao.BookDAO"
	import="library.model.Book"
	import="library.model.BookControl"
	import="library.dao.BookControlDAO"
	import="java.util.ArrayList"
	import="library.enums.BookStatus"
	import="library.dao.BookControlDAO" %>

	<table class="table">
		<thead>
			<th>Título</th>
			<th>Autor</th>
			<th>CPF</th>
			<th>Ação</th>
		</thead>
		<tbody>
			<%
			ArrayList<BookControl> controls = new ArrayList();
			ArrayList<Book> books = new ArrayList();
			
			BookControlDAO bcd = new BookControlDAO();
			
			books = BookDAO.getBooks(BookStatus.BORROWED.id());
			
			System.out.println(books.size());
			
			for (Book book : books) {
				
				String cpf = bcd.getCpf(book);
				
						%>
						<tr>
							<td><% out.print(book.getTitle()); %></td>
							<td><% out.print(book.getAuthor()); %></td>
							<td><% out.print(cpf); %></td>
							<form method=post action=control>
							<td><button type="submit" name=command value=ReturnBook class="btn btn-default">Devolver</button></td>
							
							<input type=hidden name="isbn" value= <% out.print(book.getIsbn()); %>>
							<input type=hidden name="code" value= <% out.print(book.getCode()); %> >
							<input type=hidden name=cpf value=<% out.print(cpf); %>>
							</form>
						</tr>
						<%
			}
			
			%>
		</tbody>
	</table>
