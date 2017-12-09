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
			<th>T�tulo</th>
			<th>Autor</th>
			<th>A��o</th>
		</thead>
		<tbody>
			<%
			
			ArrayList<Book> books = new ArrayList();
			
			for (Book book : books) {
				if (book.getStatus() == BookStatus.PENDING.id()) {
					%>
					<tr>
						<td><% out.print(book.getTitle()); %></td>
						<td><% out.print(book.getAuthor()); %></td>
						<form method=post action=control>
						<td><button type="submit" name=command value=Approve class="btn btn-default">Aprovar</button></td>
						
						<input type=hidden name="isbn" value= <% out.print(book.getIsbn()); %>>
						<input type=hidden name="code" value= <% out.print(book.getCode()); %> >
						</form>
					</tr>
					<%
				}
			}
			
			%>
		</tbody>
	</table>
