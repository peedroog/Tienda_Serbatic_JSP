package factura;

import java.awt.Desktop;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
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

		public static void generarFactura(PedidoVO pedido, UsuarioVO usuario) {
	        Document documento = new Document(PageSize.A4, 20, 20, 70, 50);
	        
	        try (FileOutputStream file = new FileOutputStream("C:/Users/pdgramcko/git/TIENDA_PEDRO_GRAMCKO_MARQUEZ/TIENDA_PEDRO_GRAMCKO_MARQUEZ/src/main/java/factura/salida.pdf")) {
	            PdfWriter writer = PdfWriter.getInstance(documento, file);
	            writer.setPageEvent(new PDFHeaderFooter());
	            
	            usuario = UsuarioService.findById(pedido.getId_usuario());
	            
	            documento.open();
	            ConfiguracionService config = new ConfiguracionService();
	            // Datos de la empresa
	            Font fontEmpresa = FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD);
	            Paragraph empresa = new Paragraph(config.nombreEmpresa()+"\nCIF:"+config.cif()+"\n"+config.direccion()+"\nTelefono: "+config.telefono()+"\nCorreo electrónico: "+config.correoEmpresa()+"\nWeb: "+config.web(), fontEmpresa);
	            empresa.setAlignment(Element.ALIGN_LEFT);
	            documento.add(empresa);
	            
	            // Espacio entre datos de la empresa y factura
	            documento.add(new Paragraph("\n"));
	            
	            // Factura
	            Font fontTitulo = FontFactory.getFont(FontFactory.HELVETICA, 16, Font.BOLD);
	            Paragraph titulo = new Paragraph("FACTURA", fontTitulo);
	            titulo.setAlignment(Element.ALIGN_CENTER);
	            documento.add(titulo);
	            
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
	            PdfPTable tabla = new PdfPTable(6);
	            tabla.setWidthPercentage(100);
	            tabla.addCell("Nº");
	            tabla.addCell("Articulo");
	            tabla.addCell("Descripción");
	            tabla.addCell("Cantidad");
	            tabla.addCell("Precio");
	            tabla.addCell("Importe");

	            
	            List<DetallePedidoVO> detalles = DetallePedidoService.obtenerLineasPorPedido(pedido);
	    		DecimalFormat decimalFormat = new DecimalFormat("#.##");
	            int contador = 0;
	            for (DetallePedidoVO detalle : detalles) {
	            		ProductoVO producto = ProductoService.findById(detalle.getId_producto());
	                    tabla.addCell(String.valueOf(contador++));
	                    tabla.addCell(producto.getNombre());
	                    tabla.addCell(producto.getDescripcion());
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
	            
	            // Abrir el archivo automáticamente
	            try {
	                File path = new File("C:/Users/pdgramcko/git/TIENDA_PEDRO_GRAMCKO_MARQUEZ/TIENDA_PEDRO_GRAMCKO_MARQUEZ/src/main/java/factura/salida.pdf");
	                Desktop.getDesktop().open(path);
	            } catch (IOException ex) {
	                ex.printStackTrace();
	            }
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        }
	    }
        
    
}
