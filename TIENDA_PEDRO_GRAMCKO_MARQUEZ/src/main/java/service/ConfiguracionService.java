package service;

import model.DAO.ConfiguracionDAO;

public class ConfiguracionService {

	public String nombreEmpresa() {
		return ConfiguracionDAO.nombreEmpresa();
	}
	
	public String cif() {
		return ConfiguracionDAO.cif();
	}
	
	public String direccion() {
		return ConfiguracionDAO.direccion();
	}
	
	public String correoEmpresa() {
		return ConfiguracionDAO.correoEmpresa();
	}
	
	public String telefono() {
		return ConfiguracionDAO.telefono();
	}
	
	public String web() {
		return ConfiguracionDAO.web();
	}
	
}
