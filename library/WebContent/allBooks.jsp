<%@page import="library.dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>Gerenciamento de livros</title>

		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>
	
	<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<a class="align-middle top-bar-content pull-right" href="#">Cadastrar</a>
				<a class="top-bar-content pull-right" href="#">Login</a>
				<a class="navbar-brand" href="#myPage">Logo</a>
			</div>
			<div class="container">
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#about">Home</a></li>
						<li><a href="registerBook.jsp">Mock Cadastrar Livro</a></li>
						<li><a href="#portfolio">Item 2</a></li>
						<li><a href="#pricing">Item 3</a></li>
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
			<table class="table">
				<thead>
					<tr>
						<th>Id</th>
						<th>T�tulo</th>
						<th>Autor</th>
						<th>A��o</th>
					</tr>
				</thead>
				<tbody>
				<% 
					java.util.ArrayList<library.model.Book> books = BookDAO.getBooks();
					if(books != null){
						for(library.model.Book book : books){
							if(book != null){
								out.println("<tr>");
								out.println("<form method=post action=control>");
								out.println("<td>" + book.getIsbn() + "</td>");
								out.println("<td>" + book.getTitle() + "</td>");
								out.println("<td>" + book.getAuthor() + "</td>");
								out.println("<td><input id=Edit name=command class=\"btn btn-default\" type=Submit value=EditBook></td>");
								out.println("<input type=hidden name=isbn value=" + book.getIsbn() + ">");
								out.println("</form>");
								out.println("</tr>");
							}
						}
					}
				%>
				</tbody>
			</table>
		</div>
	</body>
</html>