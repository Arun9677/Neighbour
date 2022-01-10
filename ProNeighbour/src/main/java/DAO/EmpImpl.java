package DAO;

import java.sql.ResultSet;
import java.sql.Statement;

public class EmpImpl implements EmpInterface
{

	@Override
	public void SignUp(Bean bean) {
		
		try 
		{
			Statement st = ShortStatement.smallStatement();
			st.executeUpdate("INSERT INTO `admin` (`Username`, `Password`, `Name`, `Gender`, `Address`, `Area`, `City`, `State`, `Mobile`) VALUES ('"+bean.getUsername()+"', '"+bean.getPassword()+"', '"+bean.getName()+"', '"+bean.getGender()+"', '"+bean.getAddress()+"', '"+bean.getArea()+"', '"+bean.getCity()+"', '"+bean.getState()+"', '"+bean.getMobile()+"')");			
			
			if(st!=null)
			{
				st.close();
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}

	@Override
	public boolean SignIn(Bean bean) {
		
		try {
			
			Statement st = ShortStatement.smallStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM `employ` WHERE `Username` = '"+bean.getUsername()+"' AND `Password` = '"+bean.getPassword()+"' ");
			
			if(rs.next())
			{
				return true;
			}
			
			if(rs!=null)
			{
				rs.close();
			}
			
			if(st!=null)
			{
				st.close();
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return false;
		
	}

	@Override
	public boolean passsCheck(Bean bean) {
		
		int x=0;
		
		if(bean.getPassword().equals(bean.getCPassword()))
		{
	      return true;
		}
		return false;
		}

	@Override
	public int saveFeed(Bean bean) {
		
		int a = 0;
		
		try {
			
			Statement st = ShortStatement.smallStatement();
			a = st.executeUpdate("UPDATE `employ` SET `Feedback` = '"+bean.getFeedback()+"' WHERE `Username` = '"+bean.getUsername()+"' ");
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return a;
	
	}

	@Override
	public int EmploySignUp(Bean bean) {
		
		int a = 0;
		
		try 
		{
			Statement st = ShortStatement.smallStatement();
			a = st.executeUpdate("INSERT INTO `employ` (`Username`, `Password`, `Name`, `Gender`, `Address`, `Area`, `City`, `State`, `Mobile`) VALUES ('"+bean.getUsername()+"', '"+bean.getPassword()+"', '"+bean.getName()+"', '"+bean.getGender()+"', '"+bean.getAddress()+"', '"+bean.getArea()+"', '"+bean.getCity()+"', '"+bean.getState()+"', '"+bean.getMobile()+"')");			
			
			if(st!=null)
			{
				st.close();
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return a;
	}

	@Override
	public boolean AdminSignIn(Bean bean) {
		
		try {
			
			Statement st = ShortStatement.smallStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM `admin` WHERE `Username` = '"+bean.getUsername()+"' AND `Password` = '"+bean.getPassword()+"' ");
			if(rs.next())
			{
				return true;
			}
			if(rs!=null)
			{
				rs.close();
			}
			if(st!=null)
			{
				st.close();
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return false;
		
	}
		
		
	}


