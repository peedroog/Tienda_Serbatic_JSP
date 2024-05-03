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


import model.DAO.ProductoDAO;
import model.VO.ProductoVO;


/**
 * Servlet implementation class EntradaServlet
 */
@WebServlet("")
public class EntradaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EntradaServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
//    @Override
//    public void init() throws ServletException {
//        // Registra ManagerSesiones como un HttpSessionListener
//        getServletContext().addListener(new ManagerSesiones());
//    }

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
		
		if(request.getAttribute("listaBuscar") != null) {
			request.setAttribute("catalogo", request.getAttribute("listaBuscar"));
		}
		
		if(request.getAttribute("listaFiltro") != null) {
			request.setAttribute("catalogo", request.getAttribute("listaFiltro"));
		}
		
		if(request.getAttribute("listaCategoria") != null) {
			request.setAttribute("catalogo", request.getAttribute("listaCategoria"));
		}

		request.getRequestDispatcher(pagina).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}
	

}