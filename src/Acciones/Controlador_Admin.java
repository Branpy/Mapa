package Acciones;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import POJO.Funciones_BD;

/**
 * Servlet implementation class Controlador_Admin
 */
@WebServlet("/Controlador_Admin")
public class Controlador_Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Funciones_BD bd_admin = new Funciones_BD();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controlador_Admin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter web = response.getWriter();
		int id1=0;
		   response.setContentType("text/html");
	       // PrintWriter mensajes = response.getWriter();
		                                                                                                                                                   
		   String nombre = request.getParameter("nombre");
		   String apellido = request.getParameter("apellido");
		   String dni = request.getParameter("dni");
		   String tipo_usuario=request.getParameter("reg_tipoUsuario");
		   
		   String contra=request.getParameter("password");
		   String comprob_contra=request.getParameter("repassword");
		   
		   String direccion=request.getParameter("direccion");
		   String email=request.getParameter("email");
		   String telefono=request.getParameter("celular");
		   id1 = Integer.parseInt(tipo_usuario);
		   
		   if(contra.equals(comprob_contra)){
			   web.println("<meta http-equiv=\"refresh\" content=\"0; url=RegistroUsuario.jsp\">");   
			   bd_admin.insertar(dni, apellido, nombre, direccion, telefono, email,id1,contra);
			   
		   }else{
			   web.println("<meta http-equiv=\"refresh\" content=\"0; url=RegistroAdministrador.jsp\">");
		   }
		   
		   if("regresar".equals(request.getParameter("regresar"))) {
			   web.println("<meta http-equiv=\"refresh\" content=\"0; url=Principal.jsp\">");
		   }
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
