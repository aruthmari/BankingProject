<%@page import="java.math.BigDecimal"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.banking.files.Obj"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PayPal</title>
</head>
<body style="text-align: center;">
	<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");
	
	if (session.getAttribute("usrid") == null) {
		out.println("Invalid Access");
		return;
	}
	%>
	<h2>
		Hi
		<%=session.getAttribute("usrid")%>
	</h2>
	<%
	String id = Obj.dao.getId();
	BigDecimal bal = Obj.dao.getBal();
	if (request.getParameter("Credit") != null) {
		Obj.dao.setBal(bal.add(new BigDecimal(request.getParameter("Credit"))));
		if (Obj.db.update("bal", Obj.dao.getBal(), id) == 1)
			out.println("Amount credited into your account successfully");
	} else if (request.getParameter("Debit") != null) {
		if (bal.compareTo(new BigDecimal(request.getParameter("Debit"))) >= 0) {
			Obj.dao.setBal(bal.subtract(new BigDecimal(request.getParameter("Debit"))));
			if (Obj.db.update("bal", Obj.dao.getBal(), id) == 1)
				out.println("Amount debited into your account successfully");
		}
		else out.println("Insufficient amount in your account");
	} else
		out.println("sorry, invalid amount");
	%>
	<table>
		<tr>
			<td><button type="button"
					onclick="document.location = 'bal.jsp'">Check Balance</button></td>
		</tr>
		<tr>
			<td><button type="button"
					onclick="document.location = 'mainmenu.jsp'">Main Menu</button></td>
			<td><button type="button"
					onclick="document.location = 'exit.jsp'">Logout</button></td>
		</tr>
	</table>
</body>
</html>