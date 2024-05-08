package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conexion.Conexion;
import model.VO.CategoriaVO;
import model.VO.ProveedorVO;

public class ProveedorDAO {
	
	public static ProveedorVO findById(int idProveedor) {

		ProveedorVO proveedor = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = Conexion.getConexion();
			String sql = "SELECT * FROM proveedores WHERE id = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, idProveedor);
			rs = stmt.executeQuery();

			if (rs.next()) {

				proveedor = new ProveedorVO();
				proveedor.setId(rs.getInt("id"));
				proveedor.setNombre(rs.getString("nombre"));
				proveedor.setDireccion(rs.getString("direccion"));
				proveedor.setLocalidad(rs.getString("localidad"));
				proveedor.setProvincia(rs.getString("provincia"));
				proveedor.setTelefono(rs.getString("telefono"));
				proveedor.setCif(rs.getString("cif"));
				proveedor.setEmail(rs.getString("email"));
				proveedor.setActivo(rs.getBoolean("activo"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
			// Manejar la excepción según tus necesidades
		}

		return proveedor;

	}
	
	public static List<ProveedorVO> findAll() {
	    List<ProveedorVO> listaProveedor = new ArrayList<>();
	    Connection conn = null;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;

	    try {
	        conn = Conexion.getConexion();
	        String sql = "SELECT * FROM proveedores";
	        stmt = conn.prepareStatement(sql);
	        rs = stmt.executeQuery();

	        while (rs.next()) {
	        	
				ProveedorVO proveedor = new ProveedorVO();
				proveedor.setId(rs.getInt("id"));
				proveedor.setNombre(rs.getString("nombre"));
				proveedor.setDireccion(rs.getString("direccion"));
				proveedor.setLocalidad(rs.getString("localidad"));
				proveedor.setProvincia(rs.getString("provincia"));
				proveedor.setTelefono(rs.getString("telefono"));
				proveedor.setCif(rs.getString("cif"));
				proveedor.setEmail(rs.getString("email"));
				proveedor.setActivo(rs.getBoolean("activo"));
	            listaProveedor.add(proveedor);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return listaProveedor;
	}
	

	public static boolean altaProveedor(ProveedorVO proveedor) {
	    Connection conn = null;
	    PreparedStatement stmt = null;
	    boolean exito = false;

	    try {
	        conn = Conexion.getConexion();
	        String sql = "INSERT INTO proveedores (nombre, direccion, localidad, provincia, telefono, cif, email) VALUES (?, ?, ?, ?, ?, ?, ?)";
	        stmt = conn.prepareStatement(sql);
	        stmt.setString(1, proveedor.getNombre());
	        stmt.setString(2, proveedor.getDireccion());
	        stmt.setString(3, proveedor.getLocalidad());
	        stmt.setString(4, proveedor.getProvincia());
	        stmt.setString(5, proveedor.getTelefono());
	        stmt.setString(6, proveedor.getCif());
	        stmt.setString(7, proveedor.getEmail());
	        
	        int filasAfectadas = stmt.executeUpdate();

	        if (filasAfectadas > 0) {
	            exito = true;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return exito;
	}
	
	public static boolean actualizaProveedor(ProveedorVO proveedor) {
	    Connection con = null;
	    PreparedStatement ps = null;
	    boolean exito = false;

	    try {
	        con = Conexion.getConexion();
	        ps = con.prepareStatement("UPDATE proveedores SET nombre = ?, direccion = ?, localidad = ?, provincia = ?, telefono = ?, cif = ?, email = ?, activo = ? WHERE id = ?");
	        ps.setString(1, proveedor.getNombre());
	        ps.setString(2, proveedor.getDireccion());
	        ps.setString(3, proveedor.getLocalidad());
	        ps.setString(4, proveedor.getProvincia());
	        ps.setString(5, proveedor.getTelefono());
	        ps.setString(6, proveedor.getCif());
	        ps.setString(7, proveedor.getEmail());
	        ps.setBoolean(8, proveedor.isActivo());
	        ps.setInt(9, proveedor.getId());
	        int filas = ps.executeUpdate();

	        if (filas > 0) {
	            exito = true;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        // Manejar la excepción según tus necesidades
	    }

	    return exito;
	}



	
	public static boolean bajaProveedor(int id) {
		Connection con = null;
		PreparedStatement ps = null;

		boolean exito = false;

		try {
			con = Conexion.getConexion();
			ps = con.prepareStatement("UPDATE proveedores SET activo = 0 WHERE id = ?");

			ps.setInt(1, id);

			int filas = ps.executeUpdate();

			if (filas > 0) {
				exito = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return exito;
	}
}
