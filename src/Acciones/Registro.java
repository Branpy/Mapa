package Acciones;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import POJO.Funciones_BD;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
/**
 * Servlet implementation class Registro
 */
@WebServlet("/Registro")
public class Registro extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Funciones_BD baseDatos = new Funciones_BD();
	BusquedaPorDNI bus_dni = new BusquedaPorDNI(); 
	//public int titular;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registro() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		int tipo_titular,id_laptop,id_titular;
		PrintWriter web = response.getWriter();
		
		String titular = request.getParameter("id_titular");
		int i = Integer.parseInt(titular);
		
		String laptop = request.getParameter("id_laptop");
		int j = Integer.parseInt(laptop);
		
		String opcion = request.getParameter("opc_titular");
		tipo_titular = Integer.parseInt(opcion);
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		String dni = request.getParameter("dni");
		
		String direccion = request.getParameter("dir");
		String telefono = request.getParameter("cell");
		String email = request.getParameter("email");
		String codigo = request.getParameter("codigo");
		////////////////////////////////////////////////////////////////
		String marca = request.getParameter("marca");
		String modelo = request.getParameter("modelo");
		String serie = request.getParameter("serie");
		String descripcion = request.getParameter("desc");
		DateFormat fecha = new SimpleDateFormat("dd-MM-yyyy");
		//String time = fecha.format(new java.util.Date());
		
		if(baseDatos.buscarLaptopRegistrada(serie))
		{
			web.println("<meta http-equiv=\"refresh\" content=\"0; url=UsuariosPertenecientes.jsp\">");		
		}
		else
		{
			baseDatos.ingresar_titular(nombre, apellido, dni, direccion, telefono, email, tipo_titular, codigo);
			baseDatos.ingresar_laptop(marca, modelo, serie, descripcion);
			//baseDatos.laptop_titular(j, i);
			web.println("<meta http-equiv=\"refresh\" content=\"0; url=BuscarDNI.jsp\">");
		}
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
