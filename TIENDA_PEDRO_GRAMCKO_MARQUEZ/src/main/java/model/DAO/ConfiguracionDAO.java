package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import conexion.Conexion;
import model.VO.ProductoVO;

public class ConfiguracionDAO {

	public static String nombreEmpresa() {

		String resultado="";

		try {
			Connection con = Conexion.getConexion();
			PreparedStatement st = con.prepareStatement("SELECT valor FROM configuracion WHERE clave = 'nombre_empresa'");

			ResultSet rs = st.executeQuery();

			while (rs.next()) {
				resultado = rs.getString("valor");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultado;
	}
	
	public static String cif() {

		String resultado="";

		try {
			Connection con = Conexion.getConexion();
			PreparedStatement st = con.prepareStatement("SELECT valor FROM configuracion WHERE clave = 'cif'");

			ResultSet rs = st.executeQuery();

			while (rs.next()) {
				resultado = rs.getString("valor");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultado;
	}
	
	public static String direccion() {

		String resultado="";

		try {
			Connection con = Conexion.getConexion();
			PreparedStatement st = con.prepareStatement("SELECT valor FROM configuracion WHERE clave = 'direccion'");

			ResultSet rs = st.executeQuery();

			while (rs.next()) {
				resultado = rs.getString("valor");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultado;
	}
	
	public static String correoEmpresa() {

		String resultado="";

		try {
			Connection con = Conexion.getConexion();
			PreparedStatement st = con.prepareStatement("SELECT valor FROM configuracion WHERE clave = 'correo'");

			ResultSet rs = st.executeQuery();

			while (rs.next()) {
				resultado = rs.getString("valor");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultado;
	}
	
	public static String telefono() {

		String resultado="";

		try {
			Connection con = Conexion.getConexion();
			PreparedStatement st = con.prepareStatement("SELECT valor FROM configuracion WHERE clave = 'telefono'");

			ResultSet rs = st.executeQuery();

			while (rs.next()) {
				resultado = rs.getString("valor");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultado;
	}
	
	public static String web() {

		String resultado="";

		try {
			Connection con = Conexion.getConexion();
			PreparedStatement st = con.prepareStatement("SELECT valor FROM configuracion WHERE clave = 'web'");

			ResultSet rs = st.executeQuery();

			while (rs.next()) {
				resultado = rs.getString("valor");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultado;
	}
	
}
