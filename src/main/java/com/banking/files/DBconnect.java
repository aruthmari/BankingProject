package com.banking.files;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBconnect {
	static class newuser {
		String id,fname,lname,pwd,city;
		long mob;
		BigDecimal amnt;
		
		public newuser(String id,String fname,String lname,	long mob,String pwd,BigDecimal amnt,String city) {
			this.id = id;
			this.fname = fname;
			this.lname = lname;
			this.mob = mob;
			this.pwd = pwd;
			this.amnt = amnt;
			this.city = city;
		}
	}
	public Connection connect() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection jdbcCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/paypal",
				"root", "Mysql@123");
		return jdbcCon;
	}
	public int post() throws ClassNotFoundException, SQLException {
		PreparedStatement create = this.connect().prepareStatement("insert into userdet values(?,?,?,?,?,?,?)");
		create.setString(1, Obj.dao.getId());
		create.setString(2, Obj.dao.getFname());
		create.setString(3, Obj.dao.getLname());
		create.setLong(4, Obj.dao.getMob());
		create.setString(5, Obj.dao.getPwd());
		create.setBigDecimal(6, Obj.dao.getBal());
		create.setString(7, Obj.dao.getCity());
		int effect = create.executeUpdate();
		return effect;
	}
	public ResultSet get(String log) throws ClassNotFoundException, SQLException {
		Statement bring = this.connect().createStatement();
		ResultSet res = bring.executeQuery("select * from userdet where usr_id = '"+log+"'");
		return res;
	}
	public int update(String col,Object upd,String id) throws ClassNotFoundException, SQLException {
		PreparedStatement create = this.connect().prepareStatement("update userdet set "+col+" = ? where usr_id = ?");
		create.setObject(1, upd);
		create.setString(2, id);
		int effect = create.executeUpdate();
		return effect;
	}
}
