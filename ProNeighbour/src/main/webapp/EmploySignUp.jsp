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
<title>Employ Sign Up</title>
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
  
</style>

<body>
<nav class="navbar navbar-expand-lg navbar1-dark ftco_navbar bg-dark ftco1-navbar-light" id="ftco-navbar">
 <div class="container">
 <a class="navbar-brand" href="index.html">know my <span>Neighbour</span></a>
 <div class="collapse navbar-collapse" id="ftco-nav">
 <ul class="navbar-nav ml-auto">
 	<li class="nav-item active"><a href="Home.html" class="nav-link">Home</a></li>
	<li class="nav-item"><a href="" class="nav-link">About</a></li>
	<li class="nav-item"><a href="" class="nav-link">Blog</a></li>
	<li class="nav-item"><a href="" class="nav-link">Contact</a></li>
 </ul>
 </div>
 </div>
 </nav>

<div class="container">
<div class="col-6">
<form class="needs-validation" novalidate>
	<div class="top">
    <div class="form-group">
      <label class="form1-label" for="uname">Username :</label>
      <input type="text" class="form-control" id="euname" name="euname" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label class="form1-label" for="pwd">Password :</label>
      <input type="password" class="form-control form1-control" id="epwd" name="epwd" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label class="form1-label" for="conpwd">Confirm Password :</label>
      <input type="password" class="form-control form1-control" id="econpwd" name="econpwd" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label class="form1-label" for="Name">Name :</label>
      <input type="text" class="form-control" id="eName" name="eName" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>   
      <label class="form1-label" for="Gender">Gender :</label><br>
      <div class="form-group form-check-inline gen1">
      <label class="form-check-label">
        <input class="form-check-input" type="radio" name="eGender" value="Male" required> Male 
        <div class="valid-feedback">Valid.</div>
        <div class="invalid-feedback">Check your gender to continue.</div>
      </label>
    </div>
    <div class="form-group form-check-inline gen1">
      <label class="form-check-label"> 
        <input class="form-check-input" type="radio" name="eGender" value="Female" required> Female
      </label>
    </div>
    <div class="form-group">
      <label class="form1-label" for="Address">Address :</label>
      <input type="text" class="form-control" id="eAddress" name="eAddress" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label class="form1-label" for="Area">Area :</label>
      <input list="areaList" class="form-control" id="eArea" name="eArea" required>
      <datalist id="areaList">
<%
try
  {
	//Statement st = ShortStatement.smallStatement();
	Statement st = ShortStatement.smallStatement();
	ResultSet rs = st.executeQuery("SELECT * FROM `chennai`");
	while(rs.next())
	{
%><option value=<%out.print(rs.getString(2));%>>
			<option value=<%out.print(rs.getString(3));%>>
			<option value=<%out.print(rs.getString(4));%>>
			<option value=<%out.print(rs.getString(5));%>>
			<option value=<%out.print(rs.getString(6));%>><%
	}
  }
  catch(Exception e)
  {
	  out.print(e);
  }
  %>			
</datalist>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label class="form1-label" for="City">City :</label>
      <input list="cityList" class="form-control" id="eCity" name="eCity" required>
			<datalist id="cityList">
			<option value="Chennai">
			</datalist>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label class="form1-label" for="State">State :</label>
      <input list="stateList" class="form-control" id="eState" name="eState" required>
			<datalist id="stateList">
			<option value="Tamil Nadu">
			</datalist>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label class="form1-label" for="Mobile0">Mobile :</label>
      <input type="text" class="form-control" id="eMobile" name="eMobile" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <input type="submit" value="Sign Up" formmethod="post" formaction="EmploySignUp" class="btn btn-primary">
    </div>
  </form>
  </div>
  </div>
    
<script>
// Disable form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Get the forms we want to add validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();
</script>

</body>
</html>