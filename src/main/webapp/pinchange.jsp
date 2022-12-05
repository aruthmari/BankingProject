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
	<form action="pasres.jsp" method="post">
		<table>
			<tr>
				<td>Enter your old password</td>
				<td><input type="password" name="opas" required></td>
			</tr>
			<tr>
				<td>Enter your new password</td>
				<td><input type="password" name="npas" required></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Save">
			</tr>
		</table>
	</form>
</body>
</html>