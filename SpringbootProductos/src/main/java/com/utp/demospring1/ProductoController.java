package com.utp.demospring1;

import com.utp.demospring1.modelo.Producto;
import com.utp.demospring1.modelo.ProductoService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/productos")
@CrossOrigin(origins = "http://localhost:8081") // Permite solicitudes CORS
public class ProductoController {

    private final ProductoService productoService;

    public ProductoController(ProductoService productoService) {
        this.productoService = productoService;
    }

    @GetMapping
    public List<Producto> listarProductos(@RequestParam(value = "tipo", required = false) String tipo) {
        if (tipo != null && !tipo.isEmpty()) {
            return productoService.obtenerPorTipo(tipo);  // Aquí filtramos por tipo
        }
        return productoService.obtenerTodos();  // Si no hay filtro, devuelve todos los productos
    }
}
