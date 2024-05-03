package hilos;

import java.util.List;


import model.VO.PedidoVO;
import model.VO.UsuarioVO;
import service.PedidoService;
import service.UsuarioService;

public class EnviarPedidos implements Runnable {

    private static boolean running = false;
    private static Thread thread;

    public static synchronized void startThread() {
        if (!running) {
            running = true;
            thread = new Thread(new EnviarPedidos());
            thread.start();

        }
    }

    public static synchronized void stopThread() {
        if (running) {
            running = false;
            thread.interrupt();
            thread = null;
        }
    }

    public static synchronized boolean isRunning() {
        return running;
    }

    @Override
    public void run() {

        while (running) {
        	try {
				Thread.sleep(100000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            List<PedidoVO> pedidos = PedidoService.findAll();
            for (PedidoVO pedido : pedidos) {
            	
                if (pedido.getEstado().equals("Pendiente de envío")) {
                	

                	UsuarioVO usuario = UsuarioService.findById(pedido.getId_usuario());				
                    PedidoService.enviarPedidoAdmin(pedido,usuario);
                    System.out.println("Se ha cambiado un pedido");
                }
            }
            try {
                Thread.sleep(100000);
            } catch (InterruptedException e) {

                running = false;
            }
        }
    }
}