<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PayPal</title>
</head>
<body style="text-align:center;" >
	<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");
	session.invalidate();
	%>
	<h2>Welcome to Internet Banking</h2>
	<form action="login" method="post" onsubmit="return validate();">
		<table>
			<tr>
				<td>Username</td>
				<td><input type="text" name="usrnam" maxlength="10" required></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="pass" maxlength="10" required></td>
			</tr>
			<tr>
				<td></td>
				<td><p style="color: red;">
						<%
						if (request.getAttribute("error") != null) {
							out.println(request.getAttribute("error"));
						}
						%>
					</p></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Login"></td>
			</tr>
			<tr>
				<td></td>
				<td>New User? <a href="regform.jsp">create account</a>
		</table>
	</form>
</body>
</body>
</html>