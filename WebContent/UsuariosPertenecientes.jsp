<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<style type="text/css">
	.datagrid table { 
					  
	                  border-collapse: collapse; 
	                  text-align: center;
	                  width:50%;
	                  height: 5px;
	}
	.datagrid
	{
	            margin-left:60px;
	            width:699px;
	            margin-top:40px;
	            font: normal 12px Georgia, Times New Roman, Times, serif; 
	            background: #fff;
	           border: 5px solid #8C8C8C; 
	           -webkit-border-radius: 18px; -moz-border-radius: 18px; border-radius: 18px; 
	     }
	          
	.datagrid table td, .datagrid table th { padding: 3px 20px; }
	.datagrid table thead th {
	 background-color:#8C8C8C; 
	 color:#F8FF21; 
	 font-size: 15px; 
	  border-left: 1px solid #A3A3A3; 
	 }
	 
    .datagrid table thead th:first-child { border: none; }
    .datagrid table tbody td { color: #7D7D7D; font-size: 14px;font-weight: normal; }
   
	</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>ESTA LAPTOP PERTENECE A:</h1>
<div class="datagrid">
	<table>
    <thead>
       <tr>
          <th>Nombre Titular</th>
          <th>Apellido Titular</th>
          <th>Dni Titular</th>
          <th>Telefono Titular</th>
          <th>Email Titular</th>
          <th>Tipo Titular</th>
          <th>Serie Laptop</th>
       </tr>
       
    </thead>
    </table>
	</div>
</body>
</html>