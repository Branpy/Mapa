package Acciones;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import POJO.Funciones_BD;
import sun.rmi.runtime.Log;

/**
 * Servlet implementation class Contrologin
 */
@WebServlet("/Contrologin")
public class Contrologin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//private Connection conexion = null; 
	public Funciones_BD funcion_bd = new Funciones_BD();  
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Contrologin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  
		   int id1=0;
		   response.setContentType("text/html");
		   PrintWriter web = response.getWriter();
	       // PrintWriter mensajes = response.getWriter();
		   String nombre = request.getParameter("nombre");
		   String apellido = request.getParameter("apellido");
		   String dni = request.getParameter("dni");
		   String tipo_usuario=request.getParameter("reg_tipoUsuario");
		   String contra=request.getParameter("contrasena");
		   String direccion=request.getParameter("direccion");
		   String email=request.getParameter("email");
		   String telefono=request.getParameter("telefono");
		   id1 = Integer.parseInt(tipo_usuario);
	       funcion_bd.insertar(dni, apellido, nombre, direccion, telefono, email,id1,contra);
	       web.println("<meta http-equiv=\"refresh\" content=\"0; url=RegistroUsuario.jsp\">");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	}

}
