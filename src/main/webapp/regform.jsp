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
	%>
	<h2>Welcome to PayPal Banking</h2>
	<form action="reg.jsp" method="post">
		<table>
			<tr>
				<td>Username</td>
				<td><input type="text" name="id" maxlength="10" required></td>
			</tr>
			<tr>
				<td>First Name</td>
				<td><input type="text" name="fname" maxlength="20" pattern="[A-Za-z]{1,}" title="characters only" required></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" name="lname" maxlength="20" pattern="[A-Za-z]{1,}" title="characters only" required></td>
			</tr>
			<tr>
				<td>Mobile number</td>
				<td><input type="text" name="mob" pattern="[0-9]{10}" title="Numbers only & 10 digits" required ></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" maxlength="10" name="pass" required></td>
			</tr>
			<tr>
				<td>Amount</td>
				<td style="color:red;"><input type="text" name="amnt" pattern="[0-9]{5,}" title="Numbers only & min Rs.10000 to start account" required></td>
			</tr>
			<tr>
				<td>Address</td>
				<td><input type="text" name="loc" required></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Register" required>
			</tr>
		</table>
	</form>
	<%
	session.setAttribute("value", "tru");
	%>
</body>
</html>