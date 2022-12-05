<%@page import="java.math.BigDecimal"%>
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
	
	if (session.getAttribute("value") == null) {
		out.println("Invalid Access");
		return;
	}
	%>
	<h2>
		Welcome
		<%
	out.println(request.getParameter("fname") + " " + request.getParameter("lname"));
	%>
	</h2>
	<%
	Obj.dao.setId(request.getParameter("id"));
	Obj.dao.setFname(request.getParameter("fname"));
	Obj.dao.setLname(request.getParameter("lname"));
	Obj.dao.setPwd(request.getParameter("pass"));
	Obj.dao.setMob(Long.parseLong(request.getParameter("mob")));
	Obj.dao.setBal(new BigDecimal(request.getParameter("amnt")));
	Obj.dao.setCity(request.getParameter("loc"));
	
	if(Obj.db.post() == 1)
		out.println("Successfully Registered your account");
	else 
		out.println("Registration unsuccesful");
 	%>
	<table>
		<tr>
			<td></td>
			<td><button type="button"
					onclick="document.location = 'index.jsp'">Login</button></td>
		</tr>
	</table>
	<% session.invalidate(); %>
</body>
</html>