package Acciones;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import POJO.Funciones_BD;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class logeado
 */
@WebServlet("/logeado")
public class logeado extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public Funciones_BD funcion1_bd = new Funciones_BD();      
    /**
     * @see HttpServlet#HttpServlet()
     */
    public logeado() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter web = response.getWriter();
		HttpSession session = request.getSession();
	
	   //  boolean logueado=false;
	  	   response.setContentType("text/html");
		
		  String usuario = request.getParameter("login_tipoUsuario");
		  String pass= request.getParameter("password");
		  int id = Integer.parseInt(usuario);
		  
          if(funcion1_bd.buscarContra(id, pass) && id!=1){
			    	session.setAttribute("usuario", id);
			    	web.println("<meta http-equiv=\"refresh\" content=\"0; url=BuscarDNI.jsp\">");
			    	web.println("Entrando ");
			    	
		  }else{
			  if(funcion1_bd.buscarContra(id, pass)){
				   web.println("<meta http-equiv=\"refresh\" content=\"0; url=RegistroUsuario.jsp\">");
		      }else{
		    	  if(id==-1){  web.println("<script> alert(); </script>");
	              web.println("<meta http-equiv=\"refresh\" content=\"0; url=Principal.jsp\">");
			     }else{
			    	 if(!funcion1_bd.buscarContra(id, pass)){
	                	  web.println("<meta http-equiv=\"refresh\" content=\"0; url=Principal.jsp\">");
	                  }  
			     }
                  	  
		       }
		  }
           
          
			   
			  
			
	     
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
