package controller;

import java.util.List;
import dao.ClienteDAO;
import dao.ClienteDAOImpl;
import model.Cliente;

public class ClienteController {
    private ClienteDAO clienteDAO;

    public ClienteController() {
        clienteDAO = new ClienteDAOImpl();
    }

    public void registrarCliente(Cliente cliente) {
        clienteDAO.insertCliente(cliente);  // Llamamos a insertCliente en vez de registerCliente
    }

    public Cliente obtenerCliente(int id) {
        return clienteDAO.getCliente(id);
    }

    public List<Cliente> obtenerTodosLosClientes() {
        return clienteDAO.getAllCliente();
    }

    public void actualizarCliente(Cliente cliente) {
        clienteDAO.updateCliente(cliente);
    }

    public void eliminarCliente(int id) {
        clienteDAO.deleteCliente(id);
    }
}
