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
		Welcome to PayPal Banking, Hi
		<%=session.getAttribute("usrid")%></h2>
	<table>
		<tr>
			<td><button type="button" onclick="document.location = 'banking.jsp'"  >Banking</button> </td>
			<td><button type="button" onclick="document.location = 'pinchange.jsp'">Reset Pin</button></td>
		</tr>
		<tr>
			<td><button type="button" onclick="document.location = 'update.jsp'">Update</button> </td>
			<td><button type="button" onclick="document.location = 'exit.jsp'">Logout</button></td>
		</tr>
	</table>
</body>
</html>