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

import model.DAO.ProductoDAO;
import model.VO.ProductoVO;
import service.ProductoService;

/**
 * Servlet implementation class OrdenarProducto
 */
@WebServlet("/OrdenarProducto")
public class OrdenarProducto extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrdenarProducto() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderBy = request.getParameter("orderBy");

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
        
        if (orderBy != null) {

            switch (orderBy) {
                case "precioAsc":
                    request.setAttribute("listaFiltro", ProductoService.filtrarPrecioAsc());
                    break;
                case "precioDesc":
                	request.setAttribute("listaFiltro", ProductoService.filtrarPrecioDesc());
                    break;
                case "masComprados":
                	request.setAttribute("listaFiltro", ProductoService.filtrarPorMasComprados());
                    break;
                case "mejorValorados":
                    // Implementa la lógica para ordenar por productos mejor valorados
                    // Puedes llamar a un método en ProductoService que devuelva una lista de productos ordenados por los mejor valorados
                    // Ejemplo: productos = ProductoService.findBestRated();
                    break;
                default:
                    break;
            }

            request.getRequestDispatcher("/").forward(request, response);
        }
    }


}
