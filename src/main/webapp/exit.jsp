<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
		Thanks for using PayPal Banking,
		<%=session.getAttribute("usrid")%></h2>
	<%
	session.invalidate();
	%>
	<table>
		<tr>
			<td></td>
			<td><button type="button"
					onclick="document.location = 'index.jsp'">Login again</button></td>
		</tr>
	</table>
</body>
</html>