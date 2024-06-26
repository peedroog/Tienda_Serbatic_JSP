package control.producto;

import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ProductoService;
import model.VO.ProductoVO;

/**
 * Servlet implementation class CategoriasProducto
 */
@WebServlet("/CategoriasProducto")
public class CategoriasProducto extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CategoriasProducto() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String categoriaSeleccionada = request.getParameter("categoria");

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
		
		// Si se ha seleccionado una categoría, obtener los productos correspondientes
		if (categoriaSeleccionada != null && !categoriaSeleccionada.isEmpty()) {

			int id_cat = 0;
			if (categoriaSeleccionada.equals("Perros")) {
				id_cat = 1;
			} else if (categoriaSeleccionada.equals("Gatos")) {
				id_cat = 2;
			} else if (categoriaSeleccionada.equals("Otros")) {
				id_cat = 3;
			}

			// Obtener los productos de la categoría utilizando el servicio ProductoService
			List<ProductoVO> productos = ProductoService.productosPorCategoria(id_cat);

			// Guardar los productos en el request para mostrarlos en el JSP
			request.setAttribute("listaCategoria", productos);

			request.getRequestDispatcher("/").forward(request, response);

		}
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
