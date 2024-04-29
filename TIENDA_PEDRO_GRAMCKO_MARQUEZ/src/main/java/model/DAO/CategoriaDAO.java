package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conexion.Conexion;
import model.VO.CategoriaVO;
import model.VO.ProductoVO;
import model.VO.UsuarioVO;

public class CategoriaDAO {

	public static CategoriaVO findById(int idCategoria) {

		CategoriaVO categoria = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = Conexion.getConexion();
			String sql = "SELECT * FROM categorias WHERE id = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, idCategoria);
			rs = stmt.executeQuery();

			if (rs.next()) {

				categoria = new CategoriaVO();
				categoria.setId(rs.getInt("id"));
				categoria.setNombre(rs.getString("nombre"));
				categoria.setDescripcion(rs.getString("descripcion"));
				categoria.setActivo(rs.getBoolean("activo"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
			// Manejar la excepción según tus necesidades
		}

		return categoria;

	}
	
	public static List<CategoriaVO> findAll() {
	    List<CategoriaVO> listaCategorias = new ArrayList<>();
	    Connection conn = null;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;

	    try {
	        conn = Conexion.getConexion();
	        String sql = "SELECT * FROM categorias";
	        stmt = conn.prepareStatement(sql);
	        rs = stmt.executeQuery();

	        while (rs.next()) {
	            CategoriaVO categoria = new CategoriaVO();
	            categoria.setId(rs.getInt("id"));
	            categoria.setNombre(rs.getString("nombre"));
	            categoria.setDescripcion(rs.getString("descripcion"));
	            categoria.setActivo(rs.getBoolean("activo"));
	            listaCategorias.add(categoria);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return listaCategorias;
	}
	
	public static boolean altaCategoria(CategoriaVO categoria) {
	    Connection conn = null;
	    PreparedStatement stmt = null;
	    boolean exito = false;

	    try {
	        conn = Conexion.getConexion();
	        String sql = "INSERT INTO categorias (nombre, descripcion) VALUES (?, ?)";
	        stmt = conn.prepareStatement(sql);
	        stmt.setString(1, categoria.getNombre());
	        stmt.setString(2, categoria.getDescripcion());
	        
	        int filasAfectadas = stmt.executeUpdate();

	        if (filasAfectadas > 0) {
	            exito = true;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return exito;
	}
	
	public static boolean actualizaCategoria(CategoriaVO categoria) {
	    Connection con = null;
	    PreparedStatement ps = null;
	    boolean exito = false;

	    try {
	        con = Conexion.getConexion();
	        ps = con.prepareStatement("UPDATE categorias SET nombre = ?, descripcion = ?, activo = ? WHERE id = ?");
	        ps.setString(1, categoria.getNombre()); // nombre
	        ps.setString(2, categoria.getDescripcion()); // descripcion
	        ps.setBoolean(3, categoria.isActivo());
	        ps.setInt(4, categoria.getId()); // id
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



	
	public static boolean bajaCategoria(int id) {
		Connection con = null;
		PreparedStatement ps = null;

		boolean exito = false;

		try {
			con = Conexion.getConexion();
			ps = con.prepareStatement("UPDATE categorias SET activo = 0 WHERE id = ?");

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
