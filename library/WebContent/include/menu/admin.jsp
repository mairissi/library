<li><a href="allBooks.jsp">INÍCIO</a></li>

<li>
	<form method=post action=bookList.jsp>
		<a href="#" onclick="parentNode.submit();">DOAÇÕES</a>
		<input type=hidden name=pageType value=admin_donations>
	</form>
</li>

<li>
	<form method=post action=bookList.jsp>
		<a href="#" onclick="parentNode.submit();">EMPRÉSTIMOS</a>
		<input type=hidden name=pageType value=admin_borrowed>
	</form>
</li>

<li>
	<form method=post action=bookList.jsp>
		<a href="#" onclick="parentNode.submit();">RESERVAS</a>
		<input type=hidden name=pageType value=admin_reserved>
	</form>
</li>

<li><a href="signUp.jsp">CADASTRAR USUÁRIO</a></li>

<li><a href="faq.jsp">FAQ</a></li>