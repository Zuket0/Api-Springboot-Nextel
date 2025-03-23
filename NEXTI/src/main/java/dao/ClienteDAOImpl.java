package dao;
// Clase UsuarioDAOImpl

import util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Cliente;

public class ClienteDAOImpl implements ClienteDAO {

    private Connection connection;

    public ClienteDAOImpl() {
        connection = DBConnection.getConnection();
    }

    

    @Override
    public void insertCliente(Cliente cliente) {
        String query = "INSERT INTO clientes (id_cli, nombre_cli, apellidos_cli, email_cli, contraseña_cli, numero_cli, tipo_usuario) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement st = connection.prepareStatement(query)) {
            st.setInt(1, cliente.getId());
            st.setString(2, cliente.getNombre());
            st.setString(3, cliente.getApellidos());
            st.setString(4, cliente.getEmail());
            st.setString(5, cliente.getContrasena());
            st.setLong(6, cliente.getNumeroCli());
            st.setInt(7, 2); // Tipo de usuario "cliente".

            int rowsAffected = st.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Cliente registrado exitosamente.");
            } else {
                System.out.println("No se pudo registrar al cliente.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error en la inserción: " + e.getMessage());
        }
    }
    
    public void registerCliente(Cliente cliente) {
    try {
        // Inserta el cliente en la tabla "clientes" con el número de celular
        String query = "INSERT INTO clientes (id_cli, nombre_cli, apellidos_cli, email_cli, contraseña_cli, numero_cli) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, cliente.getId());
        statement.setString(2, cliente.getNombre());
        statement.setString(3, cliente.getApellidos());
        statement.setString(4, cliente.getEmail());
        statement.setString(5, cliente.getContrasena());
        statement.setLong(6, cliente.getNumeroCli());

        // Ejecutar la inserción
        int rowsAffected = statement.executeUpdate();
        if (rowsAffected > 0) {
            System.out.println("Cliente registrado exitosamente.");
        } else {
            System.out.println("No se pudo registrar al cliente.");
        }

        statement.close();
    } catch (SQLException e) {
        e.printStackTrace();
        System.out.println("Error en la inserción: " + e.getMessage());
    }
}




@Override
public Cliente getCliente(int id) {
    Cliente cliente = null;
    try {
        // Consulta para obtener los detalles del cliente
        String query = "SELECT * FROM clientes WHERE id_cli = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            // Crear el cliente usando el constructor con los parámetros necesarios
            cliente = new Cliente(
                resultSet.getInt("id_cli"),          // id_cli
                resultSet.getString("nombre_cli"),   // nombre_cli
                resultSet.getString("apellidos_cli"), // apellidos_cli
                resultSet.getString("email_cli"),    // email_cli
                resultSet.getString("contraseña_cli"),// contraseña_cli
                resultSet.getInt("numero_cli")    // numero_cli
            );
        }
        resultSet.close();
        preparedStatement.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return cliente;
}



@Override
public List<Cliente> getAllCliente() {
    List<Cliente> clientes = new ArrayList<>();
    try {
        String query = "SELECT * FROM clientes";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            int id = resultSet.getInt("id_cli"); // Asegúrate de usar el nombre correcto de la columna
            String nombre = resultSet.getString("nombre_cli"); // Corregido para que coincida con la base de datos
            String apellidos = resultSet.getString("apellidos_cli"); // Corregido
            String email = resultSet.getString("email_cli"); // Corregido
            String contraseña = resultSet.getString("contraseña_cli"); // Corregido
            int numero_cli = resultSet.getInt("numero_cli"); // Corregido para usar el nombre correcto de la columna

            // Crear el cliente usando el constructor con los parámetros correctos
            Cliente cliente = new Cliente(id, nombre, apellidos, email, contraseña, numero_cli);
            clientes.add(cliente);
        }
        resultSet.close();
        preparedStatement.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return clientes;
}

@Override
public void updateCliente(Cliente cliente) {

    try {
        // Corregir la consulta SQL para que coincidan los parámetros
        String query = "UPDATE clientes SET nombre_cli = ?, apellidos_cli = ?, email_cli = ?, contraseña_cli = ?, numero_cli = ? WHERE id_cli = ?";
        PreparedStatement statement = connection.prepareStatement(query);
        
        // Asignación de los valores correctamente en el PreparedStatement
        statement.setString(1, cliente.getNombre());
        statement.setString(2, cliente.getApellidos());
        statement.setString(3, cliente.getEmail());
        statement.setString(4, cliente.getContrasena());
        statement.setLong(5, cliente.getNumeroCli());
        statement.setInt(6, cliente.getId());

        // Ejecutar la actualización en la base de datos
        statement.executeUpdate();
        statement.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}


    @Override
    public void deleteCliente(int id) {

        try {
            String query = "DELETE FROM clientes WHERE id_cli = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
