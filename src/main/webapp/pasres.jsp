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
	String id = Obj.dao.getId();
	if (request.getParameter("opas").equals(Obj.dao.getPwd())) {
		Obj.dao.setPwd(request.getParameter("npas"));
		if (Obj.db.update("pwd", Obj.dao.getPwd(), id) == 1)
			out.println("successfully changed your password");
		else
			out.println("sorry, failed to change your password");
	} else
		out.println("sorry, wrong old password");
	%>
	<table>
		<tr>
			<td></td>
			<td><button type="button"
					onclick="document.location = 'index.jsp'">Login</button></td>
		</tr>
	</table>
</body>
</html>