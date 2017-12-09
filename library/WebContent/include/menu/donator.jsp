<li><a href="allBooks.jsp">INÍCIO</a></li>
<li><a href="registerBook.jsp">DOAR LIVRO</a></li>

<li>
	<form method=post action=bookList.jsp>
		<a href="#" onclick="parentNode.submit();">DOAÇÕES</a>
		<input type=hidden name=pageType value=donator_donations>
	</form>
</li>

<li>
	<form method=post action=bookList.jsp>
		<a href="#" onclick="parentNode.submit();">MEUS LIVROS</a>
		<input type=hidden name=pageType value=donator_books>
	</form>
</li>

<li><a href="faq.jsp">FAQ</a></li>