package control.categoria;

import java.io.IOException;
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
 * Servlet implementation class AltaCategoria
 */
@WebServlet("/AltaCategoria")
public class AltaCategoria extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AltaCategoria() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
		request.getRequestDispatcher("vistas/vistasAdministrador/AltaCategoria.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener los parámetros del formulario
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");

        // Crear un objeto ProductoVO con los datos obtenidos
        CategoriaVO categoria = new CategoriaVO();
        categoria.setNombre(nombre);
        categoria.setDescripcion(descripcion);


        // Llamar al servicio para agregar el producto a la base de datos
        boolean resultado = CategoriaService.altaCategoria(categoria);

        if (resultado) {
            // Producto añadido correctamente
            request.setAttribute("mensaje", "La categoría se ha añadido correctamente.");
        }else {
            // Error al añadir el producto
            request.setAttribute("mensaje", "Hubo un error al añadir la categoría.");
        }
        request.getRequestDispatcher("vistas/vistasAdministrador/AltaCategoria.jsp").forward(request, response);
	}

}
