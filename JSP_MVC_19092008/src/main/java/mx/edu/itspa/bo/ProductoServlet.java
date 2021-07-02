
package mx.edu.itspa.bo;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mx.edu.itspa.dao.ProductoDAO;
import mx.edu.itspa.general.Producto;

@WebServlet("/")
public class ProductoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
	
    private ProductoDAO productoDAO;
    
    public void init() {    productoDAO = new ProductoDAO();   }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
            doGet(request, response);
    }

	
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
		
            String action = request.getServletPath();

            try {
                switch (action) {
                    case "/new":
                        showNewForm(request, response);
                        break;
                    case "/insert":
                        insertProducto(request, response);
                        break;
                    case "/delete":
                            deleteProducto(request, response);
                            break;
                    case "/edit":
                        showEditForm(request, response);
                        break;
                    case "/update":
                        updateProducto(request, response);
                        break;
                    default:
                        listaProducto(request, response);
                        break;
                }
        } catch (SQLException ex) { throw new ServletException(ex); }
    }

	
    private void listaProducto(HttpServletRequest request, HttpServletResponse response)		
            throws SQLException, IOException, ServletException {
		
        List<Producto> listaProducto = productoDAO.selectAll();
        request.setAttribute("listaProducto", listaProducto);
        RequestDispatcher dispatcher = request.getRequestDispatcher("BajaConsulta.jsp");
        dispatcher.forward(request, response);
    }

	
    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("AltaModificacion.jsp");
        dispatcher.forward(request, response);
    }

	
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
		
        int id_producto = Integer.parseInt(request.getParameter("id_producto"));
        Producto existingUser = productoDAO.selectProducto(id_producto);
        RequestDispatcher dispatcher = request.getRequestDispatcher("AltaModificacion.jsp");
        request.setAttribute("pdt", existingUser);
        dispatcher.forward(request, response);	
    }


    private void insertProducto(HttpServletRequest request, HttpServletResponse response) 
        throws SQLException, IOException {
		
        String nombre_producto = request.getParameter("nombre_producto");
        int precio_compra = Integer.parseInt(request.getParameter("precio_compra"));
        int precio_venta = Integer.parseInt(request.getParameter("precio_venta"));
        String marca = request.getParameter("marca");
        int stock = Integer.parseInt(request.getParameter("stock"));
                       
        Producto newUser = new Producto(nombre_producto, precio_compra, precio_venta, marca, stock);
        productoDAO.insertProducto(newUser);
            response.sendRedirect("list");
    }

	
    private void updateProducto(HttpServletRequest request, HttpServletResponse response) 
			
        throws SQLException, IOException {
		
        int id_producto = Integer.parseInt(request.getParameter("id_producto"));
        String nombre_producto = request.getParameter("nombre_producto");
        int precio_compra = Integer.parseInt(request.getParameter("precio_compra"));
        int precio_venta = Integer.parseInt(request.getParameter("precio_venta"));
        String marca = request.getParameter("marca");
        int stock = Integer.parseInt(request.getParameter("stock"));

        Producto book = new Producto(id_producto, nombre_producto, precio_compra, 
                                    precio_venta, marca, stock);
        productoDAO.updateProducto(book);
            response.sendRedirect("list");
	
    }

	
    private void deleteProducto(HttpServletRequest request, HttpServletResponse response) 		
        throws SQLException, IOException {
		
        int id_producto = Integer.parseInt(request.getParameter("id_producto"));
        productoDAO.deleteProducto(id_producto);
            response.sendRedirect("list");
    }

}
