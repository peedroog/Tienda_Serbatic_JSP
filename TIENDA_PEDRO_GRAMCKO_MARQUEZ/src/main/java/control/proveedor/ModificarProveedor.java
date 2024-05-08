package control.proveedor;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import model.VO.ProveedorVO;

import service.ProveedorService;


/**
 * Servlet implementation class ModificarProveedor
 */
@WebServlet("/ModificarProveedor")
public class ModificarProveedor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarProveedor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<ProveedorVO> listaProveedores = ProveedorService.findAll();
		
		request.setAttribute("listaProveedores", listaProveedores);
		
		request.getRequestDispatcher("vistas/vistasAdministrador/ModificarProveedor.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String nombre = request.getParameter("nombre");
		String direccion = request.getParameter("direccion");
		String provincia = request.getParameter("provincia");
		String localidad = request.getParameter("localidad");
		String telefono = request.getParameter("telefono");
		String cif = request.getParameter("cif");
		String email = request.getParameter("email");
		String activoParam = request.getParameter("activo");
		boolean activo = activoParam != null && activoParam.equals("on");



		ProveedorVO proveedor = new ProveedorVO();
		proveedor.setId(id);
		proveedor.setNombre(nombre);
		proveedor.setDireccion(direccion);
		proveedor.setProvincia(provincia);
		proveedor.setLocalidad(localidad);
		proveedor.setTelefono(telefono);
		proveedor.setCif(cif);
		proveedor.setEmail(email);
		proveedor.setActivo(activo);

	    // Llamar al servicio para agregar el usuario a la base de datos
	    boolean resultado = ProveedorService.actualizaProveedor(proveedor);

	    if (resultado) {
	        // Usuario añadido correctamente
	        request.setAttribute("mensaje", "El proveedor se ha modificado correctamente.");
	    } else {
	        // Error al añadir el usuario
	        request.setAttribute("mensaje", "Hubo un error al modificar el proveedor.");
	    }
	    
	    response.sendRedirect(request.getContextPath() + "/ModificarProveedor");
	}

}
