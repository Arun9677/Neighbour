package DAO;

public interface EmpInterface {
	
	public void SignUp(Bean bean);
	
	public int EmploySignUp(Bean bean);
	
	public boolean SignIn(Bean bean);
	
	public boolean AdminSignIn(Bean bean);
	
	public boolean passsCheck(Bean bean);
	
	public int saveFeed(Bean bean);

}
