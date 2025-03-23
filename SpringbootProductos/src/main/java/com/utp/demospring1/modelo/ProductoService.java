package com.utp.demospring1.modelo;

import com.utp.demospring1.modelo.Producto;
import com.utp.demospring1.modelo.ProductoRepository;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.client.RestTemplate;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ProductoService {

    private final ProductoRepository productoRepository;

    @Autowired
    private RestTemplate restTemplate;

    private final String API_URL = "http://localhost:8080/api/productos"; // URL del API de productos

    public ProductoService(ProductoRepository productoRepository) {
        this.productoRepository = productoRepository;
    }

    // Método para obtener todos los productos desde el repositorio (sin filtro)
    public List<Producto> obtenerTodos() {
        return productoRepository.findAll();
    }

    // Método para obtener productos filtrados por tipo
    public List<Producto> obtenerPorTipo(String tipo) {
        return productoRepository.findAll()
                                 .stream()
                                 .filter(p -> p.getTipoProducto().equalsIgnoreCase(tipo))  // Filtra los productos por tipo
                                 .collect(Collectors.toList());
    }

    // Método para obtener productos desde una API externa (esto es lo que ya tenías)
    public List<Producto> obtenerProductosDesdeApi() {
        Producto[] productos = restTemplate.getForObject(API_URL, Producto[].class);
        return Arrays.asList(productos); // Convertimos el array en una lista
    }
}
