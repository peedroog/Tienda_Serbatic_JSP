package control.usuario;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jasypt.util.password.StrongPasswordEncryptor;

import model.VO.ProductoVO;
import model.VO.UsuarioVO;
import service.ProductoService;
import service.UsuarioService;

/**
 * Servlet implementation class ModificarUsuario
 */
@WebServlet("/ModificarUsuario")
public class ModificarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<UsuarioVO> listaUsuarios = UsuarioService.findAll();
		
		request.setAttribute("listaUsuarios", listaUsuarios);
		
		request.getRequestDispatcher("vistas/vistasAdministrador/ModificarUsuario.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // Obtener los parámetros del formulario
		int id = Integer.parseInt(request.getParameter("idUsuario"));
	    int idRol = Integer.parseInt(request.getParameter("id_rol"));
	    String email = request.getParameter("email");
	    String nombre = request.getParameter("nombre");
	    String apellido1 = request.getParameter("apellido1");
	    String apellido2 = request.getParameter("apellido2");
	    String direccion = request.getParameter("direccion");
	    String provincia = request.getParameter("provincia");
	    String localidad = request.getParameter("localidad");
	    String telefono = request.getParameter("telefono");
	    String dni = request.getParameter("dni");
	    boolean activo = Boolean.parseBoolean(request.getParameter("activo"));

	    // Crear un objeto UsuarioVO con los datos obtenidos
	    UsuarioVO usuario = new UsuarioVO();
	    usuario.setId(id);
	    usuario.setId_rol(idRol);
	    usuario.setEmail(email);	    
	    usuario.setNombre(nombre);
	    usuario.setApellido1(apellido1);
	    usuario.setApellido2(apellido2);
	    usuario.setDireccion(direccion);
	    usuario.setProvincia(provincia);
	    usuario.setLocalidad(localidad);
	    usuario.setTelefono(telefono);
	    usuario.setDni(dni);
	    usuario.setActivo(activo);
	    
	    String clave =((String) request.getParameter("clave"));
	    StrongPasswordEncryptor encriptar = new StrongPasswordEncryptor();

	    usuario.setClave(encriptar.encryptPassword(clave));
	    
	    // Llamar al servicio para agregar el usuario a la base de datos
	    boolean resultado = UsuarioService.actualizaUsuario(usuario);

	    if (resultado) {
	        // Usuario añadido correctamente
	        request.setAttribute("mensaje", "El usuario se ha modificado correctamente.");
	    } else {
	        // Error al añadir el usuario
	        request.setAttribute("mensaje", "Hubo un error al modificar el usuario.");
	    }
	    
	    response.sendRedirect(request.getContextPath() + "/ModificarUsuario");
	}



}
