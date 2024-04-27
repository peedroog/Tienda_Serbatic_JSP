package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.jasypt.util.password.StrongPasswordEncryptor;

import conexion.Conexion;
import model.DAO.UsuarioDAO;
import model.VO.UsuarioVO;

public class UsuarioService {
	
	public static UsuarioVO iniciarSesion(String email, String clave) {
	    // Obtener el usuario por su correo electrónico
	    UsuarioVO usuario = UsuarioDAO.obtenerUsuario(email);
	    
	    // Verificar si se encontró un usuario con el correo electrónico proporcionado
	    if(usuario != null) {
	        // Crear un StrongPasswordEncryptor
	        StrongPasswordEncryptor passwordEncryptor = new StrongPasswordEncryptor();
	        
	        // Verificar si la contraseña ingresada coincide con la contraseña encriptada almacenada en la base de datos
	        if(passwordEncryptor.checkPassword(clave, usuario.getClave())) {
	            // Si las contraseñas coinciden, devolver el usuario
	            return usuario;
	        } else {
	            // Si las contraseñas no coinciden, devolver null
	            return null;
	        }
	    } else {
	        // Si no se encuentra ningún usuario con el correo electrónico proporcionado, devolver null
	        return null;
	    }
	}

	
	public static boolean comprobarDatosUsuario(UsuarioVO usuario) {
		
		if(UsuarioDAO.comprobarDatosUsuario(usuario)) {
			return true;
		}else {
			return false;
		}		
		
	}
	
	public static boolean rellenarDatosUsuario(UsuarioVO usuario) {
		if(UsuarioDAO.rellenarDatosUsuario(usuario)) {
			return true;
		}else {
			return false;
		}	
	}
	
	public static UsuarioVO devuelveUsuario(String email) {
		
		UsuarioVO usuario = new UsuarioVO();
		usuario = UsuarioDAO.obtenerUsuario(email);
		return usuario;
	}
	
	public static boolean cambiarContraseña(UsuarioVO usuario) {
		
		if(UsuarioDAO.cambiarContraseña(usuario)) {
			return true;
		}else {
			return false;
		}
		
	}
	
	public static boolean bajaUsuario(UsuarioVO usuario) {
		return UsuarioDAO.bajaUsuario(usuario);
	}
}
