<%@page import="javax.management.MBeanNotificationInfo"%>
<%@page import="DAO.Bean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DAO.ShortStatement"%>
<%@ page language="java" contentType="text/html;"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Near by People</title>
</head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap">
  <link rel="stylesheet" href="css/style.css">
<style>

.top {
	column-width: 550px;
	position: absolute;
	margin-top: 120px;
	left: 30%; }

.ftco1-navbar-light .navbar-brand span {
      color: #01d28e; }
      
.ftco1-navbar-light {
  background: #333 !important;
  position: absolute;
  top: 20px;
  left: 0;
  right: 0;
  z-index: 3; }

.navbar1-dark .navbar-brand {
  color: #fff; }

.navbar1-dark .navbar-brand:hover, .navbar-dark .navbar-brand:focus {
    color: #01d28e; }
    
.form1-label{
	font-size: 25px;
	color:#000000;}
	
.gen1{
	font-size: 18px;
	color:#000000;}

.hero-text {
  text-align: center;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  color: white;
}

.rights-text{
	text-align: center;
  position: absolute;
  top: 95%;
  left: 50%;
  transform: translate(-50%, -50%);
  color: white;
}
  
</style>
<body>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
 <div class="container">
 <a class="navbar-brand" href="index.html">know my <span>Neighbour</span></a>
 <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
 <span class="oi oi-menu"></span> Menu
 </button>
 
 <div class="collapse navbar-collapse" id="ftco-nav">
 <ul class="navbar-nav ml-auto">
 	<li class="nav-item active"><a href="NearByPeople.jsp" class="nav-link">Neighbour</a></li>
 	<li class="nav-item"><a href="EmployPage.html" class="nav-link">Home</a></li>
	<li class="nav-item"><a href="" class="nav-link">About</a></li>
	<li class="nav-item"><a href="" class="nav-link">Blog</a></li>
	<li class="nav-item"><a href="" class="nav-link">Contact</a></li>
 </ul>
 </div>
 </div>
 </nav>
 
 <div class="hero-wrap ftco-degree-bg" style="background-image: url('images/bg_6.jpg');" data-stellar-background-ratio="0.5">
<div class="overlay"></div>
 	<div class="container">
	<div class="hero-text">
 
<%
try
{
	Bean bean = new Bean();
	
	Statement st = ShortStatement.smallStatement();
	ResultSet rs = st.executeQuery("SELECT * FROM `employ` WHERE `Username` = '"+session.getAttribute("Name")+"' ");
	if(rs.next())
	{
		bean.setArea(rs.getString("Area"));
		out.print("My Area is "+rs.getString("Area")); %><br><br><%
	}
	
	rs = st.executeQuery("SELECT * FROM `chennai` WHERE `col1` = '"+bean.getArea()+"' ");
	if(rs.next())
	{
		bean.setRow(rs.getInt(1));
		bean.setFrontRow(bean.getRow()-1);
		bean.setBackRow(bean.getRow()+1);
		
		bean.setColumn("col1");
		bean.setFrontColumn(null);
		bean.setBackColumn("col2");
		
	}
	
	rs = st.executeQuery("SELECT * FROM `chennai` WHERE `col2` = '"+bean.getArea()+"' ");
	if(rs.next())
	{
		bean.setRow(rs.getInt(1));
		bean.setFrontRow(bean.getRow()-1);
		bean.setBackRow(bean.getRow()+1);
		
		bean.setColumn("col2");
		bean.setFrontColumn("col1");
		bean.setBackColumn("col3");
		
	}
	
	rs = st.executeQuery("SELECT * FROM `chennai` WHERE `col3` = '"+bean.getArea()+"' ");
	if(rs.next())
	{
		bean.setRow(rs.getInt(1));
		bean.setFrontRow(bean.getRow()-1);
		bean.setBackRow(bean.getRow()+1);
		
		bean.setColumn("col3");
		bean.setFrontColumn("col2");
		bean.setBackColumn("col4");
		
	}
	
	rs = st.executeQuery("SELECT * FROM `chennai` WHERE `col4` = '"+bean.getArea()+"' ");
	if(rs.next())
	{
		bean.setRow(rs.getInt(1));
		bean.setFrontRow(bean.getRow()-1);
		bean.setBackRow(bean.getRow()+1);
		
		bean.setColumn("col4");
		bean.setFrontColumn("col3");
		bean.setBackColumn("col5");
		
	}
	
	rs = st.executeQuery("SELECT * FROM `chennai` WHERE `col5` = '"+bean.getArea()+"' ");
	if(rs.next())
	{
		bean.setRow(rs.getInt(1));
		bean.setFrontRow(bean.getRow()-1);
		bean.setBackRow(bean.getRow()+1);
		
		bean.setColumn("col5");
		bean.setFrontColumn("col4");
		bean.setBackColumn(null);
		
	}
	
	out.print("Near by people are :"); %><br><br><%
	
	rs = st.executeQuery("SELECT * FROM `chennai` WHERE `Id` = '"+bean.getRow()+"' ");
	if(rs.next())
	{
		bean.setPlace1(rs.getString(bean.getColumn()));
		if(bean.getFrontColumn()!=null)
		{
			bean.setPlace2(rs.getString(bean.getFrontColumn()));
		}
		if(bean.getBackColumn()!=null)
		{
			bean.setPlace3(rs.getString(bean.getBackColumn()));
		}	
		
	}
	
	if((bean.getFrontRow()>0) && (bean.getFrontRow()<5))
	{
		rs = st.executeQuery("SELECT * FROM `chennai` WHERE `Id` = '"+bean.getFrontRow()+"' ");
		if(rs.next())
		{
			bean.setPlace4(rs.getString(bean.getColumn()));
			if(bean.getFrontColumn()!=null)
			{
				bean.setPlace5(rs.getString(bean.getFrontColumn()));
			}
			if(bean.getBackColumn()!=null)
			{
				bean.setPlace6(rs.getString(bean.getBackColumn()));
			}			
			
		}
	}
	
	if((bean.getBackRow()>1) && (bean.getBackRow()<6))
	{
		rs = st.executeQuery("SELECT * FROM `chennai` WHERE `Id` = '"+bean.getBackRow()+"' ");
		if(rs.next())
		{
			bean.setPlace7(rs.getString(bean.getColumn()));
			if(bean.getFrontColumn()!=null)
			{
				bean.setPlace8(rs.getString(bean.getFrontColumn()));
			}
			if(bean.getBackColumn()!=null)
			{
				bean.setPlace9(rs.getString(bean.getBackColumn()));
			}
				
		}
	}
%>

<table border="1">
<tr><th>Name</th><th>Mobile</th><th>Area</th></tr>
<%
	
	rs = st.executeQuery("SELECT * FROM `employ` WHERE `Area` = '"+bean.getPlace1()+"' ");
	while(rs.next())
	{
		if(rs.getString(2).equalsIgnoreCase(session.getAttribute("Name").toString()))
			continue;
		
		%><tr><td><%out.print(rs.getString("Name"));%></td><td><a href="tel:<%out.print(rs.getString("Mobile"));%>"><%out.print(rs.getString("Mobile"));%></a></td><td><%out.print(rs.getString("Area"));%></td></tr><%
		
	}
	
	rs = st.executeQuery("SELECT * FROM `employ` WHERE `Area` = '"+bean.getPlace2()+"' ");
	while(rs.next())
	{
		%><tr><td><%out.print(rs.getString("Name"));%></td><td><a href="tel:<%out.print(rs.getString("Mobile"));%>"><%out.print(rs.getString("Mobile"));%></a></td><td><%out.print(rs.getString("Area"));%></td></tr><%
	}
	
	rs = st.executeQuery("SELECT * FROM `employ` WHERE `Area` = '"+bean.getPlace3()+"' ");
	while(rs.next())
	{
		%><tr><td><%out.print(rs.getString("Name"));%></td><td><a href="tel:<%out.print(rs.getString("Mobile"));%>"><%out.print(rs.getString("Mobile"));%></a></td><td><%out.print(rs.getString("Area"));%></td></tr><%
	}
	
	rs = st.executeQuery("SELECT * FROM `employ` WHERE `Area` = '"+bean.getPlace4()+"' ");
	while(rs.next())
	{
		%><tr><td><%out.print(rs.getString("Name"));%></td><td><a href="tel:<%out.print(rs.getString("Mobile"));%>"><%out.print(rs.getString("Mobile"));%></a></td><td><%out.print(rs.getString("Area"));%></td></tr><%
	}
	
	rs = st.executeQuery("SELECT * FROM `employ` WHERE `Area` = '"+bean.getPlace5()+"' ");
	while(rs.next())
	{
		%><tr><td><%out.print(rs.getString("Name"));%></td><td><a href="tel:<%out.print(rs.getString("Mobile"));%>"><%out.print(rs.getString("Mobile"));%></a></td><td><%out.print(rs.getString("Area"));%></td></tr><%
	}
	
	rs = st.executeQuery("SELECT * FROM `employ` WHERE `Area` = '"+bean.getPlace6()+"' ");
	while(rs.next())
	{
		%><tr><td><%out.print(rs.getString("Name"));%></td><td><a href="tel:<%out.print(rs.getString("Mobile"));%>"><%out.print(rs.getString("Mobile"));%></a></td><td><%out.print(rs.getString("Area"));%></td></tr><%
	}
	
	rs = st.executeQuery("SELECT * FROM `employ` WHERE `Area` = '"+bean.getPlace7()+"' ");
	while(rs.next())
	{
		%><tr><td><%out.print(rs.getString("Name"));%></td><td><a href="tel:<%out.print(rs.getString("Mobile"));%>"><%out.print(rs.getString("Mobile"));%></a></td><td><%out.print(rs.getString("Area"));%></td></tr><%
	}
	
	rs = st.executeQuery("SELECT * FROM `employ` WHERE `Area` = '"+bean.getPlace8()+"' ");
	while(rs.next())
	{
		%><tr><td><%out.print(rs.getString("Name"));%></td><td><a href="tel:<%out.print(rs.getString("Mobile"));%>"><%out.print(rs.getString("Mobile"));%></a></td><td><%out.print(rs.getString("Area"));%></td></tr><%
	}
	
	rs = st.executeQuery("SELECT * FROM `employ` WHERE `Area` = '"+bean.getPlace9()+"' ");
	while(rs.next())
	{
		%><tr><td><%out.print(rs.getString("Name"));%></td><td><a href="tel:<%out.print(rs.getString("Mobile"));%>"><%out.print(rs.getString("Mobile"));%></a></td><td><%out.print(rs.getString("Area"));%></td></tr><%
	}
	
	if(rs!=null)
	{
		rs.close();
	}
	
	if(st!=null)
	{
		st.close();
	}
	
	%></table></div></div>
	
	<div class="row d-flex row no-gutters">
 		<div class="rights-text">
 		<div class="text w-100 text-center mb-md-5 pb-md-5">
 			<p class="text-muted">Copyright &copy; 2022 All rights reserved to Arun@Edubridge_India</p>
 		</div>
 		</div>
 		</div> 	
	
	</div><%	
}
catch(Exception e)
{
	out.print(e);
}
%>
</body>
</html>