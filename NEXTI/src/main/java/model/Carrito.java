package model;

import javax.annotation.Resource;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import javax.sql.DataSource;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@SessionScoped
@Named("carrito")
public class Carrito implements Serializable {
    private List<Producto> productos = new ArrayList<>();
    private int productoId;

    @Resource(name = "jdbc/nextel")
    private DataSource dataSource;

    public List<Producto> getProductos() {
        return productos;
    }

    public int getProductoId() {
        return productoId;
    }

    public void setProductoId(int productoId) {
        this.productoId = productoId;
    }

    public void addProducto() {
        try (Connection connection = dataSource.getConnection()) {
            String sql = "SELECT * FROM productos WHERE id_pro = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, productoId);

                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        Producto producto = new Producto();
                        producto.setIdProducto(resultSet.getInt("id_pro"));
                        producto.setNombreProducto(resultSet.getString("modelo")); // Asume que "modelo" es el nombre
                        producto.setDescripcionProducto(resultSet.getString("marca")); // Asume que "marca" es la descripción
                        producto.setPrecioProducto(resultSet.getDouble("precio"));
                        producto.setStockProducto(resultSet.getInt("stock")); // Ajusta según los campos en tu DB
                        producto.setUrl(resultSet.getString("url"));

                        productos.add(producto);
                    } else {
                        System.out.println("Producto no encontrado con ID: " + productoId);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public double getTotal() {
        return productos.stream().mapToDouble(Producto::getPrecioProducto).sum();
    }
}
