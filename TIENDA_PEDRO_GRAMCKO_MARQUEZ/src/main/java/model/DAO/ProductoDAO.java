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

public class ProductoDAO {

	public static List<ProductoVO> findAll() {

		List<ProductoVO> lista = new ArrayList<ProductoVO>();
		ProductoVO producto = null;

		try {
			Connection con = Conexion.getConexion();
			PreparedStatement st = con.prepareStatement("Select * from productos");

			ResultSet rs = st.executeQuery();

			while (rs.next()) {
				producto = new ProductoVO();

				producto.setId(rs.getInt("id"));
				producto.setId_categoria(rs.getInt("id_categoria"));
				producto.setNombre(rs.getString("nombre"));
				producto.setDescripcion(rs.getString("descripcion"));
				producto.setPrecio(rs.getDouble("precio"));
				producto.setStock(rs.getInt("stock"));
				producto.setImpuesto(rs.getFloat("impuesto"));
				producto.setImagen(rs.getString("imagen"));

				lista.add(producto);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return lista;
	}

	public static ProductoVO findById(int productId) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ProductoVO producto = null;

		try {
			con = Conexion.getConexion();
			ps = con.prepareStatement("SELECT * FROM productos WHERE id = ?");
			ps.setInt(1, productId);
			rs = ps.executeQuery();

			if (rs.next()) {
				producto = new ProductoVO();
				producto.setId(rs.getInt("id"));
				producto.setId_categoria(rs.getInt("id_categoria"));
				producto.setNombre(rs.getString("nombre"));
				producto.setDescripcion(rs.getString("descripcion"));
				producto.setPrecio(rs.getDouble("precio"));
				producto.setStock(rs.getInt("stock"));
				producto.setFecha_alta(rs.getDate("fecha_alta"));
				producto.setFecha_baja(rs.getDate("fecha_baja"));
				producto.setImpuesto(rs.getFloat("impuesto"));
				producto.setImagen(rs.getString("imagen"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return producto;
	}

	public static CategoriaVO devuelveCategoriaDeProducto(int id) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		CategoriaVO categoria = null;

		try {
			con = Conexion.getConexion();
			ps = con.prepareStatement("SELECT c.id, c.nombre, c.descripcion FROM productos p "
					+ "INNER JOIN categorias c ON p.id_categoria = c.id " + "WHERE p.id = ?");
			ps.setInt(1, id);
			rs = ps.executeQuery();

			if (rs.next()) {
				categoria = new CategoriaVO();
				categoria.setId(rs.getInt("id"));
				categoria.setNombre(rs.getString("nombre"));
				categoria.setDescripcion(rs.getString("descripcion"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return categoria;
	}

	public static int devuelveStockDeProducto(int id) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int stock = 0;

		try {
			con = Conexion.getConexion();
			ps = con.prepareStatement("SELECT stock FROM productos WHERE id = ?");
			ps.setInt(1, id);
			rs = ps.executeQuery();

			if (rs.next()) {
				stock = rs.getInt("stock");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return stock;
	}

	public static boolean actualizaStock(ProductoVO producto) {
		Connection con = null;
		PreparedStatement ps = null;

		boolean exito = false;

		try {
			con = Conexion.getConexion();
			ps = con.prepareStatement("UPDATE productos SET stock = ? WHERE id = ?");
			ps.setInt(1, producto.getStock());
			ps.setInt(2, producto.getId());
			int filas = ps.executeUpdate();

			if (filas > 0) {
				exito = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return exito;
	}

	public static List<ProductoVO> buscarPorNombre(String nombre) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ProductoVO> productos = new ArrayList<>();

		try {
			con = Conexion.getConexion();
			ps = con.prepareStatement("SELECT * FROM productos WHERE nombre LIKE ?");
			ps.setString(1, "%" + nombre + "%");

			rs = ps.executeQuery();
			while (rs.next()) {
				ProductoVO producto = new ProductoVO();
				producto.setId(rs.getInt("id"));
				producto.setId_categoria(rs.getInt("id_categoria"));
				producto.setNombre(rs.getString("nombre"));
				producto.setDescripcion(rs.getString("descripcion"));
				producto.setPrecio(rs.getDouble("precio"));
				producto.setStock(rs.getInt("stock"));
				producto.setImpuesto(rs.getFloat("impuesto"));
				producto.setImagen(rs.getString("imagen"));
				productos.add(producto);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return productos;
	}

	public static List<ProductoVO> filtrarPrecioAsc() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ProductoVO> productos = new ArrayList<>();

		try {
			con = Conexion.getConexion();
			ps = con.prepareStatement("SELECT * FROM productos ORDER BY precio ASC");

			rs = ps.executeQuery();
			while (rs.next()) {
				ProductoVO producto = new ProductoVO();
				producto.setId(rs.getInt("id"));
				producto.setId_categoria(rs.getInt("id_categoria"));
				producto.setNombre(rs.getString("nombre"));
				producto.setDescripcion(rs.getString("descripcion"));
				producto.setPrecio(rs.getDouble("precio"));
				producto.setStock(rs.getInt("stock"));
				producto.setImpuesto(rs.getFloat("impuesto"));
				producto.setImagen(rs.getString("imagen"));
				productos.add(producto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return productos;
	}

	public static List<ProductoVO> filtrarPrecioDesc() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ProductoVO> productos = new ArrayList<>();

		try {
			con = Conexion.getConexion();
			ps = con.prepareStatement("SELECT * FROM productos ORDER BY precio DESC");

			rs = ps.executeQuery();
			while (rs.next()) {
				ProductoVO producto = new ProductoVO();
				producto.setId(rs.getInt("id"));
				producto.setId_categoria(rs.getInt("id_categoria"));
				producto.setNombre(rs.getString("nombre"));
				producto.setDescripcion(rs.getString("descripcion"));
				producto.setPrecio(rs.getDouble("precio"));
				producto.setStock(rs.getInt("stock"));
				producto.setImpuesto(rs.getFloat("impuesto"));
				producto.setImagen(rs.getString("imagen"));
				productos.add(producto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return productos;
	}

	public static List<ProductoVO> productosPorCategoria(int id) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ProductoVO> productos = new ArrayList<>();

		try {
			con = Conexion.getConexion();
			ps = con.prepareStatement("SELECT * FROM productos WHERE id_categoria = ?");
			ps.setInt(1, id);

			rs = ps.executeQuery();
			while (rs.next()) {
				ProductoVO producto = new ProductoVO();
				producto.setId(rs.getInt("id"));
				producto.setId_categoria(rs.getInt("id_categoria"));
				producto.setNombre(rs.getString("nombre"));
				producto.setDescripcion(rs.getString("descripcion"));
				producto.setPrecio(rs.getDouble("precio"));
				producto.setStock(rs.getInt("stock"));
				producto.setImpuesto(rs.getFloat("impuesto"));
				producto.setImagen(rs.getString("imagen"));
				productos.add(producto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return productos;
	}

	public static void altaProducto(ProductoVO producto) {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = Conexion.getConexion();
			ps = con.prepareStatement("INSERT INTO productos ( id_categoria, nombre, descripcion, precio, stock,"
					+ "fecha_alta, fecha_baja, impuesto, imagen) VALUES (?,?,?,?,?,?,?,?,?)");


			ps.setInt(1, producto.getId_categoria());
			ps.setString(2, producto.getNombre());
			ps.setString(3, producto.getDescripcion());
			ps.setDouble(4, producto.getPrecio());
			ps.setInt(5, producto.getStock());
			ps.setDate(6, null);
			ps.setDate(7, null);
			ps.setFloat(8, producto.getImpuesto());
			ps.setString(9, producto.getImagen());

			ps.executeUpdate();
			System.out.println("Producto agregado correctamente");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static boolean actualizaProducto(ProductoVO producto) {
		Connection con = null;
		PreparedStatement ps = null;

		boolean exito = false;

		try {
			con = Conexion.getConexion();
			ps = con.prepareStatement("UPDATE productos \r\n"
			        + "SET id_categoria = ?, \r\n"
			        + "    nombre = ?, \r\n"
			        + "    descripcion = ?, \r\n"
			        + "    precio = ?, \r\n"
			        + "    stock = ?, \r\n"
			        + "    impuesto = ?, \r\n"
			        + "    imagen = ?, \r\n"
			        + "    activo = ? \r\n"
			        + "WHERE id = ?");
			ps.setInt(1, producto.getId_categoria()); // id_categoria
			ps.setString(2, producto.getNombre()); // nombre
			ps.setString(3, producto.getDescripcion()); // descripcion
			ps.setDouble(4, producto.getPrecio()); // precio
			ps.setInt(5, producto.getStock()); // stock
			ps.setFloat(6, producto.getImpuesto()); // impuesto
			ps.setString(7, producto.getImagen()); // imagen
			ps.setBoolean(8, producto.isActivo()); // activo
			ps.setInt(9, producto.getId()); // id
			int filas = ps.executeUpdate();

			if (filas > 0) {
				exito = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return exito;
	}
	
	public static boolean bajaProducto(ProductoVO producto) {
		Connection con = null;
		PreparedStatement ps = null;

		boolean exito = false;

		try {
			con = Conexion.getConexion();
			ps = con.prepareStatement("UPDATE productos SET activo = 0 WHERE id = ?");

			ps.setInt(1, producto.getId());

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
