<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PayPal</title>
</head>
<body style="text-align:center;">
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
		<%=session.getAttribute("usrid")%></h2>
	<form action="transn.jsp" method="post">
		<table>
			<tr>
				<td><input type="submit" name="amnt" value="Deposit"></td>
				<td><input type="submit" name="amnt" value="Withdraw"></td>
			</tr>
		</table>
	</form>
	<table>
		<tr>
			<td><button type="button"
					onclick="document.location = 'bal.jsp'">Check Balance</button></td>
			<td><button type="button"
					onclick="document.location = 'exit.jsp'">Logout</button></td>
		</tr>
	</table>
</body>
</html>