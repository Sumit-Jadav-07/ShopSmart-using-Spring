<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ page import="java.util.List" %>
    <%@ page import="com.bean.ProductBean" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href=" https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/customerdash.css">
</head>
<body>
    <nav>
        <div class="logo">
            <h1>Customer Dashboard</h1>
        </div>
        <div class="links">
            <a href="mycartpage">My Cart</a>
            <a href="logout">Log out</a>
        </div>
    </nav>

    <div class="main-container">
        <div class="product-dashboard">
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
                                <li><a href="addtocart?productId=<%= p.getProductId() %>"><i class="fas fa-shopping-cart"></i></a></li>
                                <li><a href="#"><i class="fas fa-heart"></i></a></li>
                                <li><a href="#"><i class="fas fa-plus"></i></a></li>
                                <li><a href="viewproduct?productId=<%= p.getProductId() %>"><i class="fas fa-eye"></i></a></li>
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
        </div>
    </div>
</body>

</html>