<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.bean.ProductBean" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/viewproduct.css">
        <title>View Product Details</title>
    </head>

    <body>
        <nav class="navbar">
            <div class="logo">
                <a href="homepage">E Commerce</a>
            </div>
            <div class="list-items">
                <a href="homepage">Home</a>
                <a href="">About us </a>
                <a href="">Products</a>
                <a href="">Blog</a>
            </div>
            <div class="login">
                <a href="signuppage">Sign Up</a>
                <a href="loginpage">Log In</a>
            </div>
            <div class="hamburger-menu">
                <a onclick=showSidebar() href="#"><svg xmlns="http://www.w3.org/2000/svg" height="35"
                        viewBox="0 -960 960 960" width="35">
                        <path d="M120-240v-80h720v80H120Zm0-200v-80h720v80H120Zm0-200v-80h720v80H120Z" />
                    </svg></a>
            </div>
            <!-- Side Navbar -->
            <nav class="side-navbar">
                <a onclick=hideSidebar() class="hamburger-menu" href="#"><svg xmlns="http://www.w3.org/2000/svg"
                        height="35" viewBox="0 -960 960 960" width="35">
                        <path
                            d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-56 56-224-224-224 224Z" />
                    </svg></a>
                <a href="homepage">Home</a>
                <a href="">About us </a>
                <a href="">Products</a>
                <a href="">Blog</a>

                <a href="signuppage">Sign Up</a>
                <a href="loginpage">Log In</a>
            </nav>
        </nav>

        <div class="container">
            <div class="product-container">
                <% ProductBean product = (ProductBean) request.getAttribute("product"); %>
                <div class="product-title">
                    <h2>Product Details</h2>
                </div>

                <div class="product-details">
                    <span>Product Name : ${product.productName}</span>
                    <span>Category : ${product.category}</span>
                    <span>Price : ${product.price}</span>
                    <span>Quantity : ${product.quantity}</span>
                    <a href="customerdashboard">Back to Product List</a>
                </div>

                <div class="product-image">
                    <% if(product.getProductImagePath() == null || product.getProductImagePath().length() == 0) { %>
                        <img src="images/noImageAvailable.jpg">
                    <% } else { %>
                        <img src="${product.productImagePath}" alt="Product Image">
                    <% } %>
                </div>
            </div>
        </div>

        <script>

            function showSidebar() {
                const sidebar = document.querySelector(".side-navbar");
                sidebar.style.display = 'flex';
                setTimeout(() => {
                    sidebar.style.transform = 'translateX(0%)';
                }, 10)
            }
            function hideSidebar() {
                const sidebar = document.querySelector(".side-navbar");
                sidebar.style.transform = 'translateX(100%)';
                setTimeout(() => {
                    sidebar.style.display = 'none';
                }, 1000)
            }

        </script>
    </body>

    </html>