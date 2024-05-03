package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import conexion.Conexion;
import model.VO.ProductoVO;
import model.VO.UsuarioVO;

public class CarritoDAO {

	public static double devuelvePrecioCarrito(Map<ProductoVO, Integer> carrito) {

		double precioTotal = 0;

		for (Map.Entry<ProductoVO, Integer> entry : carrito.entrySet()) {
			ProductoVO producto = entry.getKey();
			Integer cantidad = entry.getValue();

			try {
				Connection con = Conexion.getConexion();
				PreparedStatement st = con.prepareStatement("SELECT precio FROM productos WHERE id = ?");
				st.setInt(1, producto.getId());
				ResultSet rs = st.executeQuery();

				if (rs.next()) {
	                double precio = rs.getDouble("precio");
	                precioTotal += precio*cantidad;
				} else {
					System.out.println("No se encontró el precio para el artículo con ID: " + producto.getId());
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}


		return precioTotal;
	}

}
