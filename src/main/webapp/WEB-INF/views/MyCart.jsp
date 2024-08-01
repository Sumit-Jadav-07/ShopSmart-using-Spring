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
            <a href="logout">Log Out</a>
        </div>
    </nav>

    <div class="main-container">
        <div class="cart-container">
            <%
                List<ProductBean> products = (List<ProductBean>) request.getAttribute("products");
                Double price = 0.0;
                DecimalFormat df = new DecimalFormat("#.##");
            %>

            <form action="checkoutpage" method="post">
                <table>
                    <tr>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Image</th>
                        <th>Price</th>
                        <th>Action</th>
                        <th>Quantity</th>
                    </tr>
                    <%
                        for (ProductBean p : products) {
                            out.print("<tr>");
                            out.print("<td>" + p.getProductId() + "</td>");
                            out.print("<td>" + p.getProductName() + "</td>");
                            out.print("<td style='width: 200px; height: 100px;'><img src='" + p.getProductImagePath() + "'/></td>");
                            out.print("<td>" + p.getPrice() + "</td>");
                            out.print("<td><a href='removecartitem?productId=" + p.getProductId() + "'>Remove</a></td>");
                            out.print("<td>");
                            out.print("<div class='quantity-buttons'>");
                            out.print("<a href='decreasequantity?productId=" + p.getProductId() + "'>-</a>");
                            out.print(p.getQuantity());
                            out.print("<a href='increasequantity?productId=" + p.getProductId() + "'>+</a>");
                            out.print("</div>");
                            out.print("</td>");
                            out.print("</tr>");
                            price += p.getPrice() * p.getQuantity();
                        }
                    %>
                </table>

                <div class="total-price">
                    Total Price: <%= df.format(price) %>
                </div>
                <input type="hidden" name="totalPrice" value="<%= price %>"/>
                <button type="submit">Checkout</button>
            </form>
        </div>
    </div>
</body>
</html>
