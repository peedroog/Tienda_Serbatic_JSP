package control.categoria;

import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.VO.CategoriaVO;
import model.VO.ProductoVO;
import service.CategoriaService;
import service.ProductoService;

/**
 * Servlet implementation class ModificarCategoria
 */
@WebServlet("/ModificarCategoria")
public class ModificarCategoria extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ModificarCategoria() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<CategoriaVO> categorias = CategoriaService.findAll();

		request.setAttribute("listaCategorias", categorias);
		
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

		// Redirigir al formulario de actualización con los datos del producto
		request.getRequestDispatcher("vistas/vistasAdministrador/ModificarCategoria.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		

		int idCategoria = Integer.parseInt(request.getParameter("idCategoria"));
		String nombre = request.getParameter("nombre");
		String descripcion = request.getParameter("descripcion");
		boolean activo = request.getParameter("activo") != null;


		CategoriaVO categoria = new CategoriaVO();

		categoria.setId(idCategoria);
		categoria.setNombre(nombre);
		categoria.setDescripcion(descripcion);
		categoria.setActivo(activo);


		boolean modificacionExitosa = CategoriaService.actualizaCategoria(categoria);


		
		if (modificacionExitosa) {
			request.setAttribute("mensaje", "La categoría se ha modificado correctamente.");
		} else {
			request.setAttribute("mensaje", "Hubo un error al modificar la categoría.");
		}

		

		response.sendRedirect(request.getContextPath() + "/ModificarCategoria");
	}

}
