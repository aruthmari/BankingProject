<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false" %>
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
	String par = request.getParameter("field");
	String field = "", dir = "";
	if (par.equals("Mobile")) {
		field = "Mobile number";
		dir = "mobupd.jsp";
	} else if (par.equals("Username")) {
		field = "Username";
		dir = "usrupd.jsp";
	} else {
		field = "Address";
		dir = "locupd.jsp";
	}
	%>
	<form action="<%=dir%>" method="post">
		<table>
			<tr>
				<td>Enter your new <%=field%></td>
				<td><input type="text" name="<%=field%>" required></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Save">
			</tr>
		</table>
	</form>
</body>
</html>