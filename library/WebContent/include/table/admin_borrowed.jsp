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
			<th>CPF</th>
			<th>Ação</th>
		</thead>
		<tbody>
			<%
			ArrayList<BookControl> controls = new ArrayList();
			ArrayList<Book> books = new ArrayList();
			
			for (Book book : books) {
				for (BookControl control : controls) {
					int isbn = control.getIsbn();
					int code = control.getCode();
					
					if (book.getIsbn() == isbn && code == book.getCode()) {
						%>
						<tr>
							<td><% out.print(book.getTitle()); %></td>
							<td><% out.print(book.getAuthor()); %></td>
							<td><% out.print(control.getUserCpf()); %></td>
							<td><button type="submit" name=command value=ReturnBook class="btn btn-default">Devolver</button></td>
							
							<input type=hidden name="isbn" value= <% out.print(book.getIsbn()); %>>
							<input type=hidden name="code" value= <% out.print(book.getCode()); %> >
							<input type=hidden name=cpf value=<% out.print(control.getUserCpf()); %>>
						</tr>
						<%
					}
				}
			}
			
			%>
		</tbody>
	</table>
</form>