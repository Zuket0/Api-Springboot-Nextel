package controller;
// Clase UsuarioController
import java.util.List;

import dao.UsuarioDAO;
import dao.UsuarioDAOImpl;
import model.Usuario;

public class UsuarioController {
    private UsuarioDAO usuarioDAO;

    public UsuarioController() {
        usuarioDAO = new UsuarioDAOImpl();
    }

    public void crearUsuario(Usuario usuario) {
        usuarioDAO.insertUsuario(usuario);
    }

    public Usuario obtenerUsuario(int id) {
        return usuarioDAO.getUsuario(id);
    }

    public List<Usuario> obtenerTodosLosUsuarios() {
        return usuarioDAO.getAllUsuarios();
    }

    public void actualizarUsuario(Usuario usuario) {
        usuarioDAO.updateUsuario(usuario);
    }

    public void eliminarUsuario(int id) {
        usuarioDAO.deleteUsuario(id);
    }
    
    public boolean verificarCredenciales(String email, String contrasena){
        return usuarioDAO.verifyUsuario(email, contrasena);
    }
    public String obtenerTipoUsuario(String email){
        return usuarioDAO.getTipoUsuario(email);
    }
}
