package control.usuario;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Locale;
import java.util.ResourceBundle;

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
		
	    String lang = request.getParameter("lang");
	    

	    Locale locale;
	    ResourceBundle idiomas;
	    if (lang != null && !lang.isEmpty()) {
	        locale = new Locale(lang);
	        idiomas = ResourceBundle.getBundle("idioma", locale);
	    } else {
	        // Establecer un idioma predeterminado si no se ha seleccionado ninguno
	        locale = new Locale("es"); // Español como idioma predeterminado
	        idiomas = ResourceBundle.getBundle("idioma", locale);
	    }

	    request.setAttribute("languaje", lang);
	    request.setAttribute("idiomas", idiomas);
		
		request.getRequestDispatcher("/vistas/registro.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    UsuarioVO usuario = new UsuarioVO();
	    String email = request.getParameter("email");
	    String clave =((String) request.getParameter("clave"));
	    usuario.setId_rol(1);
	    usuario.setEmail(email);
	    
	    
	    // Realizar validaciones de datos
	    if (email == null || email.isEmpty() || clave == null || clave.isEmpty()) {
	        // Si alguno de los campos está vacío, mostrar un mensaje de error
	        request.setAttribute("errorRegistro", "Por favor, completa todos los campos");
	        request.getRequestDispatcher("/vistas/registro.jsp").forward(request, response);
	        return;
	    }
	    
	    StrongPasswordEncryptor encriptar = new StrongPasswordEncryptor();

	    usuario.setClave(encriptar.encryptPassword(clave));
	        if (UsuarioDAO.registrarUsuario(usuario)) {
	            // El usuario se registró correctamente
	            request.getSession().setAttribute("usuario", usuario);
	            response.sendRedirect(request.getContextPath());
	        } else {
	            // El correo electrónico ya está registrado, mostrar mensaje de error
	        	request.setAttribute("errorRegistro", "El correo electrónico ya está registrado");
	            request.getRequestDispatcher("/vistas/registro.jsp").forward(request, response);
	        }
	    
	}


}
