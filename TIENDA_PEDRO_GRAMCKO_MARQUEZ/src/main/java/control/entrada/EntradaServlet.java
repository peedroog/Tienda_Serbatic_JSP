package control.entrada;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.ProductoDAO;
import model.VO.CategoriaVO;
import model.VO.ProductoVO;
import service.CategoriaService;

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

		// Recuperar los datos (Productos)
		List<ProductoVO> lista = ProductoDAO.findAll();


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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
