package control.producto;

import java.io.IOException;
import java.util.List;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener el ID del producto desde la solicitud
        int idProducto = Integer.parseInt(request.getParameter("id"));

        // Obtener los detalles del producto con el ID proporcionado
        ProductoVO producto = ProductoService.findById(idProducto);

        // Establecer el producto como atributo de solicitud para que pueda ser utilizado en la vista JSP
        request.setAttribute("producto", producto);

        // Redirigir al formulario de actualización con los datos del producto
        request.getRequestDispatcher("vistas/vistasAdministrador/ModificarProducto.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



        // Redirige a una página de confirmación o a la lista de productos actualizada
        response.sendRedirect("productos.jsp");
    }

}
