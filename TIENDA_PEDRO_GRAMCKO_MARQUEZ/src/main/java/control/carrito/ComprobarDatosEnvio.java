package control.carrito;

import java.io.IOException;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.UsuarioDAO;
import model.VO.ProductoVO;
import model.VO.UsuarioVO;
import service.UsuarioService;

/**
 * Servlet implementation class ComprobarDatosEnvio
 */
@WebServlet("/ComprobarDatosEnvio")
public class ComprobarDatosEnvio extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComprobarDatosEnvio() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UsuarioVO usuario = (UsuarioVO) request.getSession().getAttribute("usuario");
        Map<ProductoVO, Integer> carrito = (Map<ProductoVO, Integer>) request.getSession().getAttribute("carrito");

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
        
        // Verificar si el carrito está vacío
        if (carrito == null || carrito.isEmpty()) {
            // Si el carrito está vacío, configurar el mensaje de error
            String errorCarritoVacio = "No se puede finalizar la compra porque el carrito está vacío.";
            request.setAttribute("errorCarritoVacio", errorCarritoVacio);

            // Redireccionar a la página de carrito con el mensaje de error
            request.getRequestDispatcher("/vistas/carrito.jsp").forward(request, response);
            return;
        }

        // Verificar si el usuario está autenticado
        if (usuario != null) {
            // Verificar si los datos del usuario están completos
            if (UsuarioService.comprobarDatosUsuario(usuario)) {
                // Si los datos del usuario están completos, redirigir a la página de finalizar compra
                response.sendRedirect(request.getContextPath() + "/FinalizarCompra");
            } else {
                // Si los datos del usuario no están completos, redirigir a la página de rellenar datos de usuario
                response.sendRedirect(request.getContextPath() + "/RellenarDatosUsuario");
            }
        } else {
            // Si el usuario no está autenticado, redirigir a la página de inicio de sesión
            response.sendRedirect(request.getContextPath() + "/Login");
        }
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
