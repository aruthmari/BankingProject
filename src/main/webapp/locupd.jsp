<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.banking.files.Obj"%>
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
		<%=session.getAttribute("usrid")%>
	</h2>
	<%
	Obj.dao.setCity((String) request.getParameter("Address"));
	String id = Obj.dao.getId();
	if (Obj.db.update("city", Obj.dao.getCity(), id) == 1)
		out.println("Your Address updated successfully");
	else
		out.println("sorry, your address not updated");
	%>
	<table>
		<tr>
			<td><button type="button" onclick="document.location = 'mainmenu.jsp'"  >Main Menu</button> </td>
			<td><button type="button" onclick="document.location = 'exit.jsp'">Logout</button></td>
		</tr>
	</table>
</body>
</html>