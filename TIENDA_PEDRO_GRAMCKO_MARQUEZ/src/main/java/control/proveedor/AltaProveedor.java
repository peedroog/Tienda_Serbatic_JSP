package control.proveedor;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jasypt.util.password.StrongPasswordEncryptor;

import model.VO.ProveedorVO;
import model.VO.UsuarioVO;
import service.ProveedorService;
import service.UsuarioService;

/**
 * Servlet implementation class AltaProveedor
 */
@WebServlet("/AltaProveedor")
public class AltaProveedor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AltaProveedor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("vistas/vistasAdministrador/AltaProveedor.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String nombre = request.getParameter("nombre");
		String direccion = request.getParameter("direccion");
		String provincia = request.getParameter("provincia");
		String localidad = request.getParameter("localidad");
		String telefono = request.getParameter("telefono");
		String cif = request.getParameter("cif");
		String email = request.getParameter("email");


		ProveedorVO proveedor = new ProveedorVO();

		proveedor.setEmail(email);
		proveedor.setNombre(nombre);
		proveedor.setDireccion(direccion);
		proveedor.setProvincia(provincia);
		proveedor.setLocalidad(localidad);
		proveedor.setTelefono(telefono);
		proveedor.setCif(cif);
		proveedor.setEmail(email);




		if (ProveedorService.altaProveedor(proveedor)) {
			request.setAttribute("mensaje", "El proveedor se ha dado de alta correctamente.");
		} else {
			request.setAttribute("mensaje", "Hubo un error al dar de alta el proveedor.");
		}

		request.getRequestDispatcher("vistas/vistasAdministrador/AltaProveedor.jsp").forward(request, response);
	}

}
