<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
	
	<%@include file="header.jsp" %>
			
		<div class="container" style="margin-top: 150px; margin-right: auto; margin-left: auto;">
			<div class="col-md-4" style="float: left;">
				<div class="thumbnail">
					<a href="#">
						<img 	src="img/o-ultimo-desejo.jpg" 
								class="figure-img img-fluid rounded" 
								style="width: 300px; height: 450px;" 
								alt="Nome do Livro">
					</a>
				</div>
			</div>

			<form class="col-md-8" style="float: left;" method=post action=control>
				<div style="font-size: 24px">
					O �ltimo Desejo
				</div>
				<div style="font-size: 16px; margin-bottom: 10px;">
					Andrzej Sapkowski  
				</div>

				<b>Descri��o:</b><br>
				<p>Geralt de R�via � um bruxo. Um feiticeiro cheio de ast�cia. Um matador impiedoso. Um assassino de sangue-frio treinado, desde a inf�ncia, para ca�ar e eliminar monstros. Seu �nico objetivo destruir as criaturas do mal que assolam o mundo. Um mundo em que nem todos os que parecem monstros s�o maus nem todos os que parecem anjos s�o bons.</p>

				<hr>
				
				<b>Status: </b> <b style="color: green">Dispon�vel</b>

				<br><br>
				
				<% 
					Object role = request.getSession().getAttribute("role");
				
					if (role != null) {						
						if (Integer.parseInt(role.toString()) == 1) {
							out.print("<button type=\"submit\" class=\"btn btn-default\" name=\"command\" value=\"BorrowBook\">Efetuar Empr�stimo</button>");
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