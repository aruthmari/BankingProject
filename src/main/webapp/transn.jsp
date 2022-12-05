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
	<%
	String par = request.getParameter("amnt");
	String field = "";
	if (par.equals("Deposit")) {
		field = "Credit";
	} else {
		field = "Debit";
	}
	%>
	<form action="bankprocs.jsp" method="post">
		<table>
			<tr>
				<td>Enter your <%=field%> amount</td>
				<td><input type="text" name="<%=field%>" required></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Confirm">
			</tr>
		</table>
	</form>
</body>
</html>