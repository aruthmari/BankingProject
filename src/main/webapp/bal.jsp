<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.banking.files.Obj"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PayPal</title>
</head>
<body>
	<%	
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");
	
	if (session.getAttribute("usrid") == null) {
		out.println("Invalid Access");
		return;
	}
	%>
	<h2 style="text-align:center;">
		Hi
		<%=session.getAttribute("usrid")%>
	</h2>
	<p style="text-align:center;">
	<%
	out.println("Your Account balance is Rs. " + Obj.dao.getBal());
	%>
	</p>
	<table>
		<tr style="text-align:center;">
			<td><button type="button"
					onclick="document.location = 'mainmenu.jsp'">Main Menu</button></td>
			<td><button type="button"
					onclick="document.location = 'exit.jsp'">Logout</button></td>
		</tr>
	</table>
</body>
</html>