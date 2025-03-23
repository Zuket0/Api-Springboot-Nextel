
// Seleccionar todos los checkboxes
const checkboxes = document.querySelectorAll('input[type="checkbox"][name="tipo"]');

// Agregar un evento para que solo uno pueda estar seleccionado
checkboxes.forEach(checkbox => {
    checkbox.addEventListener('change', () => {
        // Si se marca el checkbox, desmarcar todos los demás
        if (checkbox.checked) {
            checkboxes.forEach(otherCheckbox => {
                if (otherCheckbox !== checkbox) {
                    otherCheckbox.checked = false;
                }
            });
        }
        
        // Obtener la opción seleccionada
        const selectedMarca = Array.from(checkboxes)
                                    .filter(chk => chk.checked)
                                    .map(chk => chk.value)[0];  // Solo toma el primero que esté marcado

        // Llamar a la función para actualizar los productos con la marca seleccionada
        actualizarProductos(selectedMarca);
    });
});

// Función para actualizar productos según la marca seleccionada
const actualizarProductos = async (marca = null) => {
    try {
        const url = marca ? `http://localhost:8080/api/productos?tipo=${encodeURIComponent(marca)}` : 'http://localhost:8080/api/productos';
        const response = await fetch(url);
        if (!response.ok) {
            throw new Error('Error al cargar los productos');
        }
        const productos = await response.json();
        mostrarProductos(productos);
    } catch (error) {
        console.error('Error al cargar los productos:', error);
        mostrarError();
    }
};

// Función para mostrar los productos en el frontend
const mostrarProductos = (productos) => {
    const contenedor = document.querySelector('.container-items');
    contenedor.innerHTML = '';  // Limpiar productos actuales

    productos.forEach(producto => {
        const item = document.createElement('div');
        item.classList.add('item');
        item.innerHTML = `
            <figure>
                <img src="${producto.url}" alt="${producto.nombreProducto}">
            </figure>
            <div class="info-curso">
                <h2>${producto.nombreProducto}</h2>
                <p>${producto.descripcionProducto}</p>
                <p class="Price">$${producto.precioProducto}</p>
                <button class="btn-add-cart">Añadir al carrito</button>
            </div>
        `;
        contenedor.appendChild(item);
    });
};

// Función para mostrar el error
const mostrarError = () => {
    const contenedor = document.querySelector('.container-items');
    contenedor.innerHTML = '<p>Error al cargar los productos</p>';
};


// PRECIO MENOR - MAYOR ORDENAMIENTO
document.addEventListener("DOMContentLoaded", () => {
    document.getElementById('sort-select').addEventListener('change', async (event) => {
        const sortOrder = event.target.value;

        if (sortOrder === 'relevante') {
            // Llamar a la API para restablecer los productos desde el servidor
            await actualizarProductos();
        } else {
            ordenarProductos(sortOrder);
        }
    });
});

const ordenarProductos = (orden) => {
    const contenedor = document.querySelector('.container-items');
    let productos = Array.from(contenedor.querySelectorAll('.item'));
    
    // Ordenar los productos según el precio
    productos.sort((a, b) => {
        const precioA = parseFloat(a.querySelector('.Price').textContent.replace('$', '').trim());
        const precioB = parseFloat(b.querySelector('.Price').textContent.replace('$', '').trim());
        
        if (orden === 'asc') {
            return precioA - precioB; // Ordenar de menor a mayor
        } else {
            return precioB - precioA; // Ordenar de mayor a menor
        }
    });

    // Volver a agregar los productos ordenados al contenedor
    contenedor.innerHTML = ''; // Limpiar contenedor
    productos.forEach(item => {
        contenedor.appendChild(item);
    });
};


