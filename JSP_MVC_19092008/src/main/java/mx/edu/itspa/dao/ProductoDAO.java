package mx.edu.itspa.dao;
        

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import mx.edu.itspa.general.Producto;

public class ProductoDAO {
    private String database = "jdbc:mysql://localhost:3306/ferreteria_db?serverTimezone=UTC";
    private String usuario = "root";
    private String clave = "root";

    private static final String INSERT = "INSERT INTO producto" 
        + "  (nombre_producto, precio_compra, precio_venta, marca, stock) VALUES "
        + " (?, ?, ?, ?, ?);";

    private static final String SELECT_PRODUCT = "select * from producto where id_producto =?";
        
    private static final String SELECT_ALL = "select * from producto";
        
    private static final String DELETE =  "delete from producto where id_producto=?;";
        
    private static final String UPDATE =  "update producto set nombre_producto=?, precio_compra=?, "
        + "precio_venta=?, marca=?, stock=? where id_producto=?;";

    public ProductoDAO() {  }

    public Connection Conectar() {
        Connection connection = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(database, usuario, clave);
                System.out.println("C");
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } 
        return connection;
    }

    
    public void insertProducto(Producto pdt) throws SQLException {    
        System.out.println(INSERT);
        
        try (Connection connection = Conectar();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT)) {
            preparedStatement.setString(1, pdt.getNombre_producto());
            preparedStatement.setInt(2, pdt.getPrecio_compra());
            preparedStatement.setInt(3, pdt.getPrecio_venta());
            preparedStatement.setString(4, pdt.getMarca());
            preparedStatement.setInt(5, pdt.getStock());

                System.out.println(preparedStatement);
                preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
       }
    }


    public Producto selectProducto(int id_producto) {
        Producto user = null;
                
        try (Connection connection = Conectar();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT);) {
            
            preparedStatement.setInt(1, id_producto);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String nombre_producto = rs.getString("nombre_producto");
                int precio_compra = rs.getInt("precio_compra");
                int precio_venta = rs.getInt("precio_venta");
                String marca = rs.getString("marca");
                int stock = rs.getInt("stock");
                                
                user = new Producto(id_producto, nombre_producto, 
                        precio_compra, precio_venta, marca, stock);
            }
        } catch (SQLException e) { printSQLException(e); }
		
        return user;
    }

    
    public List<Producto> selectAll() {
        List<Producto> pdt = new ArrayList<>();
                
        try (Connection connection = Conectar();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);) {
                    
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id_producto = rs.getInt("id_producto");
                String nombre_producto = rs.getString("nombre_producto");
                int precio_compra = rs.getInt("precio_compra");
                int precio_venta = rs.getInt("precio_venta");
                String marca = rs.getString("marca");
                int stock = rs.getInt("stock");
                                
                pdt.add(new Producto(id_producto, nombre_producto, 
                    precio_compra, precio_venta, marca, stock));
            }
        } catch (SQLException e) {  printSQLException(e);   }
        return pdt;
    }

	
    public boolean deleteProducto(int id_producto) throws SQLException {
        boolean registro_eliminado;
		
        try (Connection connection = Conectar(); 
                PreparedStatement statement =  connection.prepareStatement(DELETE);) {
                    statement.setInt(1, id_producto);
                    registro_eliminado = statement.executeUpdate() > 0;
        }
        
        return registro_eliminado;
    }

    public boolean updateProducto(Producto pdt) throws SQLException {
        boolean registro_actualizado;
    
        try (Connection connection = Conectar();
            PreparedStatement statement = connection.prepareStatement(UPDATE);) {
			
            statement.setString(1, pdt.getNombre_producto());
            statement.setInt(2, pdt.getPrecio_compra());
            statement.setInt(3, pdt.getPrecio_venta());
            statement.setString(4, pdt.getMarca());
            statement.setInt(5, pdt.getStock());
            statement.setInt(6, pdt.getId_producto());
            
            registro_actualizado = statement.executeUpdate() > 0;
        }
                
        return registro_actualizado;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
				
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

    /*
    drop table producto;

            create table producto (
                id_producto  int(5) NOT NULL AUTO_INCREMENT,
                nombre_producto varchar(50) NOT NULL,
                precio_compra int(5) NOT NULL,
                precio_venta int(5) NOT NULL,
                marca varchar(50) NOT NULL,
                stock int(5) NOT NULL,
                PRIMARY KEY (id_producto)
               );

    insert into producto values (1, 'Cavetown', 50, 1000, 'Talento', 1);

    select * from producto;
    */
}
