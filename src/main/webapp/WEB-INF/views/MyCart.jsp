<%@page import="com.bean.ProductBean"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mycart.css">
<title>My Cart</title>
</head>
<body>
    <nav>
        <div class="logo">
            <h1>My Cart</h1>
        </div>
        <div class="links">
            <a href="customerdashboard">Your Dashboard</a>
        </div>
    </nav>

    <div class="main-container">
        <div class="cart-container">
            <%
                List<ProductBean> products = (List<ProductBean>) request.getAttribute("products");
                Double total_product_price = 0.0;
                Double total_price = 0.0;
                DecimalFormat df = new DecimalFormat("#.##");
            %>
            <form action="checkoutpage" method="post">
                <%
                    for (ProductBean p : products) {
                        total_product_price = p.getPrice().doubleValue() * p.getQuantity();
                        total_price += total_product_price;
                %>
                <div class="cart-item">
                    <div class="cart-img">
                        <img src="<%= p.getProductImagePath() %>" alt="" width="100px" height="100px">
                    </div>
                    <div class="product-details">
                        <div class="c1">
                            <h1><%= p.getProductName() %></h1>
                            <a href="decreasequantity?type=<%= p.getType()%>&productId=<%= p.getProductId() %>"><button type="button">-</button></a>
                            <span><%= p.getQuantity() %></span>
                            <a href="increasequantity?type=<%= p.getType()%>&productId=<%= p.getProductId() %>"><button type="button">+</button></a>
                        </div>
                        <div class="price">
                            <p>&#x20b9;<%= p.getPrice() %></p>
                        </div>
                    </div>
                    <div class="product-price">
                        <div class="c2">
                            <a href="removecartitem?type=<%= p.getType()%>&productId=<%= p.getProductId() %>"><button type="button">x</button></a>
                            <p>&#x20b9;<%= df.format(total_product_price) %></p>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
                <div class="price-container">
                    <div class="total-price">
                        Total Price : &#x20b9;<%= df.format(total_price) %>
                    </div>
                    <input type="hidden" name="totalPrice" value="<%= total_price %>"/>
                    <button type="submit">Checkout</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
