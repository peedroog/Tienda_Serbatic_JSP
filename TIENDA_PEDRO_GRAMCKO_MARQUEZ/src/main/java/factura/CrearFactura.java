package factura;


import java.io.FileOutputStream;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.List;


import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;

import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import model.VO.DetallePedidoVO;
import model.VO.PedidoVO;
import model.VO.ProductoVO;
import model.VO.UsuarioVO;
import service.ConfiguracionService;
import service.DetallePedidoService;
import service.ProductoService;
import service.UsuarioService;

public class CrearFactura {

		public static void generarFactura(PedidoVO pedido, UsuarioVO usuario, String ruta) {
			System.out.println(ruta);
	        Document documento = new Document(PageSize.A4, 20, 20, 70, 50);
	        Image imagen;
	        
	        try (FileOutputStream file = new FileOutputStream(ruta + "/Facturas/factura"+pedido.getNum_factura()+".pdf")) {
	            PdfWriter writer = PdfWriter.getInstance(documento, file);
	            writer.setPageEvent(new PDFHeaderFooter());
	            
	            usuario = UsuarioService.findById(pedido.getId_usuario());
	            
	            documento.open();
	            ConfiguracionService config = new ConfiguracionService();
	           
	            String rutaImagen = ruta+"/img/svg.png"; 

	            imagen = Image.getInstance(rutaImagen);
	            imagen.scaleToFit(40, 40);
	            imagen.setAlignment(Element.ALIGN_CENTER);


	            documento.add(imagen);
	            
	            
	            // Agregar fecha de emisión
	            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	            Font fontFecha = FontFactory.getFont(FontFactory.HELVETICA, 12);
	            Paragraph fecha = new Paragraph("Fecha: "+sdf.format(pedido.getFecha()), fontFecha);
	            fecha.setAlignment(Element.ALIGN_LEFT);
	            documento.add(fecha);
	            
	            // Datos de la empresa
	            Font fontEmpresa = FontFactory.getFont(FontFactory.HELVETICA, 12);
	            Paragraph empresa = new Paragraph(config.nombreEmpresa()+"\nCIF:"+config.cif()+"\n"+config.direccion()+"\nTelefono: "+config.telefono()+"\nCorreo electrónico: "+config.correoEmpresa()+"\nWeb: "+config.web(), fontEmpresa);
	            empresa.setAlignment(Element.ALIGN_RIGHT);
	            documento.add(empresa);
	            

	            
	            // Espacio entre datos de la empresa y factura
	            documento.add(new Paragraph("\n"));
	            
	            // Factura
	            Font fontTitulo = FontFactory.getFont(FontFactory.HELVETICA, 16, Font.BOLD);
	            Font fontFactura = FontFactory.getFont(FontFactory.HELVETICA, 10, Font.NORMAL);
	            Paragraph titulo = new Paragraph("FACTURA", fontTitulo);
	            titulo.setAlignment(Element.ALIGN_CENTER);
	            Paragraph num_factura = new Paragraph("#"+pedido.getNum_factura(), fontFactura);
	            num_factura.setAlignment(Element.ALIGN_CENTER);
	            documento.add(titulo);
	            documento.add(num_factura);
	            
//	            // Fecha de emisión
//	            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
//	            Paragraph fecha = new Paragraph("Fecha de emisión: " + sdf.format(new Date(pedido.getFecha())), FontFactory.getFont(FontFactory.HELVETICA, 12));
//	            fecha.setAlignment(Element.ALIGN_RIGHT);
//	            documento.add(fecha);
	            
	            // Espacio entre título y datos de la factura
	            documento.add(new Paragraph("\n\n\n"));

                Paragraph datosCliente = new Paragraph("Datos del Cliente:\n" +
                        "Nombre: " + usuario.getNombre() + " "+ usuario.getApellido1()+"\n" +
                        "Dirección: " + usuario.getDireccion() + "\n" +
                        "Teléfono: " + usuario.getTelefono() + "\n" +
                        "Email: " + usuario.getEmail() + "\n");
                documento.add(datosCliente);
                
                 
                documento.add(new Paragraph("\n\n\n"));
                
	            // Datos de la factura (podrías adaptar esto según tus necesidades)
	            PdfPTable tabla = new PdfPTable(5);
	            tabla.setWidthPercentage(100);
	            tabla.addCell("Nº");
	            tabla.addCell("Articulo");
	            tabla.addCell("Cantidad");
	            tabla.addCell("Precio");
	            tabla.addCell("Importe");

	            
	            List<DetallePedidoVO> detalles = DetallePedidoService.obtenerLineasPorPedido(pedido);
	    		DecimalFormat decimalFormat = new DecimalFormat("#.##");
	            int contador = 1;
	            for (DetallePedidoVO detalle : detalles) {
	            		ProductoVO producto = ProductoService.findById(detalle.getId_producto());
	                    tabla.addCell(String.valueOf(contador++));
	                    tabla.addCell(producto.getNombre());
	                    tabla.addCell(String.valueOf(detalle.getUnidades()));
	                    tabla.addCell(String.valueOf(decimalFormat.format(detalle.getPrecio_unidad()))+"€");
	                    tabla.addCell(String.valueOf(decimalFormat.format(detalle.getTotal()))+"€");
	                
	            }
	            
	            documento.add(tabla);
                documento.add(new Paragraph("\n"));
                
                
	            PdfPTable tablaTotal = new PdfPTable(1);
	            tablaTotal.addCell("TOTAL GENERAL: "+decimalFormat.format(pedido.getTotal())+"€");
	            
	            documento.add(tablaTotal);
	           
	            
	            // Cierre del documento
	            documento.close(); 
	            
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        }
	    }
        
    
}
