package control.entrada;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jasypt.util.password.StrongPasswordEncryptor;

import factura.CrearFactura;
import hilos.EnviarPedidos;
import model.DAO.ProductoDAO;
import model.VO.ProductoVO;
import model.VO.UsuarioVO;
import service.UsuarioService;

/**
 * Servlet implementation class EntradaServlet
 */
@WebServlet("")
public class EntradaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Thread hilo;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EntradaServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public void init() {

		boolean creado = false;
		List<UsuarioVO> usuarios = UsuarioService.findAll();
		for (UsuarioVO usuarioVO : usuarios) {
			if (usuarioVO.getEmail().equals("admin")) {
				creado = true;
			}
		}

		if (!creado) {
			StrongPasswordEncryptor encriptar = new StrongPasswordEncryptor();
			UsuarioVO usuario = new UsuarioVO();
			usuario.setEmail("admin");
			usuario.setClave(encriptar.encryptPassword("admin"));
			usuario.setId_rol(3);
			UsuarioService.registrarUsuario(usuario);
		}
		

        hilo = new Thread(new EnviarPedidos(getServletContext()));
        hilo.start();
		
	}
	
	@Override
	public void destroy() {
		EnviarPedidos.running = false;
        try {
            hilo.join(); // Esperar a que el hilo termine
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String pagina = "/vistas/index/index.jsp";

		if (request.getSession().getAttribute("carrito") == null) {

			request.getSession().setAttribute("carrito", new HashMap<Integer, Integer>());
			System.out.println("carrito disponible");
		}

		List<ProductoVO> lista = ProductoDAO.findAll();

		String lang = request.getParameter("lang");

		Locale locale;
		ResourceBundle idiomas;
		if (lang != null && !lang.isEmpty()) {
			locale = new Locale(lang);
			idiomas = ResourceBundle.getBundle("idioma", locale);
		} else {

			locale = new Locale("es");
			idiomas = ResourceBundle.getBundle("idioma", locale);
		}

		request.setAttribute("languaje", lang);
		request.setAttribute("idiomas", idiomas);

		request.setAttribute("catalogo", lista);

		if (request.getAttribute("listaBuscar") != null) {
			request.setAttribute("catalogo", request.getAttribute("listaBuscar"));
		}

		if (request.getAttribute("listaFiltro") != null) {
			request.setAttribute("catalogo", request.getAttribute("listaFiltro"));
		}

		if (request.getAttribute("listaCategoria") != null) {
			request.setAttribute("catalogo", request.getAttribute("listaCategoria"));
		}

		UsuarioVO usuario = (UsuarioVO) request.getSession().getAttribute("usuario");

		if (usuario == null) {
		    request.getRequestDispatcher(pagina).forward(request, response);
		} else {
		    if (usuario.getId_rol() == 3 || usuario.getId_rol() == 2) {
		        response.sendRedirect(request.getContextPath() + "/Admin");
		    } else {
		        request.getRequestDispatcher(pagina).forward(request, response);
		    }
		}



	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}