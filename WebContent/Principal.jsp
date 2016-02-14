<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>
<style type="text/css">
    *
{
margin:0px;
padding:0px;
}
  
body{
background:#222526;
position:relative;
padding:20px;
font-family:verdana;
 background-image: url("laptop3.png");
 background-position: 40% -35%;
 	background-repeat: no-repeat;
 	
 	
} 
                                
#loginform
{
width:550px;
height:auto;
position:relative;
margin:0 auto;
margin-top: 200px;

}

input, .fs select
{
display:block;
margin:0px auto 15px;
border-radius:5px;
background: #333333;
width:85%;
padding:12px 20px 12px 10px;
border:none;
color:#929999;                       
box-shadow:inset 0px 1px 5px #272727;
font-size:0.8em;
-webkit-transition:0.5s ease;
-moz-transition:0.5s ease;
-o-transition:0.5s ease;
-ms-transition:0.5s ease;
transition:0.5s ease; 
}


input:focus,.fs select:focus
{
-webkit-transition:0.5s ease;
-moz-transition:0.5s ease;
-o-transition:0.5s ease;
-ms-transition:0.5s ease;
transition:0.5s ease;  
box-shadow: 0px 0px 5px 1px #161718;
}

button
{
background: #43E837;
border-radius:50%;
border:10px solid #222526;
font-size:0.9em;
color:#3197EB;
font-weight:bold;
cursor:pointer;
width:85px;
height:85px;
position:absolute;
right: -42px;
top: 54px;
text-align:center;
-webkit-transition:0.5s ease;
-moz-transition:0.5s ease;
-o-transition:0.5s ease;
-ms-transition:0.5s ease;
transition:0.5s ease;
}

button:hover
{
background:#F7BB83;
border-color:#6065F6;
-webkit-transition:0.5s ease;
-moz-transition:0.5s ease;
-o-transition:0.5s ease;
-ms-transition:0.5s ease;
transition:0.5s ease;
}

button i
{
font-size:20px;
-webkit-transition:0.5s ease;
-moz-transition:0.5s ease;
-o-transition:0.5s ease;
-ms-transition:0.5s ease;
transition:0.5s ease;
}

button:hover i
{
color:#ff5f32;
-webkit-transition:0.5s ease;
-moz-transition:0.5s ease;
-o-transition:0.5s ease;
-ms-transition:0.5s ease;
transition:0.5s ease;
}
  
*:focus{outline:none;}
::-webkit-input-placeholder {
color:#929999;
}

:-moz-placeholder { /* Firefox 18- */
color:#929999; 
}

::-moz-placeholder {  /* Firefox 19+ */
color:#929999;  
}

:-ms-input-placeholder {  
color:#929999; 
}

h1
{
text-align:center;
color:#fff;
font-size:13px;
padding:12px 0px;
}

#note
{
color:#88887a;
font-size: 0.8em;
text-align:left;
padding-left:5px;
}

a
{
color:#88887a;
text-decoration:none;
-webkit-transition:0.5s ease;
-moz-transition:0.5s ease;
-o-transition:0.5s ease;
-ms-transition:0.5s ease;
transition:0.5s ease;
}

a:hover
{
color:#fff;
margin-left:5px;
-webkit-transition:0.5s ease;
-moz-transition:0.5s ease;
-o-transition:0.5s ease;
-ms-transition:0.5s ease;
transition:0.5s ease;
}

#mainlogin
{

margin-left:100px;
width:250px;
height:170px;
padding:10px 15px;
position:relative;
background:#555555;
border-radius:10px;
}

.fs select {
       
      margin-left:5px;
      height: 40px;
	   width: 200px;
    }
</style>


</head>

<body>
	
	<div id="loginform">
	  
	
         
         <div id="mainlogin">
			
				<h1>Login Tipo de Usuario</h1>
				<form action="logeado" class="fs">
				
				<select name="login_tipoUsuario"  > 
                     <option value= -1> Seleccionar Tipo</option>
                       <% 
             				Class.forName("com.mysql.jdbc.Driver");
		     				Connection  c = DriverManager.getConnection("jdbc:mysql://localhost:3306/laptops_db","root","");
		     				Statement Est = c.createStatement();
		     				ResultSet rs = Est.executeQuery("select id,name from tipo_usuario ");
		     				while(rs.next()) {  
		    	 			out.println("<option value= " +rs.getInt("id")+" > "  + rs.getString("name")+"</option>"); 
		     				}
		 				%>
	            </select>   
	             
				<input type="password" placeholder="password"  name="password" >
				<button type="submit"><i class="fa fa-arrow-right"></i></button>
				
				</form>
				
				
		</div>
		
		</div>
</body>


</html>