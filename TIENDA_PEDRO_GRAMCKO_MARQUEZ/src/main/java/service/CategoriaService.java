package service;

import java.util.List;

import model.DAO.CategoriaDAO;
import model.VO.CategoriaVO;

public class CategoriaService {

	public static CategoriaVO findById(int id) {
		return CategoriaDAO.findById(id);
	}

	public static List<CategoriaVO> findAll() {
		return CategoriaDAO.findAll();
	}

	public static boolean altaCategoria(CategoriaVO categoria) {
		return CategoriaDAO.altaCategoria(categoria);
	}
	
	public static boolean actualizaCategoria(CategoriaVO categoria) {
		return CategoriaDAO.actualizaCategoria(categoria);
	}

	public static boolean bajaCategoria(int id) {
		return CategoriaDAO.bajaCategoria(id);
	}
}
