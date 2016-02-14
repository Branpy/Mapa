<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.Format"%>
<%@page import="Acciones.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <style type="text/css">
   .otro{
   		text-align: center;
   		background: #DCA14A;
		width: 43%;
		padding: 1px;
		border-radius: 20px;
		position: relative;
		left:40%;
   		left:100px;
   		font-size: 14px;
		display: block;
		
		font-family:"Verdana";
   }
      body {
	background:url(../imagenes/fondo.png);
	color: #000;
	background-repeat:no-repeat;
	}
	form {
		position: relative;
		top: -86px;
		left: 50px;
		width:25%;
		border: 1px solid #ccc;
		margin: 20px;
		padding: 20px;
		background:#EDEBEB;
	}
	.main {
		background: #4ACDBE;
		width: 35%;
		padding: 1px;
		border-radius: 20px;
		position: relative;
		left:36%;
	}
	h1 {
		text-align: center;
		color: #fff;
		font-size: 15px;
	}

	label {
		font-size: 14px;
		display: block;
		width: 100%;
		font-family:"Verdana";
	}

	textarea {
		resize:vertical;
		max-height: 300px;
		min-height: 100px;
	}

	input, textarea, div {
		margin-bottom: 5px;
		width: 100%;
		padding: 5px;
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
		box-sizing: border-box;
		border: 1px solid #ccc;
	}
	div {
		margin-bottom: 20px;
		width: 100%;
		padding: 10px;
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
		box-sizing: border-box;
		border: none;
	}
	input:focus, textarea:focus {
		border: 1px solid #1668C4;
	}

	input[type="submit"] {
		margin-bottom: 0;
		background: #1668C4;
		color: #fff;
		border: none;
	}

	input[type="submit"]:hover {
		background: #4A88F4;
		border-radius: 3px;
		cursor: pointer;
	}
	
	.time{
		position:relative;
		top:0px;
		left:1000px;
		margin-bottom: 0;
		width:10%;
	}
	
	.datagrid table { 
					  
	                  border-collapse: collapse; 
	                  text-align: center;
	                  width:50%;
	                  height: 5px;
	}
	.datagrid
	{
		position:relative;
		top:-800px;
		left:500px;
	            margin-left:60px;
	            width:699px;
	            margin-top:30px;
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
<title>REGISTROS DE LAP Y TITULAR</title>

</head>
<body>
   <div class="main">
		<h1>
			BIENVENIDO AL REGISTRO DE ENTRADA DE LAPTOPS
		</h1>
	</div>
	<% DateFormat fecha = new SimpleDateFormat("dd-MM-yyyy");%>
	  <p class="time">
	  la fecha  de hoy es:
	   <input type="text" name="fecha" value="<%=fecha.format(new java.util.Date()) %>">
	  </p>
	
   <form action="Registro"id="TheForm" method="GET" name="TheForm" >
   		<label class="otro">DATOS DE TITULAR</label>
   		<label for="sexo">Tipo Titular:</label>
		<div>
			<select  name="opc_titular" id="tipoTitular">
				<% 
                         Class.forName("org.gjt.mm.mysql.Driver");
    					  Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/laptops_db","root","");
    					Statement s = conexion.createStatement();
          			     ResultSet r =s.executeQuery("select * from tipo_titular");
           		      while(r.next()) 
           		      {
           		    	  out.println("<option value= " +r.getInt("id") +" > "  + r.getString("name")+"</option>");
           			  } 
		 		%>
			</select>
		</div>
		<label for="nombre">Nombre Titular:</label>
		<input type="text" placeholder="Nombre Titular" name="nombre" id="nombre" required>

		<label for="apellido">Apellido Titular:</label>
		<input type="text" placeholder="Apellido Titular" name="apellido" id="apellido" required>
		
		<label for="dir">Dirección Titular:</label>
		<input type="text" placeholder="Dirección" name="dir" id="dir" required>
		
		<label for="dni">DNI Titular:</label>
		<input type="text" placeholder="DNI" name="dni" id="dni" maxlength="9" required>
		
		<label for="cell">Telefono Titular:</label>
		<input type="text" placeholder="Nro. Telefono" name="cell" id="cell" maxlength="9" required>
		
		<label for="email">Email Titular</label>
		<input type="email" id="email" placeholder="Ingresa Tu Email" name="email" required>
		
		<label for="codigo">Codigo Titular</label>
		<input type="text" placeholder="Codigo" name="codigo" id="dir" required>
		
		<label class="otro">
		DATOS DE LAPTOP
		</label>
		
		<label for="marca">Marca Laptop:</label>
		<input type="text" placeholder="Marca" name="marca" id="marca" required>
		
		<label for="modelo">Modelo Laptop:</label>
		<input type="text" placeholder="Modelo" name="modelo" id="modelo" required>
		
		<label for="serie">Serie Laptop:</label>
		<input type="text" placeholder="Nro. Serie" name="serie" id="serie" required>
		
		<label for="mensaje">Descripción:</label>
		<textarea id="mensaje" placeholder="Añada una pequeña descripión" name="desc"></textarea>
		
		<input type="submit" class="boton" value="registrar" id="botonRegistrar" required>
		
	</form>
	
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