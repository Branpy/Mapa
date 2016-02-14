package Acciones;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import POJO.Funciones_BD;

/**
 * Servlet implementation class BusquedaPorDNI
 */
@WebServlet("/BusquedaPorDNI")
public class BusquedaPorDNI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	 private java.sql.Connection conexion=null;
	   String clase_Drver="org.gjt.mm.mysql.Driver";
		private java.sql.Statement s=null;
	
	Funciones_BD baseDatos = new Funciones_BD();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BusquedaPorDNI() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter web = response.getWriter();
		String dni = request.getParameter("dni");
		if(baseDatos.existeDNI(dni))
		{
			web.println("<p>EL DNI: "+dni+" YA ESTA REGISTRADO</p>");
		}
		else
		{
			ingresarDNI(dni);
			web.println("<meta http-equiv=\"refresh\" content=\"0; url=RegistroLaptop.jsp\">");
		}
		
	}
	public void ingresarDNI(String dni)
	   {
		   try{
			   Class.forName(clase_Drver);
			       conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/laptops_db","root",""); // crear conexion 
			     s =conexion.createStatement(); 
			     s.executeUpdate(" INSERT INTO otros VALUES(NULL, '"+ dni +"')");
			     conexion.close();
		       }catch(SQLException e ){
			   e.printStackTrace();
		       }catch(ClassNotFoundException e ){
			     e.printStackTrace();
		       }
	   }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
