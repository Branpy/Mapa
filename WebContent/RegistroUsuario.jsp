<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
  <%@page import="java.sql.*" %>
  
<!DOCTYPE html ">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 
    <script type= "text/javascript">
    function button1()
    {
    	window.location="Principal.jsp";
    } 
       
   </script>
 
  <style type="text/css">
     
 
 
  *,*:before,*:after {
     box-sizing: border-box;
  }

   
	#f1{
	     
  		 width: 430px;
  		 margin-left: 100px;
  		 margin-top:100px;
         
         
  		 font: 14px/1.4 "Helvetica Neue", Helvetica, Arial, sans-serif;
  		 overflow: hidden;  		 
	}
	
	
	.fs{
	     border: 1px solid #cecfd5;
         border-radius: 6px;
         padding: 24px 30px;
         height: 500px;
	}
	
	fieldset {
  		border: 0;
  		margin: 0;
  		padding: 0;
  		 
	}
	
	input {
  		border-radius: 5px;
  		font: 14px/1.4 "Helvetica Neue", Helvetica, Arial, sans-serif;
  		margin: 0;
	}
   
    .fs input.boton{
		background: linear-gradient(#49708f, #293f50);
  		border: 0;
  		color: #fff;
  		cursor: pointer;
  		font-weight: bold;
  		float: left;
  		padding: 8px 16px;
  		margin-left: 160px;
  		margin-top: -13px;
	}
	.fs label {
       display: block;
      margin: .5em 0 0 0;
    }
    
    .fs select {
       margin-left: 230px;
       margin-top:20px;
       margin-bottom: -35px;
	   height: 30px;
	   width: 130px;
    }
	
	.fs #label_usuario{
	   margin-left:130px; 
	   margin-top: 20px;
	   margin-bottom:-45px;
	}
	
	.datagrid table { 
	                  border-collapse: collapse; 
	                  text-align: center;
	                  width:10px;
	                  height: 5px;
	} 
	   
	.datagrid {
	            margin-left:600px;
	            width:737px;
	            margin-top:-450px;
	            font: normal 12px Georgia, Times New Roman, Times, serif; 
	            background: #fff; 
	             
	           border: 7px solid #8C8C8C; 
	           -webkit-border-radius: 18px; -moz-border-radius: 18px; border-radius: 18px; 
	     }
	          
	.datagrid table td, .datagrid table th { padding: 3px 3px; }
	.datagrid table thead th {
	 background-color:#8C8C8C; 
	 color:#F8FF21; 
	 font-size: 14px; 
	  border-left: 1px solid #A3A3A3; 
	 }
	 
    .datagrid table thead th:first-child { border: none; }
    .datagrid table tbody td { color: #7D7D7D; font-size: 14px;font-weight: normal; }
   
   
   
    footer input { 
                   margin-left: 1030px;
                   margin-top: 300px;  
                   width: 70px;
                   height:40px;
    }
	
	
	
	
  </style>
</head>

<body>
     



<form id="f1"  action="Contrologin">
<fieldset class="fs">

  <legend> Registrar Usuarios: Supervisor o Operador  </legend>
  
  <label for="nombre">Nombre</label>
  <input type="text" id="nombre" name="nombre" /><br>
 
  <label for="apellidos">Apellidos</label>
  <input type="text" id="apellidos" name="apellido" size="50" />
  
  <label for="tipoUsuario"  id="label_usuario"> Tipo Usuario </label>
    
    
    <select name="reg_tipoUsuario"  > 
         <option  > Seleccionar Tipo</option>
         <% 
             Class.forName("com.mysql.jdbc.Driver");
		     Connection  conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/laptops_db","root","");
		     Statement Estamento = conexion.createStatement();
		     ResultSet result = Estamento.executeQuery("select id,name from tipo_usuario where name <> 'ADMINISTRADOR'");
		     while(result.next()) {  
		    	 out.println("<option value= " +result.getInt("id") +" > "  + result.getString("name")+"</option>"); 
		     };
		 %>
	
  </select>        
         
    
   
    
  <label for="dni" >DNI <input type="text" name="dni"  size="10" maxlength="9" /></label>
 
 
  <label for="contrasena">Contraseña</label>
  <input type="password" name ="contrasena"  />
  
  
   <label> Direccion :</label>
   <input type="text" name="direccion" size="50"/>
   
   <label> Email</label>
   <input type="text" name="email" size="50" />
   
   <label> Telefono</label>
   <input type="text" name="telefono" size="10" maxlength="9" />
   
   <input type="submit" class="boton" value=" Registrarse"><br>
   
</fieldset>

  
  
</form>


<div class="datagrid"><table>
    <thead>
       <tr>
          
          <th>Nombre</th>
          <th>Apellido</th>
          <th>Dni</th>
          <th>Direccion</th>
          <th>Email</th>
          <th>Telefono</th>
          <th>Tipo Usuario</th>
          <th>Estado</th>
          </tr>
    </thead>
    
   <tbody>
     <%
     try{
		   Class.forName("org.gjt.mm.mysql.Driver");
		    
		   conexion = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/laptops_db","root","");
		   Statement s = conexion.createStatement();
		   ResultSet resultado =  s.executeQuery("SELECT *FROM usuario,tipo_usuario where tipo_usuario_id!=1 and "+
		   "usuario.tipo_usuario_id=tipo_usuario.id");
		   
		   while(resultado.next()){
			  out.println("<tr>"+
			   
			   "<td>" +resultado.getObject("nombre")+ "</td>"+
			   "<td>"+resultado.getObject("apellidos")+"</td>"+
			   "<td>"+resultado.getObject("dni")+"</td>"+
			   "<td>"+resultado.getObject("direccion")+"</td>"+
			   "<td>"+resultado.getObject("email")+"</td>"+
			   "<td>"+resultado.getObject("telefono")+"</td>"+
			   "<td>"+resultado.getObject("name")+"</td>"+
			   "<td>"+resultado.getObject("Estado")+"</td>"+
			  
			   "</tr>");
		       
		   }
		   
		   
		   conexion.close();
		   
	   }catch(SQLException e){
		   e.printStackTrace();
	   }catch(ClassNotFoundException e){
		   e.printStackTrace();
	   }

     %> 
      </tbody>
    </table>
</div>

  <footer>
      <input  type="button" value="Salir" name="AuthorizationManager" onclick="button1()"/>
  </footer>
  
   


</body>
</html>