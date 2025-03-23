package dao;
// Clase UsuarioDAOImpl

import util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Usuario;

public class UsuarioDAOImpl implements UsuarioDAO {

    private Connection connection;

    public UsuarioDAOImpl() {
        connection = DBConnection.getConnection();
    }

    @Override
    public void insertUsuario(Usuario usuario) {
        try {
            String query = "INSERT INTO clientes (nombre_cli, email_cli, contraseña_cli) VALUES (?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, usuario.getNombre());
            preparedStatement.setString(2, usuario.getEmail());
            preparedStatement.setString(3, usuario.getContrasena());
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Usuario getUsuario(int id) {
        Usuario usuario = null;
        try {
            String query = "SELECT * FROM clientes WHERE id_cli = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                usuario = new Usuario();
                usuario.setId(resultSet.getInt("id"));
                usuario.setNombre(resultSet.getString("nombre"));
                usuario.setEmail(resultSet.getString("email"));
                usuario.setContrasena(resultSet.getString("contrasena"));
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }

    @Override
    public List<Usuario> getAllUsuarios() {
        List<Usuario> usuarios = new ArrayList<>();
        try {
            String query = "SELECT * FROM clientes";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(resultSet.getInt("id"));
                usuario.setNombre(resultSet.getString("nombre"));
                usuario.setEmail(resultSet.getString("email"));
                usuario.setContrasena(resultSet.getString("contrasena"));
                usuarios.add(usuario);
            }
            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuarios;
    }

    @Override
    public void updateUsuario(Usuario usuario) {
        try {
            String query = "UPDATE clientes SET nombre_cli = ?, email_cli = ?, contraseña_cli = ? WHERE id_cli = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, usuario.getNombre());
            preparedStatement.setString(2, usuario.getEmail());
            preparedStatement.setString(3, usuario.getContrasena());
            preparedStatement.setInt(4, usuario.getId());
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteUsuario(int id) {
        try {
            String query = "DELETE FROM usuarios WHERE id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

@Override
public boolean verifyUsuario(String email, String contrasena) {
    try {
        String query = "SELECT * FROM clientes WHERE email_cli = ? AND contraseña_cli = ?";
        PreparedStatement pstmt = connection.prepareStatement(query);
        pstmt.setString(1, email);
        pstmt.setString(2, contrasena);
        ResultSet rs = pstmt.executeQuery();

        boolean credencialesValidas = rs.next();

        rs.close();
        pstmt.close();

        return credencialesValidas;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
}


  @Override
public String getTipoUsuario(String email) {
    try {
        String query = "SELECT tipo_usuario FROM clientes WHERE email_cli = ?";
        PreparedStatement pstmt = connection.prepareStatement(query);
        pstmt.setString(1, email);
        ResultSet rs = pstmt.executeQuery();

        String tipoUsuario = null;
        if (rs.next()) {
            tipoUsuario = rs.getString("tipo_usuario");
        }

        rs.close();
        pstmt.close();

        return tipoUsuario;
    } catch (SQLException e) {
        e.printStackTrace();
        return null;
    }
}


}
