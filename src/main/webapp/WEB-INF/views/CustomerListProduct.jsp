<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ page import="java.util.List" %>
    <%@ page import="com.bean.ProductBean" %>
      <!DOCTYPE html>
      <html>

      <head>
        <meta charset="UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href=" https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/customerlistproduct.css">
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
            <a onclick=hideSidebar() class="hamburger-menu" href="#"><svg xmlns="http://www.w3.org/2000/svg" height="35"
                viewBox="0 -960 960 960" width="35">
                <path
                  d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-56 56-224-224-224 224Z" />
              </svg></a>
            <a href="homepage">Home</a>
            <a href="">About us </a>
            <a href="">Products</a>
            <a href="">Blog</a>

            <!-- <a href="signuppage">Sign Up</a> -->
            <a href="logout">Log Out</a>
          </nav>
        </nav>

        <div class="container">

          <div class="products-container">
            <% List<ProductBean> products = (List<ProductBean>) request.getAttribute("products"); %>
                <section class="section-products">
                  <div class="container">
                    <div class="row justify-content-center text-center">
                      <div class="col-md-8 col-lg-6">
                        <div class="header">
                          <h3>Featured Product</h3>
                          <h2>Popular Products</h2>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <% for (ProductBean p : products) { %>
                        <div class="col-md-6 col-lg-4 col-xl-3">
                          <div id="product-1" class="single-product">
                            <div class="part-1">
                              <% if (p.getProductImagePath() == null || p.getProductImagePath().length() == 0) { %>
                                <img src="images/noImageAvailable.png" alt="">
                              <% } else { %>
                                <img src="<%= p.getProductImagePath() %>" alt="">
                              <% } %>
                              <ul>
                                <li><a href="addtocart?id=<%= p.getId() %>"><i class="fas fa-shopping-cart"></i></a></li>
                                <li><a href="#"><i class="fas fa-heart"></i></a></li>
                                <li><a href="#"><i class="fas fa-plus"></i></a></li>
                                <li><a href="viewproduct?id=<%= p.getId() %>"><i class="fas fa-eye"></i></a></li>
                              </ul>
                            </div>
                            <div class="part-2">
                              <h3 class="product-title">
                                <%= p.getProductName() %>
                              </h3>
                              <h4 class="product-old-price">
                                <%= p.getPrice() * 0.05 + p.getPrice() %>
                              </h4>
                              <h4 class="product-price">
                                <%= p.getPrice() %>
                              </h4>
                            </div>
                          </div>
                        </div>
                      <% } %>
                    </div>
                  </div>
                </section>


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