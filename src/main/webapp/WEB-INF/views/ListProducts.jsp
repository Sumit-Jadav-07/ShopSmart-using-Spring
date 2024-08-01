<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.List" %>
        <%@ page import="com.bean.ProductBean" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/listproduct.css">
                <title>Products List</title>
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

                    <div class="products-container">

                        <div class="title">
                            <h2>List Products</h2>
                            <a href="addproductpage">Add Product</a>
                        </div>

                        <div class="details">
                            <% List<ProductBean> products = (List<ProductBean>) request.getAttribute("products"); %>
                            <% if (products !=null && !products.isEmpty()) { %>
                                <table>
                                    <tr>
                                        <th>Product Name</th>
                                        <th>Image</th>
                                        <th>Price</th>
                                        <th>Action</th>
                                   </tr>

                                    <% for (ProductBean p : products) { %>
                                        <tr>
                                            <td>
                                                <%= p.getProductName() %>
                                            </td>
                                            <% if (p.getProductImagePath()==null ||
                                                p.getProductImagePath().length()==0) { %>
                                                <td><img src="images/noImageAvailable.png"></td>
                                            <% } else { %>
                                                <td><img src="<%=p.getProductImagePath()%>"></td>
                                            <% } %>
                                            <td>
                                                <%= p.getPrice() %>
                                            </td>
                                            <td>
                                                <div class="action-links">
                                                    <a href="viewproduct?productId=<%= p.getProductId() %>">View</a> |
                                                    <a href="editproductpage?productId=<%= p.getProductId() %>">Edit</a> |
                                                    <a href="deleteproduct?productId=<%= p.getProductId() %>" onclick="return confirm('Are you sure you want to delete this product?');">Delete</a>
                                                </div>
                                            </td>
                                        </tr>
                            <% } %>
                                </table>
                            <% } else { %>
                                <p>No products found.</p>
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