package service;

import model.DAO.CategoriaDAO;
import model.VO.CategoriaVO;

public class CategoriaService {

	public static CategoriaVO findById(int id) {
		return CategoriaDAO.findById(id);
	}
	
	public static boolean bajaCategoria(int id) {
		return CategoriaDAO.bajaCategoria(id);
	}
}
