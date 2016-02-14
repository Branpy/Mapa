
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html ">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">

.form{
	background:#f1f1f1; width:470px; margin:0 auto; padding-left:50px; padding-top:20px;
	margin-top: 50px;
}
.form fieldset{border:0px; padding:0px; margin:0px;}
.form p.contact { font-size: 12px; margin:0px 0px 10px 0;line-height: 14px; font-family:Arial, Helvetica;}

.form input[type="text"] { width: 400px; }
.form input[type="email"] { width: 400px; }
.form input[type="password"] { width: 400px; }
.form label { color: #000; font-weight:bold;font-size: 12px;font-family:Arial, Helvetica; }
.form input, textarea { background-color: rgba(255, 255, 255, 0.4); border: 1px solid rgba(122, 192, 0, 0.15); padding: 7px; font-family: Keffeesatz, Arial; color: #4b4b4b; font-size: 14px; -webkit-border-radius: 5px; margin-bottom: 15px; margin-top: -10px; }
.form input:focus,textarea:focus { border: 1px solid #ff5400; background-color: rgba(255, 255, 255, 1); }
.form .select-style {
  -webkit-appearance: button;
  -webkit-border-radius: 2px;
  -webkit-box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1);
  -webkit-padding-end: 20px;
  -webkit-padding-start: 2px;
  -webkit-user-select: none;
  background-image: url(images/select-arrow.png), -webkit-linear-gradient(#FAFAFA, #F4F4F4 40%, #E5E5E5);
  background-position: center right;
  background-repeat: no-repeat;
  border: 0px solid #FFF;
  color: #555;
  font-size: inherit;
  margin: 0;

  overflow: hidden;
  padding-top: 5px;
  padding-bottom: 5px;
  text-overflow: ellipsis;
  white-space: nowrap;}

.form .gender { width:410px; }
.form input.buttom{ background: #4b8df9; display: inline-block; padding: 5px 10px 6px; color: #fbf7f7; text-decoration: none; font-weight: bold; line-height: 1; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px; -moz-box-shadow: 0 1px 3px #999; -webkit-box-shadow: 0 1px 3px #999; box-shadow: 0 1px 3px #999; text-shadow: 0 -1px 1px #222; border: none; position: relative; cursor: pointer; font-size: 14px; font-family:Verdana, Geneva, sans-serif;}
.form input.buttom:hover	{ background-color: #2a78f6; }

</style>


</head>
<body>

<div class="container">
			
      <div  class="form">
    		
    		<form id="contactform" action="Controlador_Admin"> 
    			<p class="contact"><label for="name">Nombre </label></p> 
    			<input name="nombre" placeholder=" Nombres" required="" tabindex="1" type="text"> 
    			
    			<p class="contact"><label for="name">Apellidos</label></p> 
    			<input  name="apellido" placeholder=" Apellidos" required="" tabindex="1" type="text"> 
    			 
    			<p class="contact"><label for="email">Email</label></p> 
    			<input id="email" name="email" placeholder="ejemplo@domain.com" required="" type="email"> <br>
    			
    			<p class="contact"><label for="email">Ciudad</label></p> 
    		    <input id="email" name="direccion" placeholder="Av.Ejemplo " required="" type="text"> <br>
    			
    			<label for="dni" >
    			 DNI </label> <br><br>
    			<input type="text" name="dni"  size="10" maxlength="9" /> <br>
    			
    			<label for="tipoUsuario"  id="label_usuario"> Tipo Usuario </label>
    		      <select name="reg_tipoUsuario"  > 
                    <option  > Seleccionar Tipo</option>
                       <% 
                         Class.forName("org.gjt.mm.mysql.Driver");
    					  Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/laptops_db","root","");
    					Statement s = conexion.createStatement();
          			     ResultSet r =s.executeQuery("select id,name from tipo_usuario where name='ADMINISTRADOR'");
          			  
           		      while(r.next()) {  
           		    	  out.println("<option value= " +r.getInt("id") +" > "  + r.getString("name")+"</option>");
           			  }
		 				%>
	
 				 </select>    
                <br><br>
                
                <p class="contact"><label for="password"> Crear password</label></p> 
                <input type="password" name="password" required=" "> 
                
                <p class="contact"><label for="repassword"> Confirmar contraseña </label></p> 
    			<input type="password" name="repassword" required=" "> 
    			
                <p class="contact"><label for="phone">Numero de celular </label></p> 
                <input name="celular" placeholder="phone number" required="" type="text"> <br>
                
                <input class="buttom" name="submit" id="submit" tabindex="5" value="Registrarme!" type="submit"> 	 
   </form> 
</div>      
</div>
</body>
</html>