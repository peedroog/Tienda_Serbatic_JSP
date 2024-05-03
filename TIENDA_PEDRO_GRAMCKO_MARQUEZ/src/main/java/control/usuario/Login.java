package control.usuario;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;

import org.jasypt.util.password.StrongPasswordEncryptor;

import conexion.Conexion;
import model.DAO.UsuarioDAO;
import model.VO.PedidoVO;
import model.VO.ProductoVO;
import model.VO.UsuarioVO;
import service.PedidoService;
import service.UsuarioService;
import hilos.*;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

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
		
		request.getRequestDispatcher("/vistas/login/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
		    String email = request.getParameter("email");
		    String clave = request.getParameter("clave");
		    request.getSession().setAttribute("email", email);
		    StrongPasswordEncryptor encriptar = new StrongPasswordEncryptor();

		    


		    UsuarioVO usuario = UsuarioService.iniciarSesion(email, clave);
		    if (usuario != null && encriptar.checkPassword(clave, usuario.getClave())) {
		        // Verificar si el usuario no es nulo primero antes de verificar la contraseña
		        request.getSession().setAttribute("usuario", usuario);
		        

		        
		        // Iniciar el hilo si la sesión es nula
		        if (!EnviarPedidos.isRunning()) {
		            EnviarPedidos.startThread();
		        }
		        
		        // Verificar el id_rol del usuario y redirigir según su rol
		        switch (usuario.getId_rol()) {
		            case 1:
		                // Redirigir al usuario con rol 1 a una página específica
		                // Verificar el estado del carrito solo para usuarios con rol de cliente (1)
		                @SuppressWarnings("unchecked")
		                Map<ProductoVO, Integer> carrito = (Map<ProductoVO, Integer>) request.getSession().getAttribute("carrito");
		                if (carrito == null || carrito.isEmpty()) {
		                    // Si el carrito está vacío, redirigir al usuario a la página de inicio
		                    response.sendRedirect(request.getContextPath());
		                } else {
		                    // Si el carrito no está vacío, redirigir al usuario al proceso de finalización de compra
		                    response.sendRedirect(request.getContextPath() + "/ComprobarDatosEnvio");
		                }
		                break;
		            case 2:
		                // Redirigir al usuario con rol 2 a una página específica
		                response.sendRedirect(request.getContextPath() + "/Admin");
		                break;
		            case 3:
		                // Redirigir al usuario con rol 3 a una página específica
		                response.sendRedirect(request.getContextPath() + "/Admin");
		                break;
		            default:
		                // Redirigir al usuario a una página por defecto en caso de que su rol no esté definido
		                response.sendRedirect(request.getContextPath());
		                break;
		        }
		    } else {
		        
		        if (EnviarPedidos.isRunning()) {
		            EnviarPedidos.stopThread();
		        }
		        request.setAttribute("errorInicioSesion", "El usuario o la contraseña son incorrectos");
		        request.getRequestDispatcher("/vistas/login/login.jsp").forward(request, response);
		    }
		}


}


