package service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import model.DAO.ProductoDAO;
import model.VO.CategoriaVO;
import model.VO.ProductoMasVendidoDTO;
import model.VO.ProductoVO;

public class ProductoService {
	private static final Logger logger = LogManager.getLogger(ProductoService.class);

	public static CategoriaVO devuelveCategoriaProducto(int id) {
		
		return ProductoDAO.devuelveCategoriaDeProducto(id);
	}
	
	public static int devuelveStockDeProducto(int id) {
		
		return ProductoDAO.devuelveStockDeProducto(id);
	}
	
	public static boolean actualizaStock(ProductoVO producto) {
		
		if(ProductoDAO.actualizaStock(producto)) {
			return true;
		}
		logger.error("");
		return false;
		
	}
	
	public static ProductoVO findById(int id) {
		
		return ProductoDAO.findById(id);
	}
	
	public static List<ProductoVO> buscarProductosPorNombre(String nombre){
		
		return ProductoDAO.buscarPorNombre(nombre);
	}
	
	public static List<ProductoVO> findAll(){
		
		return ProductoDAO.findAll();
		
	}
	
	public static List<ProductoVO> filtrarPrecioAsc(){
		return ProductoDAO.filtrarPrecioAsc();
	}
	
	public static List<ProductoVO> filtrarPrecioDesc(){
		return ProductoDAO.filtrarPrecioDesc();
	}
	
	public static List<ProductoVO> filtrarPorMasComprados(){
		return ProductoDAO.filtrarPorMasComprados();
	}
	
	public static List<ProductoVO> productosPorCategoria(int id){
		return ProductoDAO.productosPorCategoria(id);
	}
	
	public static boolean altaProducto(ProductoVO producto) {
		return ProductoDAO.altaProducto(producto);
	}
	
	public static boolean modificarProducto(ProductoVO producto) {
		return ProductoDAO.actualizaProducto(producto);
	}
	
	public static boolean bajaProducto(ProductoVO producto) {
		return ProductoDAO.bajaProducto(producto);
	}
	
	public static Map<Integer, Integer> obtenerProductosVendidos(){
		return ProductoDAO.obtenerProductosVendidos();
	}
	
	public static List<ProductoMasVendidoDTO> obtener6ProductosMasVendidos(){
		return ProductoDAO.obtener6ProductosMasVendidos();
	}
}
