document.addEventListener("turbo:load", () => {
  const cartButton = document.getElementById("cart-button");
  const cartModal = document.getElementById("cart-modal");
  const cartItemsContainer = document.getElementById("cart-items");
  const clearCartButton = document.getElementById("clear-cart");
  const checkoutButton = document.getElementById("checkout");
  const cartCount = document.getElementById("cart-count");
  const closeModalButton = document.getElementById("close-modal");
  const notification = document.getElementById("notification-save-product");

  // Mostrar/Ocultar el modal del carrito
  cartButton.addEventListener("click", () => {
    cartModal.classList.toggle("hidden");
    fetchCartItems();
  });

  // Cerrar el modal al hacer clic en el botón de cerrar
  closeModalButton.addEventListener("click", () => {
    cartModal.classList.add("hidden");
  });

  // Cerrar el modal al hacer clic fuera de él
  window.addEventListener("click", (event) => {
    if (event.target === cartModal) {
      cartModal.classList.add("hidden");
    }
  });

  // Cerrar el modal al presionar la tecla ESC
  window.addEventListener("keydown", (event) => {
    if (event.key === "Escape") {
      cartModal.classList.add("hidden");
    }
  });

  // Agregar producto al carrito
  document.querySelectorAll(".add-to-cart").forEach(button => {
    button.addEventListener("click", (event) => {
      const productId = event.target.dataset.productId;
      fetch(`/cart/add_to_cart?product_id=${productId}`, {
        method: "POST",
        headers: {
          "X-CSRF-Token": document.querySelector("[name='csrf-token']").content
        }
      })
      .then(response => response.json())
      .then(data => {
        console.log(`Updated cart count: ${data.count}`);
        cartCount.textContent = data.count;

        // Mostrar notificación
        if (data.added) {
          notification.textContent = 'Producto agregado al carrito.';
        } else {
          notification.textContent = 'El producto ya está en el carrito.';
        }
        notification.classList.remove('hidden');

        // Ocultar notificación después de 3 segundos
        setTimeout(() => {
          notification.classList.add('hidden');
        }, 3000);
      })
      .catch(error => console.error('Error:', error));
    });
  });

  // Limpiar carrito
  clearCartButton.addEventListener("click", () => {
    fetch("/cart/clear_cart", {
      method: "POST",
      headers: {
        "X-CSRF-Token": document.querySelector("[name='csrf-token']").content
      }
    })
    .then(() => {
      cartItemsContainer.innerHTML = "";
      cartCount.textContent = "0";
      cartModal.classList.add("hidden");
    })
    .catch(error => console.error('Error:', error));
  });

  // Crear orden
  checkoutButton.addEventListener("click", () => {
    fetch("/orders", {
      method: "POST",
      headers: {
        "X-CSRF-Token": document.querySelector("[name='csrf-token']").content
      }
    })
    .then(response => {
      if (response.ok) {
        return response.json();
      } else {
        throw new Error('Failed to create order');
      }
    })
    .then(data => {
      alert('Order created successfully');
      cartItemsContainer.innerHTML = "";
      cartCount.textContent = "0";
      cartModal.classList.add("hidden");
      window.location.href = `/orders/${data.id}`; // Redirigir a la vista de detalle de la orden
    })
    .catch(error => console.error('Error:', error));
  });

  // Fetch cart items
  function fetchCartItems() {
    fetch("/cart/show")
      .then(response => response.json())
      .then(data => {
        cartItemsContainer.innerHTML = data.map(item => `
          <div class="flex justify-between mb-2">
            <span>${item.name}</span>
            <span>${item.price}</span>
          </div>
        `).join("");
      })
      .catch(error => console.error('Error:', error));
  }

  // Actualizar el contador del carrito al cargar la página
  fetch("/cart/count")
    .then(response => response.json())
    .then(data => {
      console.log(`Cart count on load: ${data.count}`);
      cartCount.textContent = data.count;
    })
    .catch(error => console.error('Error:', error));
});
