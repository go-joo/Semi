package model;

import java.sql.*;

public class Db {
	public static Connection con;
	   static {
	      try {
	    	  Class.forName ("oracle.jdbc.driver.OracleDriver");
	          con=DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", 
	                "semijava", "pass");
	         System.out.println("접속성공");
	      }catch(Exception e) {
	         System.out.println("DB에러:" + e.toString());
	      }
	   }   
}
