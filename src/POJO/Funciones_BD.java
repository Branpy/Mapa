package POJO;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

public class Funciones_BD {
    private java.sql.Connection conexion=null;
   String clase_Drver="org.gjt.mm.mysql.Driver";
	private java.sql.Statement s=null;
	
   public void insertar(String dni,String apellido,String nombre,String direccion,String telefono,String email,int id1,String contra) {
	   
	   try{
		   Class.forName(clase_Drver);
		       conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/laptops_db","root",""); // crear conexion 
		     s =conexion.createStatement(); 
		     s.executeUpdate(" INSERT INTO usuario VALUES(NULL, ' "+ dni +"',' "+apellido +" ',' "+nombre+" ','" +direccion + "',' "+telefono + "',' "+email +"',"+id1+","+"AES_ENCRYPT('"+contra +"','passw') ) ");
		     conexion.close();
	       }catch(SQLException e ){
		   e.printStackTrace();
	       }catch(ClassNotFoundException e ){
		     e.printStackTrace();
	       }
     }
   
   public void ingresar_titular(String nomTitu,String apellidoTitu,String dniTitu,String dirTitu,String telTitu,String emailTitu,int idTipoTitular,String codigoTitu)
   {
	   try{
		   Class.forName(clase_Drver);
		       conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/laptops_db","root",""); // crear conexion 
		     s =conexion.createStatement(); 
		     s.executeUpdate(" INSERT INTO titular VALUES(NULL, '"+ dniTitu +"','"+apellidoTitu +"','"+nomTitu+"','" +dirTitu + "',' "+telTitu + "',' "+emailTitu +"','"+idTipoTitular+"','"+codigoTitu+"')");
		     conexion.close();
	       }catch(SQLException e ){
		   e.printStackTrace();
	       }catch(ClassNotFoundException e ){
		     e.printStackTrace();
	       }
   }
 
   public void ingreso_salida(int lap_titular_id,String fecha,boolean es_ingreso,int puerta_id,int usuario_id){
	   try{
		   Class.forName(clase_Drver);
		       conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/laptops_db","root",""); // crear conexion 
		     s =conexion.createStatement(); 
		     s.executeUpdate(" INSERT INTO ingreso_salida VALUES(NULL, '"+ lap_titular_id +"','"+fecha +"','"+es_ingreso+"','" +puerta_id + "',' "+usuario_id +"')");
		     conexion.close();
	       }catch(SQLException e ){
		   e.printStackTrace();
	       }catch(ClassNotFoundException e ){
		     e.printStackTrace();
	       }
   }
   
   public void ingresar_laptop(String marca, String modelo, String serie, String descripcion)
   {
	   try{
		   Class.forName(clase_Drver);
		       conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/laptops_db","root",""); // crear conexion 
		     s =conexion.createStatement(); 
		     s.executeUpdate(" INSERT INTO laptop VALUES(NULL, '"+ marca +"','"+modelo +"','"+serie+"','" +descripcion+"')");
		     conexion.close();
	       }catch(SQLException e ){
		   e.printStackTrace();
	       }catch(ClassNotFoundException e ){
		     e.printStackTrace();
	       }
   }
   
   public void laptop_titular(int laptop_id,int titular_id)
   {
	   try{
		   Class.forName(clase_Drver);
		       conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/laptops_db","root",""); // crear conexion 
		     s =conexion.createStatement(); 
		     s.executeUpdate(" INSERT INTO laptop_titular VALUES(NULL, '"+ laptop_id +"','"+titular_id +"',NULL,NULL)");
		     conexion.close();
	       }catch(SQLException e ){
		   e.printStackTrace();
	       }catch(ClassNotFoundException e ){
		     e.printStackTrace();
	       }
	   
   }
   public boolean existeDNI(String dni)
   {
	   boolean encontrado=false;
	   try {
	       Class.forName(clase_Drver);
	      conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/laptops_db","root","");
	       s= conexion.createStatement();   
		     String peticion= "Select dni from titular where dni = '"+ dni +"'";
             ResultSet rs = s.executeQuery(peticion); 
		     while(rs.next()) {  
		    	 if(rs.getString("dni").equals(dni))
		    	 {
		    		 encontrado=true;
		    	 }
		     }
  }catch(Exception e){
	  e.printStackTrace();  
  }
	   return encontrado;
   }
   public void puerta(String nombre,boolean corriendo)
   {
	   try{
		   Class.forName(clase_Drver);
		       conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/laptops_db","root",""); // crear conexion 
		     s =conexion.createStatement(); 
		     s.executeUpdate(" INSERT INTO puerta VALUES(NULL, '"+ nombre +"','"+corriendo +"')");
		     conexion.close();
	       }catch(SQLException e ){
		   e.printStackTrace();
	       }catch(ClassNotFoundException e ){
		     e.printStackTrace();
	       }
   }
   public boolean buscarContra(int tipo_usuario_id ,String pass){
	      boolean logueado=false;
		   try {
			       Class.forName(clase_Drver);
			      conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/laptops_db","root","");
			       s= conexion.createStatement();   
				     String peticion= "Select *from usuario where tipo_usuario_id = '"+ tipo_usuario_id +"' AND password=AES_ENCRYPT('"+pass +"','passw')";
		             ResultSet rs = s.executeQuery(peticion); 
				     while(rs.next()) {  
				    	logueado=true; 
				     }
			
		  }catch(Exception e){
			  e.printStackTrace();  
		  }
		 return logueado;
	   }   
   public boolean buscarLaptopRegistrada(String ingresado)
   {
	   boolean encontrado=false;
	   try {
	       Class.forName(clase_Drver);
	      conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/laptops_db","root","");
	       s= conexion.createStatement();   
		     String peticion= "Select serie from laptop";
             ResultSet rs = s.executeQuery(peticion); 
		     while(rs.next()) {
		    	 if(rs.getString("serie").equals(ingresado))
		    	 {
		    		 encontrado=true;
		    	 }
		     }
	   }
	   catch(Exception e)
	   {
		   e.printStackTrace();  
	   }
	   return encontrado;
   }
     public boolean ValidarAdministrador(){
    	 int cont=0;
    	 boolean valido=false;
    	 try {
    		 Class.forName(clase_Drver);
    		 conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/laptops_db","root","");
   		     s = conexion.createStatement();
   		     ResultSet r = s.executeQuery("select * from usuario where tipo_usuario_id=1");
   		      while(r.next()) {  
   		        cont++;
   			      if(cont==1){ 
   				     valido=true;
   				  break;
   			  }
   		   }
		} catch (Exception e) {
			// TODO: handle exception
			 e.printStackTrace();
		}
		return valido;
     }

}



