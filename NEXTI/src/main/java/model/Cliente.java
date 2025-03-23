package model;

public class Cliente {
    private int id;
    private String nombre;
    private String apellidos;
    private String email;
    private String contrasena;
    private long numero_cli; 

    // Constructor
    public Cliente(int id, String nombre, String apellidos, String email, String contrasena, long numero_cli) {
        this.id = id;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.email = email;
        this.contrasena = contrasena;
        this.numero_cli = numero_cli; 
    }

    // Getters y setters
    public long getNumeroCli() {
        return numero_cli;
    }

    public void setNumeroCli(int numero_cli) {
        this.numero_cli = numero_cli;
    }
    
    // Otros getters y setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }
}
