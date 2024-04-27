package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

			}
		} catch (SQLException e) {
			e.printStackTrace();
			// Manejar la excepción según tus necesidades
		}

		return categoria;

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
