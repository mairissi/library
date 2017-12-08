<%@ page 
	import="library.dao.BookDAO"
	import="library.model.Book"
language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
	
	<%@include file="header.jsp" %>
	
	<% 	Book book = BookDAO.getBook( (Integer) request.getAttribute("isbn")); %>
			
		<div class="container" style="margin-top: 150px; margin-right: auto; margin-left: auto;">
			<div class="col-md-4" style="float: left;">
				<div class="thumbnail">
					<a href="#">
						<img 	src="<% out.print(book.getImgUrl()); %>"
								onerror="this.src='resources/images/notFound.gif'" 
								class="figure-img img-fluid rounded" 
								style="width: 300px; height: 450px;" 
								alt="Nome do Livro">
					</a>
				</div>
			</div>

			<form class="col-md-8" style="float: left;" method=post action=control>
				<div style="font-size: 24px">
					<% out.print(book.getTitle()); %>
				</div>
				<div style="font-size: 16px; margin-bottom: 10px;">
					<% out.print(book.getAuthor()); %>
				</div>

				<b>Descrição:</b><br>
				<p><% out.print(book.getDescription()); %></p>

				<hr>
				
				<b>Status: </b> <b style="color: green"><% int status = book.getStatus();
				String avaible = "disabled";
				switch(status){
				case 1:
					out.print("Aguardando revisão");
					break;
				case 2:
					out.print("Disponível");
					avaible = "";
					break;
				case 3:
					out.print("Indispoível");
					break;
				case 4:
					out.print("Reservado");
					break;
				case 5:
					out.print("Alugado");
					break;
				default:
					out.print("Desconhecido");
				}
				
				
				%></b>

				<br><br>
				
				<% 
					Object role = request.getSession().getAttribute("role");
				
					if (role != null) {						
						if (Integer.parseInt(role.toString()) == 1) {
						%>
						<td><center>
						<div class=row style="align-content: center;">
							<div class=pull-left>
								<form method=post action=control>
									<button type=Submit class="btn btn-default btn-edit">Editar</button>
									<input type=hidden name=isbn value="<%out.print(book.getIsbn());%>">
									<input type=hidden name=command value=EditBook>
									<input type=hidden name=currentPage value="<%out.print(request.getParameter("currentPage"));%>">
								</form>
							</div>
							<% if(book.getStatus() == 1){ %>
							<div class=pull-left>
								<form method=post action=control>
									<button type=Submit class="btn btn-default btn-edit">Aceitar</button>
									<input type=hidden name=isbn value="<%out.print(book.getIsbn());%>">
									<input type=hidden name=command value=Approve>
								</form>
							</div>
							<% } %>
							<div class=pull-left>
								<form method=post action=control>
									<button type=Submit class="btn btn-default btn-edit"><%if(book.getStatus()!=1){out.print("Excluir");}else{out.print("Rejeitar");}%></button>
									<input type=hidden name=isbn value="<%out.print(book.getIsbn());%>">
									<input type=hidden name=command value=DeleteBook>
								</form>
							</div>
						</div>
						</center></td>
					<%
					} else if (Integer.parseInt(role.toString()) == 2) {
							out.print("<button type=\"submit\" class=\"btn btn-default\" name=\"command\" value=\"ReserveBook\">Reservar</button>");
							out.print("<button type=\"submit\" class=\"btn btn-default\" name=\"command\" value=\"RenewBorrow\">Renovar</button>");
						}
					}
				
				%>
				

			</form>
		</div>


	</body>
</html>