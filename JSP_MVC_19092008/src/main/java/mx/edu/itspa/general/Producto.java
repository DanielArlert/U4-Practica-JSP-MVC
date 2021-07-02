package mx.edu.itspa.general;

public class Producto {
    protected int id_producto;
    protected String nombre_producto;
    protected int precio_compra;
    protected int precio_venta;
    protected String marca;
    protected int stock;
	
    public Producto() { }
	
    public Producto(String nombre_producto, int precio_compra, 
        int precio_venta, String marca, int stock) {
        
        super();
        this.nombre_producto = nombre_producto;
        this.precio_compra = precio_compra;
        this.precio_venta = precio_venta;
        this.marca = marca;
        this.stock = stock;
    }

    
    public Producto(int id_producto, String nombre_producto, int precio_compra, 
            int precio_venta, String marca, int stock) {
        
	super();
        this.id_producto = id_producto;
        this.nombre_producto = nombre_producto;
        this.precio_compra = precio_compra;
        this.precio_venta = precio_venta;
	this.marca = marca;
        this.stock = stock;
    }  
        
    
    public int getId_producto() { return id_producto; }
    public void setId_producto(int id_producto) { this.id_producto = id_producto; }

        public String getNombre_producto() { return nombre_producto; }
        public void setNombre_producto(String nombre_producto) { this.nombre_producto = nombre_producto; }

    public int getPrecio_compra() { return precio_compra; }
    public void setPrecio_compra(int precio_compra) { this.precio_compra = precio_compra; }

        public int getPrecio_venta() { return precio_venta; }
        public void setPrecio_venta(int precio_venta) { this.precio_venta = precio_venta; }

    public String getMarca() { return marca; }
    public void setMarca(String marca) { this.marca = marca; }

        public int getStock() { return stock; }
        public void setStock(int stock) { this.stock = stock; }
}
