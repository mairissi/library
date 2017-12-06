<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<%@include file="header.jsp" %>
	
	<div class="container" style="margin-top: 150px">
		
		<% Object role = request.getSession().getAttribute("role"); %>
		
		<table class="table">
			<thead>
				<tr>
					<th>Título</th>
					<th>Autor</th>
					
					<% 
					
					if (role != null) {
						int roleInt = Integer.parseInt(role.toString());
						
						if (roleInt == 1) {
							out.print("<th>Ação</th>");
						} else if (roleInt == 2) {
							out.print("<th>Devolução</th>");
							out.print("<th>Ação</th>");
							out.print("<th style=\"text-align:center\">Renovações</th>");
						} else if (roleInt == 3) {
							out.print("<th>Status</th>");
						}
					}
					
					%>
					
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>O Guia do Mochileiro das Galáxias</td>
					<td>Douglas Adams</td>
					
					<% 
					
					if (role != null) {
						int roleInt = Integer.parseInt(role.toString());
						
						if (roleInt == 1) {
							out.print("<td><td><button type=\"button\" class=\"btn btn-default\">Editar</button></td></td>");
							out.print("<td><td><button type=\"button\" class=\"btn btn-default\">Excluir</button></td></td>");
						} else if (roleInt == 2) {
							out.print("<td>27/11/2017</td>");
							out.print("<td><button type=\"button\" class=\"btn btn-default\">Renovar</button></td>");
							out.print("<td style=\"text-align:center\">1/3</td>");
						} else if (roleInt == 3) {
							out.print("<td>Aceito</td>");
						}
					}
					
					%>
					
				</tr>
				<tr>
					<td>O Oceano no Fim do Caminho</td>
					<td>Neil Gaiman</td>
					
					<% 
					
					if (role != null) {
						int roleInt = Integer.parseInt(role.toString());
						
						if (roleInt == 1) {
							out.print("<td><td><button type=\"button\" class=\"btn btn-default\">Editar</button></td></td>");
							out.print("<td><td><button type=\"button\" class=\"btn btn-default\">Excluir</button></td></td>");
						} else if (roleInt == 2) {
							out.print("<td>30/11/2017</td>");
							out.print("<td><button type=\"button\" class=\"btn btn-default disabled\">Renovar</button></td>");
							out.print("<td style=\"text-align:center\">3/3</td>");
						} else if (roleInt == 3) {
							out.print("<td>Pendente</td>");
						}
					}
					
					%>
		
				</tr>
			</tbody>
		</table>
	</div>

</body>
</html>