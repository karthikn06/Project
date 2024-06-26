<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Cart</title>
    <style>
        * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
}

#header {
    display: flex;
    box-sizing: border-box;
    flex-direction: column;
    /* justify-content: space-between; */
    /* align-items: center; */
    background: url('foodys back main.jpg') no-repeat center;

    height: 422px;
    width: 100%;

    margin-bottom: 20px;

}

.navbar {
    display: flex;
    justify-content: right;
    width: 100%;
    margin: 10px;


}

.navbar li:hover {
    background-color: #2980b9;
    border-radius: 5px;
  }
  
  .navbar li:hover a {
    color: #fff; /* Change text color on hover if desired */
  }

.navbar ul li {
    list-style: none;
    display: inline-block;
    margin: 10px;
    margin-bottom: 0px;
    padding: 5px;
}

#li5 {
    padding-right: 5px;
}

a[href="#"] {
    text-decoration: none;
    cursor: pointer;
    font-size: 20px;
    color: rgb(255, 255, 255);
    font-weight: 1000;
}

a[href="About.jsp"] {
    text-decoration: none;
    cursor: pointer;
    font-size: 20px;
    color: rgb(255, 255, 255);
    font-weight: 1000;
}

a[href="Menu.jsp"] {
    text-decoration: none;
    cursor: pointer;
    font-size: 20px;
    color: rgb(255, 255, 255);
    font-weight: 1000;
}
a[href="Cart.jsp"] {
    text-decoration: none;
    cursor: pointer;
    font-size: 20px;
    color: rgb(255, 255, 255);
    font-weight: 1000;
}

a[href="LastOrder.jsp"] {
    text-decoration: none;
    cursor: pointer;
    font-size: 20px;
    color: rgb(255, 255, 255);
    font-weight: 1000;
}



#banner {
    position: relative;
    display: flex;
    flex-direction: column;
    /* justify-content: center; */
    align-items: center;
    color: white;
    margin: 20px;
    margin-top: 0px;


}

#banner h1 {
    font-family: 'Arimo', sans-serif;
    font-size: 80px;
    color: white;
    font-weight: bolder;
    font-style: italic;
    margin: 20px;
    margin-bottom: 15px;

}

#banner p {
    font-family: 'Montserrat', sans-serif;
    font-size: 34px;
    color: white;
    text-align: center;
    margin: 10px;
    margin-bottom: 20px;
}

#banner input[type='text'] {
    width: 60%;
    height: 50px;
    margin: 10px;
    font-size: 15px;
    text-align: center;
    border-radius: 7px;
    border: none;
    font-family: 'Montserrat', sans-serif;
    font-size: 1.1rem;
}


main {
    padding: 20px;
}

section {
    margin-bottom: 30px;
}

h2 {
    color: #333;
}

.cart-item {
    display: flex;
    align-items: center;
    border-bottom: 1px solid #ccc;
    padding: 10px;
}

.cart-item img {
    width: 100px;
    height: 100px;
    margin-right: 20px;
}

.item-details {
    flex: 1;
}

.item-details h3 {
    margin-bottom: 5px;
}

.item-details p {
    margin: 5px 0;
}

#checkout {
    background-color: #fff;
    padding: 20px;
}

#checkout form {
    max-width: 500px;
    margin: 0 auto;
}

#checkout label {
    display: block;
    margin-bottom: 10px;
}

#checkout input[type="text"],
#checkout input[type="email"],
#checkout textarea {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

#checkout textarea {
    resize: none;
}

#checkout button {
    background-color: #333;
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
}

#checkout button:hover {
    background-color: #555;
}

.orders-button {
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: hsl(0, 0%, 96%);
            color: #000000;
            padding: 10px 20px;
            border:#f4f4f4;
            border-radius: 5px;
            cursor: pointer;
            font: 1.5em Arial, sans-serif;
        }

        .orders-button:hover {
            background-color: #d9d5d5;
        }

    </style>
</head>
<body>
    <header id="header">
        <nav class="navbar">
            <ul>
                <li> <a href="#"> Home </a> </li>
                <li> <a href="About.jsp"> About</a> </li>
                <li> <a href="Menu.jsp"> Menu</a> </li>
                <li> <a href="Cart.jsp">Cart</a></li>
                <li> <a href="LastOrder.jsp">Order</a></li>
                
                
            </ul>
        </nav>
        <div id="banner">
            <h1>FoodEase</h1>
            <p>"Hungry? food ease,instant releief!"</p>
        </div>
    </header>
    
    <main>
        <main>
            <section id="cart-items">
                <h2>Your Cart</h2>
                <div id="cart-items-container">
                    <!-- Cart items will be displayed here -->
                </div>
            </section>
        </main>
        
        <section id="checkout">
            <h2>Checkout</h2>
            <form>
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
                
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
                
                <label for="address">Address:</label>
                <textarea id="address" name="address" rows="4" required></textarea>
                
                <button type="submit">Place Order</button>
            </form>
        </section>
    </main>
    
    
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const cartContainer = document.getElementById('cart-items-container');

        // Function to render the cart items
        function renderCart() {
            cartContainer.innerHTML = ''; // Clear previous contents
            let cart = JSON.parse(localStorage.getItem('cart')) || [];

            cart.forEach(item => {
                const cartItem = document.createElement('div');
                cartItem.classList.add('cart-item');
                cartItem.innerHTML = `
                   
                    <div class="item-details">
                        <h3>${item.name}</h3>
                        <p>Price: ${item.price}</p>
                    </div>
                    <button class="remove-item">Remove</button>
                `;
                cartContainer.appendChild(cartItem);
            });
        }

        // Initial rendering of cart items
        renderCart();

        // Event listener to remove item from cart
        cartContainer.addEventListener('click', function(event) {
            if (event.target.classList.contains('remove-item')) {
                // Implement logic to remove item from cart
                const itemName = event.target.closest('.cart-item').querySelector('h3').textContent;
                let cart = JSON.parse(localStorage.getItem('cart')) || [];
                cart = cart.filter(item => item.name !== itemName);
                localStorage.setItem('cart', JSON.stringify(cart));
                // Render cart again
                renderCart();
            }
        });

        // Handling form submission
        const checkoutForm = document.querySelector('#checkout form');
        checkoutForm.addEventListener('submit', function(event) {
            event.preventDefault(); // Prevent default form submission

            // Get form data
            const formData = {
                name: document.getElementById('name').value,
                email: document.getElementById('email').value,
                address: document.getElementById('address').value
            };

            // Get cart items
            const cart = JSON.parse(localStorage.getItem('cart')) || [];

            // Create order object
            const order = {
                customer: formData,
                items: cart,
                date: new Date().toLocaleString()
            };

            // Store order details in local storage
            localStorage.setItem('lastOrder', JSON.stringify(order));

            // Display confirmation message
            alert('Order placed successfully! Thank you for your purchase.');
                localStorage.removeItem('cart'); // Clear cart
                renderCart(); // Render empty cart
            });

            // Event listener for "Orders" button click
            const ordersButton = document.getElementById('ordersButton');
            ordersButton.addEventListener('click', function() {
                // Redirect to LastOrder.html
                window.location.href = 'LastOrder.jsp';
            });
        });
</script>

    
</body>
</html>
