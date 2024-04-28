package control.usuario;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jasypt.util.password.StrongPasswordEncryptor;

import model.DAO.UsuarioDAO;
import model.VO.UsuarioVO;
import service.UsuarioService;

/**
 * Servlet implementation class AltaUsuario
 */
@WebServlet("/AltaUsuario")
public class AltaUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AltaUsuario() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("vistas/vistasAdministrador/AltaUsuario.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Obtener los parámetros del formulario
		int idCategoria = Integer.parseInt(request.getParameter("idRol"));
		String email = request.getParameter("email");
		String clave = request.getParameter("clave");
		String nombre = request.getParameter("nombre");
		String apellido1 = request.getParameter("apellido1");
		String apellido2 = request.getParameter("apellido2");
		String direccion = request.getParameter("direccion");
		String provincia = request.getParameter("provincia");
		String localidad = request.getParameter("localidad");
		String telefono = request.getParameter("telefono");
		String dni = request.getParameter("dni");

		// Crear un objeto UsuarioVO con los datos obtenidos
		UsuarioVO usuario = new UsuarioVO();
		usuario.setId_rol(idCategoria);
		usuario.setEmail(email);
		usuario.setNombre(nombre);
		usuario.setApellido1(apellido1);
		usuario.setApellido2(apellido2);
		usuario.setDireccion(direccion);
		usuario.setProvincia(provincia);
		usuario.setLocalidad(localidad);
		usuario.setTelefono(telefono);
		usuario.setDni(dni);

		StrongPasswordEncryptor encriptar = new StrongPasswordEncryptor();

		usuario.setClave(encriptar.encryptPassword(clave));
		if (UsuarioService.registrarUsuario(usuario)) {
			request.setAttribute("mensaje", "El usuario se ha modificado correctamente.");
		} else {
			request.setAttribute("mensaje", "Hubo un error al dar de alta el usuario.");
		}

		request.getRequestDispatcher("vistas/vistasAdministrador/AltaUsuario.jsp").forward(request, response);

	}

}
