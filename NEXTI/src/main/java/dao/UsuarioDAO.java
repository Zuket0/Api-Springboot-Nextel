package dao;
// Interfaz UsuarioDAO
import java.util.List;

import model.Usuario;

public interface UsuarioDAO {
    void insertUsuario(Usuario usuario);
    Usuario getUsuario(int id);
    List<Usuario> getAllUsuarios();
    void updateUsuario(Usuario usuario);
    void deleteUsuario(int id);
    public boolean verifyUsuario(String email, String contrasena);
    public String getTipoUsuario(String email);
    
    
}
