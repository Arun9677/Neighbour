<%@page import="java.util.LinkedList"%>
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
<title>Cab 1</title>
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
 	<li class="nav-item active"><a href="Cab2.jsp" class="nav-link">Cab 2</a></li>
 	<li class="nav-item"><a href="AdminPage.html" class="nav-link">Home</a></li>
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
	
	Cab 2 employees are :<br><br>
<%
LinkedList<String> c1 = new LinkedList();
c1.add("Padianallur");
c1.add("Perungavoor");
c1.add("Kolathur");
c1.add("Madhavaram");
c1.add("Ennore");
c1.add("Vyasarpadi");
c1.add("Chennai");
c1.add("Adyar");
c1.add("Neelankarai");
c1.add("Medavakkam");
c1.add("Velachery");
c1.add("Chromepet");
c1.add("Tambaram");
c1.add("Poonamallee");
c1.add("Avadi");
c1.add("Oragadam");
%>
<table border="1">
<tr><th>Name</th><th>Mobile</th><th>Area</th></tr>
<%
for(String r1:c1)
{
	try
	{
		Statement st = ShortStatement.smallStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM `employ`");
		
		while(rs.next())
		{
			if(r1.equalsIgnoreCase(rs.getString("Area")))
			{
				%><tr><td><%out.print(rs.getString("Name"));%></td><td><a href="tel:<%out.print(rs.getString("Mobile"));%>"><%out.print(rs.getString("Mobile"));%></a></td><td><%out.print(rs.getString("Area"));%></td></tr><%
			}
		}
		
		if(rs!=null)
		{
			rs.close();
		}
		
		if(st!=null)
		{
			st.close();
		}
		
	}
	catch(Exception e)
	{
		out.print(e);
	}
}

%>
</table>
 
	</div>
	</div>
	</div>
</body>
</html>