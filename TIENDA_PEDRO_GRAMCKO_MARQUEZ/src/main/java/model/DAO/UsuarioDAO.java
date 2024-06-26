package model.DAO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import conexion.Conexion;
import model.VO.ProductoVO;
import model.VO.UsuarioVO;

public class UsuarioDAO {

	public static boolean registrarUsuario(UsuarioVO usuario) {
		Connection connection = null;
		PreparedStatement statement = null;

		try {
			connection = Conexion.getConexion();

			// Verificar si el correo electrónico ya está en uso
			if (emailExistente(usuario.getEmail())) {
				return false; // El correo electrónico ya está registrado
			}

			String sql = "INSERT INTO usuarios (id_rol, email, clave, nombre, apellido1, apellido2,"
					+ "direccion, provincia, localidad, telefono, dni) VALUES (?,?,?,?,?,?,?,?,?,?,?)";

			statement = connection.prepareStatement(sql);

			statement.setInt(1, usuario.getId_rol());
			statement.setString(2, usuario.getEmail());
			statement.setString(3, usuario.getClave());
			statement.setString(4, usuario.getNombre());
			statement.setString(5, usuario.getApellido1());
			statement.setString(6, usuario.getApellido2());
			statement.setString(7, usuario.getDireccion());
			statement.setString(8, usuario.getProvincia());
			statement.setString(9, usuario.getLocalidad());
			statement.setString(10, usuario.getTelefono());
			statement.setString(11, usuario.getDni());

			int filas = statement.executeUpdate();

			return filas == 1; // Devolver true si se registró correctamente, false en caso contrario
		} catch (SQLException e) {
			e.printStackTrace(); // Manejar la excepción según sea necesario
			return false; // El registro falló debido a una excepción
		}
	}

	public static List<UsuarioVO> findAll() {

		List<UsuarioVO> lista = new ArrayList<UsuarioVO>();

		try {
				Connection con = Conexion.getConexion();
				PreparedStatement st = con.prepareStatement("SELECT * FROM usuarios");
				ResultSet rs = st.executeQuery(); 

			while (rs.next()) {
				UsuarioVO usuario = new UsuarioVO();

				usuario.setId(rs.getInt("id"));
				usuario.setId_rol(rs.getInt("id_rol"));
				usuario.setEmail(rs.getString("email"));
				usuario.setNombre(rs.getString("nombre"));
				usuario.setApellido1(rs.getString("apellido1"));
				usuario.setApellido2(rs.getString("apellido2"));
				usuario.setDireccion(rs.getString("direccion"));
				usuario.setProvincia(rs.getString("provincia"));
				usuario.setLocalidad(rs.getString("localidad"));
				usuario.setTelefono(rs.getString("telefono"));
				usuario.setDni(rs.getString("dni"));
				usuario.setActivo(rs.getBoolean("activo"));
				lista.add(usuario);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lista;

	}
	
	public static List<UsuarioVO> findEmpleados() {

		List<UsuarioVO> lista = new ArrayList<UsuarioVO>();

		try {
				Connection con = Conexion.getConexion();
				PreparedStatement st = con.prepareStatement("SELECT * FROM usuarios WHERE id_rol = 2 OR id_rol = 3");
				ResultSet rs = st.executeQuery(); 

			while (rs.next()) {
				UsuarioVO usuario = new UsuarioVO();

				usuario.setId(rs.getInt("id"));
				usuario.setId_rol(rs.getInt("id_rol"));
				usuario.setEmail(rs.getString("email"));
				usuario.setNombre(rs.getString("nombre"));
				usuario.setApellido1(rs.getString("apellido1"));
				usuario.setApellido2(rs.getString("apellido2"));
				usuario.setDireccion(rs.getString("direccion"));
				usuario.setProvincia(rs.getString("provincia"));
				usuario.setLocalidad(rs.getString("localidad"));
				usuario.setTelefono(rs.getString("telefono"));
				usuario.setDni(rs.getString("dni"));
				usuario.setActivo(rs.getBoolean("activo"));
				lista.add(usuario);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lista;

	}
	
	public static List<UsuarioVO> findClientes() {

		List<UsuarioVO> lista = new ArrayList<UsuarioVO>();

		try {
				Connection con = Conexion.getConexion();
				PreparedStatement st = con.prepareStatement("SELECT * FROM usuarios WHERE id_rol = 1");
				ResultSet rs = st.executeQuery(); 

			while (rs.next()) {
				UsuarioVO usuario = new UsuarioVO();

				usuario.setId(rs.getInt("id"));
				usuario.setId_rol(rs.getInt("id_rol"));
				usuario.setEmail(rs.getString("email"));
				usuario.setNombre(rs.getString("nombre"));
				usuario.setApellido1(rs.getString("apellido1"));
				usuario.setApellido2(rs.getString("apellido2"));
				usuario.setDireccion(rs.getString("direccion"));
				usuario.setProvincia(rs.getString("provincia"));
				usuario.setLocalidad(rs.getString("localidad"));
				usuario.setTelefono(rs.getString("telefono"));
				usuario.setDni(rs.getString("dni"));
				usuario.setActivo(rs.getBoolean("activo"));
				lista.add(usuario);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lista;

	}

	private static boolean emailExistente(String email) throws SQLException {
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;

		try {
			connection = Conexion.getConexion();
			String sql = "SELECT COUNT(*) FROM usuarios WHERE email = ?";
			statement = connection.prepareStatement(sql);
			statement.setString(1, email);
			resultSet = statement.executeQuery();

			if (resultSet.next()) {
				int count = resultSet.getInt(1);
				return count > 0;
			}
			

		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public static boolean rellenarDatosUsuario(UsuarioVO usuario) {
		try {
			Connection connection = Conexion.getConexion();
			String sql = "UPDATE usuarios SET nombre = ?, apellido1 = ?, apellido2 = ?, direccion = ?, provincia = ?, localidad = ?, telefono = ?, dni = ? WHERE email = ?";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, usuario.getNombre());
			statement.setString(2, usuario.getApellido1());
			statement.setString(3, usuario.getApellido2());
			statement.setString(4, usuario.getDireccion());
			statement.setString(5, usuario.getProvincia());
			statement.setString(6, usuario.getLocalidad());
			statement.setString(7, usuario.getTelefono());
			statement.setString(8, usuario.getDni());
			statement.setString(9, usuario.getEmail());

			int rowsUpdated = statement.executeUpdate();

			if (rowsUpdated < 0) {
				return false;
			}

		} catch (SQLException e) {
			// Manejar cualquier error de base de datos
			e.printStackTrace();
		}

		return true;
	}

	public static UsuarioVO devolverUsuario(String email) {
		UsuarioVO usuario = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = Conexion.getConexion();
			String sql = "SELECT * FROM usuarios WHERE email = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, email);
			rs = stmt.executeQuery();

			if (rs.next()) {

				usuario = new UsuarioVO();
				usuario.setId(rs.getInt("id"));
				usuario.setId_rol(rs.getInt("id_rol"));
				usuario.setEmail(rs.getString("email"));
				usuario.setClave(rs.getString("clave"));
				usuario.setNombre(rs.getString("nombre"));
				usuario.setApellido1(rs.getString("apellido1"));
				usuario.setApellido2(rs.getString("apellido2"));
				usuario.setDireccion(rs.getString("direccion"));
				usuario.setProvincia(rs.getString("provincia"));
				usuario.setLocalidad(rs.getString("localidad"));
				usuario.setTelefono(rs.getString("telefono"));
				usuario.setDni(rs.getString("dni"));
				usuario.setActivo(rs.getBoolean("activo"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
			// Manejar la excepción según tus necesidades
		}

		return usuario;
	}
	
	public static UsuarioVO findById(int id) {
		UsuarioVO usuario = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = Conexion.getConexion();
			String sql = "SELECT * FROM usuarios WHERE id = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();

			if (rs.next()) {

				usuario = new UsuarioVO();
				usuario.setId(rs.getInt("id"));
				usuario.setId_rol(rs.getInt("id_rol"));
				usuario.setEmail(rs.getString("email"));
				usuario.setClave(rs.getString("clave"));
				usuario.setNombre(rs.getString("nombre"));
				usuario.setApellido1(rs.getString("apellido1"));
				usuario.setApellido2(rs.getString("apellido2"));
				usuario.setDireccion(rs.getString("direccion"));
				usuario.setProvincia(rs.getString("provincia"));
				usuario.setLocalidad(rs.getString("localidad"));
				usuario.setTelefono(rs.getString("telefono"));
				usuario.setDni(rs.getString("dni"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
			// Manejar la excepción según tus necesidades
		}

		return usuario;
	}

	public static boolean comprobarDatosUsuario(UsuarioVO usuario) {

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = Conexion.getConexion();
			String sql = "SELECT * FROM usuarios WHERE email = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, usuario.getEmail());
			rs = stmt.executeQuery();

			if (rs.next()) {

				if (rs.getString("nombre") == null || rs.getString("apellido1") == null
						|| rs.getString("apellido2") == null || rs.getString("direccion") == null
						|| rs.getString("provincia") == null || rs.getString("localidad") == null
						|| rs.getString("telefono") == null || rs.getString("dni") == null) {
					return false;
				}

			}
		} catch (SQLException e) {
			e.printStackTrace();
			// Manejar la excepción según tus necesidades
		}

		return true;

	}

	public static boolean cambiarContraseña(UsuarioVO usuario) {
		try {
			Connection connection = Conexion.getConexion();
			String sql = "UPDATE usuarios SET clave = ? WHERE email = ?";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, usuario.getClave());
			statement.setString(2, usuario.getEmail());

			int rowsUpdated = statement.executeUpdate();

			if (rowsUpdated < 0) {
				return false;
			}

		} catch (SQLException e) {
			// Manejar cualquier error de base de datos
			e.printStackTrace();
		}

		return true;
	}

	public static boolean actualizaUsuario(UsuarioVO usuario) {
	    boolean exito = false;

	    try {
	    Connection con = Conexion.getConexion();
	    PreparedStatement ps = con.prepareStatement("UPDATE usuarios SET id_rol = ?, email = ?, clave = ?, nombre = ?, apellido1 = ?, apellido2 = ?, direccion = ?, provincia = ?, localidad = ?, telefono = ?, dni = ?, activo = ? WHERE id = ?"); 

	        ps.setInt(1, usuario.getId_rol());
	        ps.setString(2, usuario.getEmail());
	        ps.setString(3, usuario.getClave());
	        ps.setString(4, usuario.getNombre());
	        ps.setString(5, usuario.getApellido1());
	        ps.setString(6, usuario.getApellido2());
	        ps.setString(7, usuario.getDireccion());
	        ps.setString(8, usuario.getProvincia());
	        ps.setString(9, usuario.getLocalidad());
	        ps.setString(10, usuario.getTelefono());
	        ps.setString(11, usuario.getDni());
	        ps.setBoolean(12, usuario.isActivo());
	        ps.setInt(13, usuario.getId());

	        int filas = ps.executeUpdate();

	        if (filas > 0) {
	            exito = true;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return exito;
	}


	public static boolean bajaUsuario(UsuarioVO usuario) {
		Connection con = null;
		PreparedStatement ps = null;

		boolean exito = false;

		try {
			con = Conexion.getConexion();
			ps = con.prepareStatement("UPDATE usuarios SET activo = 0 WHERE id = ?");

			ps.setInt(1, usuario.getId());

			int filas = ps.executeUpdate();

			if (filas > 0) {
				exito = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return exito;
	}
	
	   public static int obtenerCantidadUsuarios() {
	        Connection con = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
	        int cantidad = 0;
	        
	        try {
	            con = Conexion.getConexion();
	            ps = con.prepareStatement("SELECT COUNT(*) FROM usuarios WHERE id_rol = ?");
	            ps.setInt(1, 1);

	            rs = ps.executeQuery();

	            if (rs.next()) {
	            	cantidad = rs.getInt(1);
	            }
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }        

	        return cantidad;
	   }
	   
}
