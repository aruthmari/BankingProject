package com.banking.files;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");
		HttpSession ses = request.getSession();
		String usrid = request.getParameter("usrnam");
		String pass = request.getParameter("pass");
		try {
			ResultSet rset = Obj.db.get(usrid);
			if (rset.next() == false) {
				request.setAttribute("error", "Username not available");
				request.getRequestDispatcher("index.jsp").include(request, response);
				return;
			}
			Obj.dao.setId(rset.getString(1));
			Obj.dao.setFname(rset.getString(2));
			Obj.dao.setLname(rset.getString(3));
			Obj.dao.setMob(rset.getLong(4));
			Obj.dao.setPwd(rset.getString(5));
			Obj.dao.setBal(rset.getBigDecimal(6));
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		if (pass.equals(Obj.dao.getPwd())) {
			ses.setAttribute("usrid", Obj.dao.getFname()+" "+Obj.dao.getLname());
			request.getRequestDispatcher("mainmenu.jsp").include(request, response);
			return;
		} else {
			request.setAttribute("error", "Invalid password");
			request.getRequestDispatcher("index.jsp").include(request, response);
		}
	}
}
