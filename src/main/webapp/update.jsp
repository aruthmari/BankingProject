<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PayPal</title>
</head>
<body>
	<%
	if (session.getAttribute("usrid") == null) {
		out.println("Invalid Access");
		return;
	}
	%>
	<h2>
		Hi
		<%=session.getAttribute("usrid")%></h2>
	<form action="updform.jsp" method="post">
		<table>
			<tr>
				<td><input type="submit" value="Mobile" name="field" required></td>
			</tr>
			<tr>
				<td><input type="submit" value="Username" name="field" required></td>
			</tr>
			<tr>
				<td><input type="submit" value="Address" name="field" required></td>
			</tr>
		</table>
	</form>
	<table>
		<tr>
			<td>
				<button type="button" onclick="document.location = 'exit.jsp'">Logout</button>
			</td>
		</tr>
	</table>
</body>
</html>