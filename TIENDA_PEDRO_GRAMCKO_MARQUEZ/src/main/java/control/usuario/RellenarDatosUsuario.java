package control.usuario;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO.UsuarioDAO;
import model.VO.UsuarioVO;
import service.UsuarioService;

/**
 * Servlet implementation class RellenarDatosUsuario
 */
@WebServlet("/RellenarDatosUsuario")
public class RellenarDatosUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RellenarDatosUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		UsuarioVO usuario = (UsuarioVO) request.getSession().getAttribute("usuario");
		request.setAttribute("usuario", usuario);
		request.getRequestDispatcher("/vistas/completarDatos.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // Obtener el usuario de la sesión
	    UsuarioVO usuario = (UsuarioVO) request.getSession().getAttribute("usuario");

	    // Obtener los nuevos datos del formulario
	    String nombre = request.getParameter("nombre");
	    String apellido1 = request.getParameter("apellido1");
	    String apellido2 = request.getParameter("apellido2");
	    String direccion = request.getParameter("direccion");
	    String provincia = request.getParameter("provincia");
	    String localidad = request.getParameter("localidad");
	    String telefono = request.getParameter("telefono");
	    String dni = request.getParameter("dni");

	    // Actualizar los datos del usuario con los nuevos valores del formulario
	    usuario.setNombre(nombre);
	    usuario.setApellido1(apellido1);
	    usuario.setApellido2(apellido2);
	    usuario.setDireccion(direccion);
	    usuario.setProvincia(provincia);
	    usuario.setLocalidad(localidad);
	    usuario.setTelefono(telefono);
	    usuario.setDni(dni);

	    // Actualizar los datos del usuario en la base de datos
	    boolean actualizacionExitosa = UsuarioService.rellenarDatosUsuario(usuario);

	    // Verificar si la actualización fue exitosa
	    if (actualizacionExitosa) {
	        // Si la actualización fue exitosa, redirigir al usuario a la última ruta visitada
	        String ultimaRuta = (String) request.getSession().getAttribute("ultimaRuta");
	        if (ultimaRuta != null && !ultimaRuta.isEmpty()) {
	            response.sendRedirect(ultimaRuta);
	            request.getSession().removeAttribute("ultimaRuta");
	        } else {
	            // Si no hay una última ruta, puedes redirigir al usuario a la página de inicio
	            response.sendRedirect(request.getContextPath());
	        }
	    } else {
	        // Si la actualización falló, puedes manejar el error de alguna manera apropiada, como mostrar un mensaje de error al usuario
	        // Por ejemplo, podrías enviarlo a una página de error
	        response.sendRedirect(request.getContextPath() + "/error.jsp");
	    }
	}

}
