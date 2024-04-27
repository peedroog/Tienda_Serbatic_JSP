package control.producto;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ProductoService;
import model.VO.*;

/**
 * Servlet implementation class AltaProducto
 */
@WebServlet("/AltaProducto")
public class AltaProducto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AltaProducto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getRequestDispatcher("vistas/vistasAdministrador/AltaProducto.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // Obtener los parámetros del formulario
	        int idCategoria = Integer.parseInt(request.getParameter("id_categoria"));
	        String nombre = request.getParameter("nombre");
	        String descripcion = request.getParameter("descripcion");
	        double precio = Double.parseDouble(request.getParameter("precio"));
	        int stock = Integer.parseInt(request.getParameter("stock"));
	        float impuesto = Float.parseFloat(request.getParameter("impuesto"));
	        String imagen = request.getParameter("imagen");

	        // Crear un objeto ProductoVO con los datos obtenidos
	        ProductoVO producto = new ProductoVO();
	        producto.setId_categoria(idCategoria);
	        producto.setNombre(nombre);
	        producto.setDescripcion(descripcion);
	        producto.setPrecio(precio);
	        producto.setStock(stock);
	        producto.setImpuesto(impuesto);
	        producto.setImagen(imagen);

	        // Llamar al servicio para agregar el producto a la base de datos
	        ProductoService.altaProducto(producto);

	        // Puedes redirigir a una página de éxito o mostrar un mensaje aquí
	        response.getWriter().write("Producto agregado correctamente");
	    }

}
