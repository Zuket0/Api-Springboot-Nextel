package dao;
// Interfaz UsuarioDAO
import java.util.List;

import model.Cliente;

// Interfaz ClienteDAO
public interface ClienteDAO {
    void insertCliente(Cliente cliente);  // Cambia aquí
    Cliente getCliente(int id);
    List<Cliente> getAllCliente();
    void updateCliente(Cliente cliente);
    void deleteCliente(int id);
}
