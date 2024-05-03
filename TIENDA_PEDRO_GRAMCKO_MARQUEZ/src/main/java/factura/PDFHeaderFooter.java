package factura;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import com.itextpdf.text.pdf.draw.LineSeparator;

import model.VO.PedidoVO;

public class PDFHeaderFooter extends PdfPageEventHelper {
    //Template para el n�mero total de p�ginas
    PdfTemplate total;
    
    //CABECERA
    //Evento que se ejecuta en cada nueva pagina del pdf
    public void onStartPage(PdfWriter writer, Document document, PedidoVO pedido) {
    	//Declaramos la imagen y texto de la cabecera
    	LineSeparator linea;
        Image imagen;
        
    	try {
            PdfContentByte cb = writer.getDirectContent();
            
            // Agregar imagen de cabecera
            imagen = Image.getInstance("img/HapyyPets.png");
            imagen.scaleToFit(100, 100); // Ajustar tamaño de la imagen
            imagen.setAlignment(Element.ALIGN_CENTER);
            document.add(imagen);
            
            // Agregar título de la factura
            Font fontTitulo = FontFactory.getFont(FontFactory.HELVETICA, 16, Font.BOLD);
            Font fontFactura = FontFactory.getFont(FontFactory.HELVETICA, 10, Font.NORMAL);
            Paragraph titulo = new Paragraph("FACTURA", fontTitulo);
            titulo.setAlignment(Element.ALIGN_CENTER);
            Paragraph num_factura = new Paragraph(pedido.getNum_factura(), fontFactura);
            document.add(titulo);
            document.add(num_factura);
            
            // Agregar fecha de emisión
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            Font fontFecha = FontFactory.getFont(FontFactory.HELVETICA, 12);
            Paragraph fecha = new Paragraph(sdf.format(pedido.getFecha()), fontFecha);
            fecha.setAlignment(Element.ALIGN_RIGHT);
            document.add(fecha);
            
            // Línea separadora
            linea = new LineSeparator();
            document.add(linea);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
      
    }   

    //PIE
    public void onEndPage(PdfWriter writer, Document document) {
        PdfContentByte cb = writer.getDirectContent();
        Phrase pie = new Phrase(String.format("Página %d", writer.getPageNumber()));
        ColumnText.showTextAligned(cb, Element.ALIGN_CENTER, pie, (document.right() - document.left()) / 2 + document.leftMargin(), document.bottom() - 20, 0);  
    } 
    
}
