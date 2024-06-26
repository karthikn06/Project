<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Last Order</title>
    <style>
        
         
         body {
     font-family: Arial, sans-serif;
     background-color: #f4f4f4;
 }

 #header {
    display: flex;
    box-sizing: border-box;
    flex-direction: column;
    align-items: center;
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

a[href="index.html"] {
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

 
 .container {
     max-width: 600px;
     margin: 0 auto;
     padding: 20px;
     background-color: #fff;
     border-radius: 8px;
     box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
 }
 
 h1 {
     text-align: center;
 }
 
 #lastOrder {
     margin-top: 20px;
 }
 
    </style>
</head>
<body>
    
    <header id="header">
        <nav class="navbar">
            <ul>
                <li> <a href="index.html"> Home </a> </li>
                <li> <a href="About.jsp"> About</a> </li>
                <li> <a href="Menu.jsp"> Menu</a> </li>
                <li> <a href="Cart.jsp">Cart</a></li>
                <li> <a href="LastOrder.jsp">Order</a></li>
                
                
            </ul>
        </nav>
        <div id="banner">
            <h1>FoodEase</h1>
            <p>"Hungry? food ease,instant relief!"</p>
        </div>
    </header>
    <div class="container">
        <h1>Last Order</h1>
        <div id="lastOrder"></div>
    </div>

    <script>
        window.onload = function() {
            displayLastOrder();
        };

        function displayLastOrder() {
            const lastOrderElement = document.getElementById('lastOrder');
            const lastOrder = JSON.parse(localStorage.getItem('lastOrder'));

            if (!lastOrder) {
                lastOrderElement.innerHTML = '<p>No last order found.</p>';
                return;
            }

            const orderDetails = `
                <h2>Order Details</h2>
                <p><strong>Name:</strong> ${lastOrder.customer.name}</p>
                <p><strong>Email:</strong> ${lastOrder.customer.email}</p>
                <p><strong>Address:</strong> ${lastOrder.customer.address}</p>
                <p><strong>Date:</strong> ${lastOrder.date}</p>
                <h2>Ordered Items</h2>
                <ul>
                <c:forEach var="item" items="${lastOrder.items}">
                <li>${item.name} - ${item.price}</li>
            </c:forEach>
                </ul>
            `;
            lastOrderElement.innerHTML = orderDetails;
        }
    </script>
</body>
</html>
