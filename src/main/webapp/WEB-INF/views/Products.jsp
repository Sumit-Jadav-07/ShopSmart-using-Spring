<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Products.css">
      <title>Products</title>
    </head>

    <body>
      <!-- Header Section -->
      <nav class="navbar">
        <div class="logo">
          <a href="homepage">ShopSmart</a>
        </div>
        <div class="list-items">
          <a href="homepage">Home</a>
          <a href="aboutuspage">About us</a>
          <a href="">Products</a>
          <a href="">Blog</a>
          <a href="loginpage">Log In</a>
        </div>
        <div class="hamburger-menu">
          <a onclick="showSidebar()" href="#"><svg xmlns="http://www.w3.org/2000/svg" height="35"
              viewBox="0 -960 960 960" width="35">
              <path d="M120-240v-80h720v80H120Zm0-200v-80h720v80H120Zm0-200v-80h720v80H120Z" />
            </svg></a>
        </div>
        <!-- Side Navbar -->
        <nav class="side-navbar">
          <a onclick="hideSidebar()" class="hamburger-menu" href="#"><svg xmlns="http://www.w3.org/2000/svg" height="35"
              viewBox="0 -960 960 960" width="35">
              <path
                d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-56 56-224-224-224 224Z" />
            </svg></a>
          <a href="homepage">Home</a>
          <a href="">About us</a>
          <a href="">Products</a>
          <a href="">Blog</a>
          <a href="loginpage">Log In</a>
        </nav>
      </nav>
      <nav class="mini-navbar">
        <a href="#mobiles-section">Mobiles</a>
        <a href="#laptops-section">Laptops</a>
        <a href="#cameras-section">Cameras</a>
        <a href="#smartwatches-section">Smart Watch</a>
      </nav>
      
      <!-- Product Categories Section -->
      <section class="product-categories">
        <h2>Product Categories</h2>
        <ul>
          <li>
            <h3>Mobiles</h3>
            <p>Get the latest mobile phones from top brands</p>
            <a href="#">View All Mobiles</a>
          </li>
          <li>
            <h3>Laptops</h3>
            <p>Find the perfect laptop for work or play</p>
            <a href="#">View All Laptops</a>
          </li>
          <li>
            <h3>Cameras</h3>
            <p>Capture life's moments with our range of cameras</p>
            <a href="#">View All Cameras</a>
          </li>
          <li>
            <h3>Smartwatches</h3>
            <p>Stay connected and on top of your fitness goals</p>
            <a href="#">View All Smartwatches</a>
          </li>
        </ul>
      </section>

      <!-- Product Grid Section -->
      <section class="product-grid">
        <h2>Products</h2>
        <ul>
          <li>
            <img src="product1.png" alt="Product 1">
            <h3>Samsung Galaxy S22</h3>
            <p>$999</p>
            <p>Latest flagship mobile phone with advanced camera and performance</p>
          </li>
          <li>
            <img src="product2.png" alt="Product 2">
            <h3>Apple MacBook Air</h3>
            <p>$1,299</p>
            <p>Lightweight and powerful laptop for work and play</p>
          </li>
          <li>
            <img src="product3.png" alt="Product 3">
            <h3>Canon EOS 5D Mark IV</h3>
            <p>$3,499</p>
            <p>Professional-grade camera for capturing stunning images</p>
          </li>
          <li>
            <img src="product4.png" alt="Product 4">
            <h3>Apple Watch Series 7</h3>
            <p>$399</p>
            <p>Stay connected and track your fitness goals with this sleek smartwatch</p>
          </li>
        </ul>
      </section>

      <!-- Call-to-Action Section -->
      <section class="call-to-action">
        <h2>Explore More Products</h2>
        <button>View All Products</button>
      </section>

      <!-- Footer Section -->
      <footer>
        <p>&copy; 2024 ShopSmart. All rights reserved.</p>
        <ul>
          <li><a href="#">About Us</a></li>
          <li><a href="#">Contact Us</a></li>
          <li><a href="#">FAQ</a></li>
          <li><a href="#">Terms and Conditions</a></li>
        </ul>
      </footer>
    </body>

    </html>