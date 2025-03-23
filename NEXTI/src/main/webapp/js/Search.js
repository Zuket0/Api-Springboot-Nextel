// Elementos del DOM
const searchInput = document.getElementById("search-input");
const suggestionsList = document.getElementById("suggestions-list");
const searchButton = document.getElementById("search-button");
const containerItems = document.querySelector(".container-items");

// Función para obtener productos de la API
async function obtenerProductos() {
    try {
        const response = await fetch("http://localhost:8080/api/productos");
        return await response.json(); // Retornamos los datos de productos
    } catch (error) {
        console.error("Error al cargar productos:", error);
        return []; // En caso de error, retornamos un array vacío
    }
}

// Mostrar productos filtrados en la caja de productos
function mostrarProductosFiltrados(productosFiltrados) {
    // Limpiar productos actuales
    containerItems.innerHTML = "";

    // Mostrar los productos filtrados
    productosFiltrados.forEach((producto) => {
        const div = document.createElement("div");
        div.classList.add("item");

        const figure = document.createElement("figure");
        const img = document.createElement("img");
        img.src = producto.url;
        img.alt = producto.nombreProducto;
        figure.appendChild(img);

        const info = document.createElement("div");
        info.classList.add("info-curso");

        const h2 = document.createElement("h2");
        h2.textContent = producto.nombreProducto;
        const p = document.createElement("p");
        p.textContent = producto.descripcionProducto;
        const price = document.createElement("p");
        price.classList.add("Price");
        price.textContent = `$${producto.precioProducto}`;

        const button = document.createElement("button");
        button.classList.add("btn-add-cart");
        button.textContent = "Añadir al carrito";

        info.appendChild(h2);
        info.appendChild(p);
        info.appendChild(price);
        info.appendChild(button);

        div.appendChild(figure);
        div.appendChild(info);

        containerItems.appendChild(div);
    });
}

// Mostrar sugerencias dinámicas al escribir
searchInput.addEventListener("input", async () => {
    const query = searchInput.value.trim().toLowerCase();
    suggestionsList.innerHTML = ""; // Limpiar sugerencias anteriores

    if (query) {
        const productos = await obtenerProductos(); // Obtener productos de la API
        const sugerenciasFiltradas = productos.filter((producto) => {
            const nombreCoincide = producto.nombreProducto.toLowerCase().includes(query);
            const marcaCoincide = producto.tipoProducto.toLowerCase().includes(query);
            return nombreCoincide || marcaCoincide; // Buscamos en nombre o tipo
        });

        // Crear elementos de lista para las sugerencias
        sugerenciasFiltradas.forEach((producto) => {
            const li = document.createElement("li");
            li.textContent = `${producto.nombreProducto} - ${producto.tipoProducto}`;

            // Al hacer clic en una sugerencia, llenar el input y cerrar la lista
            li.addEventListener("click", () => {
                searchInput.value = producto.nombreProducto;
                suggestionsList.style.display = "none"; // Ocultar sugerencias
            });

            suggestionsList.appendChild(li);
        });

        // Mostrar lista de sugerencias
        suggestionsList.style.display = "block";
    } else {
        suggestionsList.style.display = "none";
    }
});

// Ocultar sugerencias al perder el foco del input
searchInput.addEventListener("blur", () => {
    setTimeout(() => {
        suggestionsList.style.display = "none";
    }, 100); // Delay para permitir la selección con clic
});

// Mostrar sugerencias nuevamente al ganar foco
searchInput.addEventListener("focus", () => {
    if (searchInput.value.trim()) {
        suggestionsList.style.display = "block";
    }
});

// Evento para filtrar productos cuando se hace clic en el botón de búsqueda
searchButton.addEventListener("click", async () => {
    const query = searchInput.value.trim().toLowerCase();

    if (query) {
        const productos = await obtenerProductos(); // Obtener productos de la API
        const productosFiltrados = productos.filter((producto) => {
            const nombreCoincide = producto.nombreProducto.toLowerCase().includes(query);
            const marcaCoincide = producto.tipoProducto.toLowerCase().includes(query);
            return nombreCoincide || marcaCoincide; // Filtramos por nombre o tipo
        });

        // Mostrar los productos filtrados en la caja de productos
        mostrarProductosFiltrados(productosFiltrados);
        suggestionsList.style.display = "none"; // Ocultar las sugerencias cuando se realiza la búsqueda
    } else {
        // Si no hay texto, mostrar todos los productos
        const productos = await obtenerProductos();
        mostrarProductosFiltrados(productos);
    }
});

// Mostrar productos por defecto al cargar la página (si es necesario)
document.addEventListener("DOMContentLoaded", async () => {
    const productos = await obtenerProductos();
    mostrarProductosFiltrados(productos);
});

// Evento para realizar la búsqueda cuando se presiona la tecla Enter
searchInput.addEventListener("keydown", (event) => {
    if (event.key === "Enter") {
        event.preventDefault(); // Evitar el comportamiento por defecto de la tecla Enter
        searchButton.click(); // Disparar el clic del botón de búsqueda
    }
});
