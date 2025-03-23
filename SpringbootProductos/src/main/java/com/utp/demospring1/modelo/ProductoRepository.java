
package com.utp.demospring1.modelo;

import com.utp.demospring1.modelo.Producto;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductoRepository extends JpaRepository<Producto, Integer> {
}