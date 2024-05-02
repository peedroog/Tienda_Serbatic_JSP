package control.cuenta;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jasypt.util.password.StrongPasswordEncryptor;

import model.VO.UsuarioVO;
import service.UsuarioService;

/**
 * Servlet implementation class CambiarContraseña
 */
@WebServlet("/CambiarContraseña")
public class CambiarContraseña extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CambiarContraseña() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    StrongPasswordEncryptor encriptar = new StrongPasswordEncryptor();
	    // Obtener la contraseña actual del parámetro en la URL
	    String currentPassword = request.getParameter("currentPassword");
	    String newPassword = request.getParameter("password"); // Obtener la nueva contraseña del parámetro en la URL
	    UsuarioVO usuario = (UsuarioVO) request.getSession().getAttribute("usuario");
	    
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

	    // Verificar si la contraseña actual es correcta
	    if (encriptar.checkPassword(currentPassword, usuario.getClave())) {
	        // Encriptar la nueva contraseña después de verificar la contraseña actual
	        String encryptedNewPassword = encriptar.encryptPassword(newPassword);
	        usuario.setClave(encryptedNewPassword); // Establecer la nueva contraseña encriptada en el objeto usuario
	        
	        // Intentar cambiar la contraseña
	        boolean contraseñaActualizada = UsuarioService.cambiarContraseña(usuario);
	        
	        if (contraseñaActualizada) {
	            // Si la contraseña se actualizó correctamente, redirigir a completarDatos.jsp con un mensaje de éxito
	            request.setAttribute("mensaje", "Contraseña actualizada correctamente");
	            request.getRequestDispatcher("/vistas/completarDatos.jsp").forward(request, response);;

	        } else {
	            // Si la contraseña no se actualizó, redirigir a completarDatos.jsp con un mensaje de error
	            request.setAttribute("mensaje", "Contraseña no actualizada");
	            request.getRequestDispatcher("/vistas/completarDatos.jsp").forward(request, response);

	        }
	    } else {
	        // La contraseña actual no es correcta, redirigir a completarDatos.jsp con un mensaje de error
	        request.setAttribute("mensaje", "La contraseña actual no es correcta");
	        request.getRequestDispatcher("/vistas/completarDatos.jsp").forward(request, response);
	    }
	}


}
