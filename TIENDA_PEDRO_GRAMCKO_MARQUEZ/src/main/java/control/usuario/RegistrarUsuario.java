package control.usuario;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.jasypt.util.password.StrongPasswordEncryptor;

import model.DAO.UsuarioDAO;
import model.VO.UsuarioVO;
/**
 * Servlet implementation class RegistrarServlet
 */
@WebServlet("/RegistrarUsuario")
public class RegistrarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegistrarUsuario() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/vistas/registro.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    UsuarioVO usuario = new UsuarioVO();

	    usuario.setId_rol(1);
	    usuario.setEmail((String) request.getParameter("email"));
	    String clave =((String) request.getParameter("clave"));
	    StrongPasswordEncryptor encriptar = new StrongPasswordEncryptor();

	    usuario.setClave(encriptar.encryptPassword(clave));
	        if (UsuarioDAO.registrarUsuario(usuario)) {
	            // El usuario se registró correctamente
	            request.getSession().setAttribute("usuario", usuario);
	            response.sendRedirect(request.getContextPath());
	        } else {
	            // El correo electrónico ya está registrado, mostrar mensaje de error
	        	System.out.println("ERROR");
	        	request.setAttribute("errorRegistro", "El correo electrónico ya está registrado");
	            request.getRequestDispatcher("/vistas/registro.jsp").forward(request, response);
	        }
	    
	}


}
