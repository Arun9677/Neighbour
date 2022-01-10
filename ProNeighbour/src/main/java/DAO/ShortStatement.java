package DAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class ShortStatement {
	
	public static Statement smallStatement()
	{
		Statement st = null;
		try 
		{	
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/neighbour","root","root");	
			st=con.createStatement();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return st;
		
	}

}
