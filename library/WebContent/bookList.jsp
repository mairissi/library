<%@ page
 language="java" contentType="text/html; charset=ISO-8859-1"
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
				
		<% 		
	       	String message = (String) request.getAttribute("message");
	       	String alert = (String) request.getAttribute("alert");
	       	if(message != null && alert != null){
	       		out.println("<div class=\"" + alert + "\">" + message + "</div>");
	       	}
        %>
				
		<% 
			Object role = request.getSession().getAttribute("role"); 
			String pageType = request.getParameter("pageType");	
			if(pageType == null){
				pageType = request.getAttribute("pageType").toString();
			}
			
			if (role != null) {
				int roleInt = Integer.parseInt(role.toString());
				
				if (roleInt == 1) {
					if ("admin_donations".equals(pageType)) {
						%>
						<%@include file="include/table/admin_donations.jsp" %>
						<%
					} else if ("admin_borrowed".equals(pageType)) {
						%>
						<%@include file="include/table/admin_borrowed.jsp" %>
						<%
					} else if ("admin_reserved".equals(pageType)) {
						%>
						<%@include file="include/table/admin_reserved.jsp" %>
						<%
					}
				} else if (roleInt == 2) {
					%>
					<%@include file="include/table/user_books.jsp" %>
					<%
				} else if (roleInt == 3) {
					if ("donator_books".equals(pageType)) {
						%>
						<%@include file="include/table/user_books.jsp" %>
						<%
					}
					else if ("donator_donations".equals(pageType)) {
						%>
						<%@include file="include/table/donator_donations.jsp" %>
						<%
					}
				}
					
			}
		%>
	</div>

</body>
</html>