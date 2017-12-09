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
			<th>Ação</th>
		</thead>
		<tbody>
			<%
			
			ArrayList<Book> books = new ArrayList();
			
			books = BookDAO.getBooks(1);			
			
			for (Book book : books) {
				if (book.getStatus() == BookStatus.PENDING.id()) {
					%>
					<tr>
						<td><% out.print(book.getTitle()); %></td>
						<td><% out.print(book.getAuthor()); %></td>
						<td>
							<form method=post action=control>
								<button type="submit" name=command value=Approve class="btn btn-default btn-list">Aprovar</button>						
								<input type=hidden name="isbn" value= <% out.print(book.getIsbn()); %>>
							</form>
							<form method=post action=control>
								<button type="submit" name=command value=getDetails class="btn btn-default btn-list">Ver detalhes</button>						
								<input type=hidden name="isbn" value= <% out.print(book.getIsbn()); %>>
							</form>
							<form method=post action=control>
								<button type="submit" name=command value=DeleteBook class="btn btn-default btn-list">Rejeitar</button>						
								<input type=hidden name="isbn" value= <% out.print(book.getIsbn()); %>>
							</form>
						</td>
					</tr>
					<%
				}
			}
			
			%>
		</tbody>
	</table>
