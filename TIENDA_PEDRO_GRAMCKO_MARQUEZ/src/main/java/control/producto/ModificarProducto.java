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

import model.VO.ProductoVO;
import service.ProductoService;

/**
 * Servlet implementation class ModificarProducto
 */
@WebServlet("/ModificarProducto")
public class ModificarProducto extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ModificarProducto() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<ProductoVO> productos = ProductoService.findAll();

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
		
		request.setAttribute("listaProductos", productos);

		// Redirigir al formulario de actualización con los datos del producto
		request.getRequestDispatcher("vistas/vistasAdministrador/ModificarProducto.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Obtener los parámetros del formulario
		int idProducto = Integer.parseInt(request.getParameter("idProducto"));
		int idCategoria = Integer.parseInt(request.getParameter("idCategoria"));
		String nombre = request.getParameter("nombre");
		String descripcion = request.getParameter("descripcion");
		double precio = Double.parseDouble(request.getParameter("precio"));
		int stock = Integer.parseInt(request.getParameter("stock"));
		float impuesto = Float.parseFloat(request.getParameter("impuesto"));
		String imagen = request.getParameter("imagen");
		boolean activo = request.getParameter("activo") != null; // Si el checkbox está marcado, devuelve true

		// Crear un objeto ProductoVO con los datos obtenidos
		ProductoVO producto = new ProductoVO();
		producto.setId(idProducto);
		producto.setId_categoria(idCategoria);
		producto.setNombre(nombre);
		producto.setDescripcion(descripcion);
		producto.setPrecio(precio);
		producto.setStock(stock);
		producto.setImpuesto(impuesto);
		producto.setImagen(imagen);
		producto.setActivo(activo);

		// Llamar al servicio para modificar el producto en la base de datos
		boolean modificacionExitosa = ProductoService.modificarProducto(producto);



		if (modificacionExitosa) {
			request.setAttribute("mensaje", "El producto se ha modificado correctamente.");
		} else {
			request.setAttribute("mensaje", "Hubo un error al modificar el producto.");
		}


		response.sendRedirect(request.getContextPath() + "/ModificarProducto");

	}

}
