<%@page 
	import="library.dao.BookDAO"
	import="library.model.Book"
	import="java.util.ArrayList"
 	language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>Gerenciamento de livros</title>

		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="resources/css/style.css">
	</head>
	
	<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
		<nav class="navbar navbar-default navbar-fixed-top">
		<%	Integer role = (Integer) request.getAttribute("role");	%>
			<div class="container">
							<form method=post action=control>
							<button class="btn btn-link pull-right" name=command type=Submit value="Logout">Sair</button>						
							</button></form></li>

				<a class="navbar-brand" href="#myPage">Logo</a>
			</div>
			<div class="container">
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav navbar-right">
						<li><a><form method=post action=control><button class="btn btn-link" >Biblioteca</button><input type=hidden name=command value=ListBooks>
						<input type=hidden name=role value=<% out.print(role); %>>
						</form></a></li>
						
						<!-- TEMP -->
						<li><a><form method=post action=control><button class="btn btn-link" >BorrowBook</button><input type=hidden name=command value=BorrowBook>
						<input type=hidden name=role value=<% out.print(role); %>>
						<input type=hidden name=isbn value=123>
						<input type=hidden name=code value=1>
						<input type=hidden name=cpf value='3'>
						</form></a></li>
						
						<li><a><form method=post action=control><button class="btn btn-link" >RenewBorrow</button><input type=hidden name=command value=RenewBorrow>
						<input type=hidden name=role value=<% out.print(role); %>>
						<input type=hidden name=isbn value=123>
						<input type=hidden name=code value=1>
						<input type=hidden name=cpf value='3'>
						</form></a></li>
						
						
						<%
						if(role == null){

							
						}else if(role == 1){
						out.print("<li><a><form method=post action=control>");
						out.print("<button class=\"btn btn-link\" type=Submit>Doações</button>");
						out.print("<input type=hidden name=command value=getPending>");
						out.print("<input type=hidden name=role value=" + role + ">");
						out.print("</form></a></li>");
						out.print("<li><a><form method=post action=control>");
						out.print("<button class=\"btn btn-link\" type=Submit>Cadastrar livro</button>");
						out.print("<input type=hidden name=command value=Donate>");
						out.print("<input type=hidden name=role value=" + role + ">");
						out.print("</form></a></li>");
						}else if (role == 3){
							out.print("<li><a><form method=post action=control>");
							out.print("<button class=\"btn btn-link\" type=Submit>Doar Livro</button>");
							out.print("<input type=hidden name=command value=Donate>");
							out.print("<input type=hidden name=role value=" + role + ">");
							out.print("</form></a></li>");
						}
						%>
					</ul>
				</div>
			</div>
		</nav>
		

		<div class="container" style="margin-top: 150px">
		<% 		
	       	String message = (String) request.getAttribute("message");
	       	String alert = (String) request.getAttribute("alert");
	       	if(message != null && alert != null){
	       		out.println("<div class=\"" + alert + "\">" + message + "</div>");
	       	}
        %>
			<div class="col-xs-8" style="margin-bottom: 20px;">
				<div class="col-xs-11">
					<input 	type="text" 
							id="search-books" 
							class="form-control"
							placeholder="Pesquisar livro..." />
				</div>
				
				<button type="button" class="btn btn-default ">
					<span class="glyphicon glyphicon-search" />
				</button>
			</div>
		</div>
		
<div id="post-wrapper" class="post-wrapper clearfix" style="margin: 0 auto; min-width: 800px; max-width: 1600px;">

	<%
	String email = request.getSession().getAttribute("user").toString();
	out.println("Olar: " + email);
	Integer status = (Integer) request.getAttribute("status");
	if(status == null){
		status = 2;
	}
	ArrayList<Book> books = BookDAO.getBooks(status);
	String imageNotFound = "resources/images/notFound.gif";
	
	if(books != null){
		for(Book book : books){
			out.print("<div class=book>");
			out.print("<img src="+ (book.getImgUrl() != null ? book.getImgUrl() : imageNotFound) + ">");
			out.print("<div class=info>");
			out.print("<div class=title>" + book.getTitle() + "</div>");
			out.print("<div class=author>" + book.getAuthor() + "</div>");
			out.print("<div class=description>" + book.getDescription() + "</div>");
			if(role != null && role == 1){
				out.print("<div align=center>" 
					+ "<form method=post action=control><button title=Editar type=Submit class=\"btn btn-link\"><span class=\"glyphicon glyphicon-pencil\"></span></button>"
					+ "<input type=hidden name=command value=EditBook>"
					+ "<input type=hidden name=isbn value=" + book.getIsbn() + "></form>"
					+ "</div>");
				out.print("<div align=center>" 
						+ "<form method=post action=control><button title=Remover type=Submit class=\"btn btn-link\"><span class=\"glyphicon glyphicon-trash\"></span></button>"
						+ "<input type=hidden name=command value=DeleteBook>"
						+ "<input type=hidden name=isbn value=" + book.getIsbn() + "></form>"
						+ "</div>");
				/*out.print("<div align=center style=\"margin-left:100px\">");
				out.print("<div style=\"float: left;\"><form method=post action=control><button title=Editar type=Submit class=\"btn btn-link\"><span class=\"glyphicon glyphicon-pencil\"></span></button>");
				out.print("<input type=hidden name=command value=EditBook>");
				out.print("<input type=hidden name=isbn value=" + book.getIsbn() + "></form></div>");
				out.print("</span><span style=\"float:left\">");
				out.print("<div style=\"float: left;\"><form method=post action=control><button title=Remover type=Submit class=\"btn btn-link\"><span class=\"glyphicon glyphicon-trash\"></span></button>");
				out.print("<input type=hidden name=command value=DeleteBook>");
				out.print("<input type=hidden name=isbn value=" + book.getIsbn() + "></form></span></div>");
				if(status == 1){
					out.print("<div style=\"float: left;\"<form method=post action=control><button title=Aprovar type=Submit class=\"btn btn-link\"><span class=\"glyphicon glyphicon-check\"></span></button>");
					out.print("<input type=hidden name=command value=Approve>");
					out.print("<input type=hidden name=isbn value=" + book.getIsbn() + "></form></div>");
				}
				out.print("</div>");*/
			}
			out.print("</div></div>");
		}
	}
	%>

</div>

			
			
			<!-- <table class="table">
				<thead>
					<tr>
						<th>Id</th>
						<th>Título</th>
						<th>Autor</th>
						<th>Ação</th>
					</tr>
				</thead>
				<tbody>
				<% /*
					Integer status = (Integer) request.getAttribute("status");
					if(status == null){
						status = 2;
					}					
					ArrayList<Book> books = BookDAO.getBooks(status);					
					
					if(books != null){
						for(Book book : books){
							if(book != null){
								out.println("<tr>");
								out.println("<td>" + book.getIsbn() + "</td>");
								out.println("<td>" + book.getTitle() + "</td>");
								out.println("<td>" + book.getAuthor() + "</td>");
								out.print("<td><span style=\"float:left\">");
								if(role == 1){
								out.print("<form method=post action=control><button title=Editar type=Submit class=\"btn btn-link\"><span class=\"glyphicon glyphicon-pencil\"></span></button>");
								out.print("<input type=hidden name=command value=EditBook>");
								out.print("<input type=hidden name=isbn value=" + book.getIsbn() + "></form>");
								out.print("</span><span style=\"float:left\">");
								out.print("<form method=post action=control><button title=Remover type=Submit class=\"btn btn-link\"><span class=\"glyphicon glyphicon-trash\"></span></button>");
								out.print("<input type=hidden name=command value=DeleteBook>");
								out.print("<input type=hidden name=isbn value=" + book.getIsbn() + "></form></span>");
									if(status == 1){
									out.print("<form method=post action=control><button title=Aprovar type=Submit class=\"btn btn-link\"><span class=\"glyphicon glyphicon-check\"></span></button>");
									out.print("<input type=hidden name=command value=Approve>");
									out.print("<input type=hidden name=isbn value=" + book.getIsbn() + "></form>");
									}
								} else {
									
								}
								out.print("</td>");
								out.println("</tr>");
							}
						}
					}
				*/ %>
				</tbody>
			</table> -->
	</body>
</html>