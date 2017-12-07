<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Perguntas Mais Frequentes</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="resources/js/functions.js"></script>
</head>

<body>
	<%@include file="header.jsp" %>
    <form class="form-horizontal" style="margin-top: 150px" method=post action=control>
		<%
			String message = (String) request.getAttribute("message");
			String alert = (String) request.getAttribute("alert");
			if(message != null){
				out.println("<div align=center class=\"" + alert + "\">" + message + "</div>");
			}
		%>
	</form>
	<div class="container" style="margin-top: 150px">
		<div class="faq">
			<div class="faq_question">
				&#9658 O que � a COMUNITECA?
			</div>
			<div class="faq_answer_container">
				<div class="faq_answer">
					A COMUNITECA � um sistema de biblioteca comunit�ria desenvolvido por alunos graduandos em An�lise 
					e Desenvolvimento de Sistema do IFSP.
				</div>
			</div>		
		</div>
		<div class="faq">
			<div class="faq_question">
				&#9658 Quem pode se cadastrar?
			</div>
			<div class="faq_answer_container">
				<div class="faq_answer">
					O sistema � aberto para toda a comunidade da cidade de S�o Carlos. Se voc� ainda n�o possui um cadastro 
					� poss�vel se cadastrar
					<a href="signUp.jsp">aqui</a>.
				</div>
			</div>		
		</div>
		<div class="faq">
			<div class="faq_question">
				&#9658 Como eu realizo um empr�stimo?
			</div>
			<div class="faq_answer_container">
				<div class="faq_answer">
					Para realizar o empr�stimo basta estar conectado ao sistema e acessar a tela de �nicio. Ao escolher o 
					livro, basta clicar sobre ele para ser direcionado para a tela de detalhes, onde ser� poss�vel clicar 
					em RESERVAR.
				</div>
			</div>		
		</div>
		<div class="faq">
			<div class="faq_question">
				&#9658 Existe uma quantidade m�xima de livros que posso emprestar?
			</div>
			<div class="faq_answer_container">
				<div class="faq_answer">
					N�o existe uma quantidade m�xima de empr�stimos que um usu�rio possa realizar desde que n�o ultrapasse 
					o limite de 8 (oito) livros ao mesmo tempo. 
				</div>
			</div>		
		</div>
		<div class="faq">
			<div class="faq_question">
				&#9658 Eu posso realizar a renova��o do meu empr�stimo online?
			</div>
			<div class="faq_answer_container">
				<div class="faq_answer">
					Sim. Na sess�o do usu�rio � poss�vel vizualizar o menu "MEUS LIVROS" que mostra todos seus empr�stimos e 
					permite realizar a renova��o dos livros que ainda n�o foram devolvidos.
				</div>
			</div>		
		</div>
		<div class="faq">
			<div class="faq_question">
				&#9658 Existe um limite de renova��es que eu posso realizar do mesmo livro?
			</div>
			<div class="faq_answer_container">
				<div class="faq_answer">
					Sim. A quantidade m�xima de renova��es online s�o 3 (tr�s), por�m � poss�vel realizar um novo empr�stimo 
					do mesmo livro diretamente na COMUNITECA.
				</div>
			</div>		
		</div>
		<div class="faq">
			<div class="faq_question">
				&#9658 � poss�vel reservar um livro que est� emprestado para outro usu�rio?
			</div>
			<div class="faq_answer_container">
				<div class="faq_answer">
					Sim. A COMUNITECA possui v�rios exemplares de um mesmo livro, mas se todos estiverem emprestados � poss�vel
					realizar a "RESERVA" na tela de detalhes entrando em uma lista de espera.
				</div>
			</div>		
		</div>
		<div class="faq">
			<div class="faq_question">
				&#9658 O bot�o de RENOVAR n�o aparece. E agora?
			</div>
			<div class="faq_answer_container">
				<div class="faq_answer">
					Caso o bot�o RENOVAR n�o esteja aparecendo na tela de MEUS LIVROS podem ser as seguintes situa��es:
					<br>
					<li> J� foi atingido a quantidade m�xima de 3(tr�s) renova��es online.</li>
					<li> Algu�m reservou (entrou para a lista de espera) do livro que voc� est� tentando renovar.</li>
					<li> Voc� est� atrasado com alguma devolu��o.</li>
				</div>
			</div>		
		</div>
		<div class="faq">
			<div class="faq_question">
				&#9658 Atrasei na devolu��o. Eu preciso pagar multa?
			</div>
			<div class="faq_answer_container">
				<div class="faq_answer">
					N�o. O sistema de puni��o para atrasos em devolu��es na COMUNITECA funciona da seguinte forma:
					<li> O usu�rio ser� impedido de realizar novos empr�stimos pelo dobro 
					de dias em que esteve atraso. Exemplo: Caso voc� atrase em 10(dez) dias a devolu��o de algum dos livros, 
					o sistema te bloquear� durante 20 (vinte).</li>
					<li> Caso a sua situa��o esteja irregular na COMUNITECA, n�o ser� 
					poss�vel tamb�m realizar empr�stimos, renova��es ou reservas.</li>
				</div>
			</div>		
		</div>
	</div>
</body>

</html>