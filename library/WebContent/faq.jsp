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
				&#9658 O que é a COMUNITECA?
			</div>
			<div class="faq_answer_container">
				<div class="faq_answer">
					A COMUNITECA é um sistema de biblioteca comunitária desenvolvido por alunos graduandos em Análise 
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
					O sistema é aberto para toda a comunidade da cidade de São Carlos. Se você ainda não possui um cadastro 
					é possível se cadastrar
					<a href="signUp.jsp">aqui</a>.
				</div>
			</div>		
		</div>
		<div class="faq">
			<div class="faq_question">
				&#9658 Como eu realizo um empréstimo?
			</div>
			<div class="faq_answer_container">
				<div class="faq_answer">
					Para realizar o empréstimo basta estar conectado ao sistema e acessar a tela de ínicio. Ao escolher o 
					livro, basta clicar sobre ele para ser direcionado para a tela de detalhes, onde será possível clicar 
					em RESERVAR.
				</div>
			</div>		
		</div>
		<div class="faq">
			<div class="faq_question">
				&#9658 Existe uma quantidade máxima de livros que posso emprestar?
			</div>
			<div class="faq_answer_container">
				<div class="faq_answer">
					Não existe uma quantidade máxima de empréstimos que um usuário possa realizar desde que não ultrapasse 
					o limite de 8 (oito) livros ao mesmo tempo. 
				</div>
			</div>		
		</div>
		<div class="faq">
			<div class="faq_question">
				&#9658 Eu posso realizar a renovação do meu empréstimo online?
			</div>
			<div class="faq_answer_container">
				<div class="faq_answer">
					Sim. Na sessão do usuário é possível vizualizar o menu "MEUS LIVROS" que mostra todos seus empréstimos e 
					permite realizar a renovação dos livros que ainda não foram devolvidos.
				</div>
			</div>		
		</div>
		<div class="faq">
			<div class="faq_question">
				&#9658 Existe um limite de renovações que eu posso realizar do mesmo livro?
			</div>
			<div class="faq_answer_container">
				<div class="faq_answer">
					Sim. A quantidade máxima de renovações online são 3 (três), porém é possível realizar um novo empréstimo 
					do mesmo livro diretamente na COMUNITECA.
				</div>
			</div>		
		</div>
		<div class="faq">
			<div class="faq_question">
				&#9658 É possível reservar um livro que está emprestado para outro usuário?
			</div>
			<div class="faq_answer_container">
				<div class="faq_answer">
					Sim. A COMUNITECA possui vários exemplares de um mesmo livro, mas se todos estiverem emprestados é possível
					realizar a "RESERVA" na tela de detalhes entrando em uma lista de espera.
				</div>
			</div>		
		</div>
		<div class="faq">
			<div class="faq_question">
				&#9658 O botão de RENOVAR não aparece. E agora?
			</div>
			<div class="faq_answer_container">
				<div class="faq_answer">
					Caso o botão RENOVAR não esteja aparecendo na tela de MEUS LIVROS podem ser as seguintes situações:
					<br>
					<li> Já foi atingido a quantidade máxima de 3(três) renovações online.</li>
					<li> Alguém reservou (entrou para a lista de espera) do livro que você está tentando renovar.</li>
					<li> Você está atrasado com alguma devolução.</li>
				</div>
			</div>		
		</div>
		<div class="faq">
			<div class="faq_question">
				&#9658 Atrasei na devolução. Eu preciso pagar multa?
			</div>
			<div class="faq_answer_container">
				<div class="faq_answer">
					Não. O sistema de punição para atrasos em devoluções na COMUNITECA funciona da seguinte forma:
					<li> O usuário será impedido de realizar novos empréstimos pelo dobro 
					de dias em que esteve atraso. Exemplo: Caso você atrase em 10(dez) dias a devolução de algum dos livros, 
					o sistema te bloqueará durante 20 (vinte).</li>
					<li> Caso a sua situação esteja irregular na COMUNITECA, não será 
					possível também realizar empréstimos, renovações ou reservas.</li>
				</div>
			</div>		
		</div>
	</div>
</body>

</html>