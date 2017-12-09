<%@ page
	import="library.dao.BookDAO"
	import="library.model.Book"
	import="library.model.BookControl"
	import="library.dao.BookControlDAO"
	import="java.util.ArrayList"
	import="library.enums.BookStatus"
	import="library.dao.BookControlDAO" %>

<form method=post action=control>
	<table class="table">
		<thead>
			<th>Título</th>
			<th>Autor</th>
			<th>Ação</th>
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
						<td><button type="submit" name=command value=Approve class="btn btn-default">Aprovar</button></td>
						
						<input type=hidden name="isbn" value= <% out.print(book.getIsbn()); %>>
						<input type=hidden name="code" value= <% out.print(book.getCode()); %> >
					</tr>
					<%
				}
			}
			
			%>
		</tbody>
	</table>
</form>