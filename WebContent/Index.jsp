<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

       <%@page import="POJO.*" %>
     
   <%  Funciones_BD funct= new Funciones_BD();
        if(funct.ValidarAdministrador())
        {
          out.println("<script type= \"text/javascript\"> window.location=\"Principal.jsp\"</script>");
        }
        else
        {
        	  out.println("<script type= \"text/javascript\"> window.location=\"RegistroAdmin.jsp\"</script>");
        }
    %>
    