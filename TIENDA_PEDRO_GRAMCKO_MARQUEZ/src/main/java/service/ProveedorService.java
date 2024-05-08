package service;

import java.util.List;

import model.DAO.ProveedorDAO;
import model.VO.ProveedorVO;



public class ProveedorService {

	public static ProveedorVO findById(int id) {
		return ProveedorDAO.findById(id);
	}

	public static List<ProveedorVO> findAll() {
		return ProveedorDAO.findAll();
	}

	public static boolean altaProveedor(ProveedorVO categoria) {
		return ProveedorDAO.altaProveedor(categoria);
	}
	
	public static boolean actualizaProveedor(ProveedorVO categoria) {
		return ProveedorDAO.actualizaProveedor(categoria);
	}

	public static boolean bajaProveedor(int id) {
		return ProveedorDAO.bajaProveedor(id);
	}
}
