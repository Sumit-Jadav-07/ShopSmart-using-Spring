<%@page import="com.bean.ProductBean"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Cart</title>
</head>
<body>
    <h2>My Cart</h2>

    <%
    List<ProductBean> products = (List<ProductBean>) request.getAttribute("products");
    Double price = 0.0;
    DecimalFormat df = new DecimalFormat("#.##");
    %>

    <form action="checkoutpage" method="post">
        <table border="1">
            <tr>
                <th>ProductId</th>
                <th>ProductName</th>
                <th>Image</th>
                <th>Price</th>
                <th>Action</th>
                <th>Quantity</th>
            </tr>
            <%
            for (ProductBean p : products) {
                out.print("<tr>");
                out.print("<td>" + p.getProductId() + "</td><td>" + p.getProductName() + "</td>");
                out.print("<td><img height='100px' width='100px' src='" + p.getProductImagePath() + "'/></td>");
                out.print("<td>" + p.getPrice() + "</td>");
                out.print("<td><a href='removecartitem?productId=" + p.getProductId() + "'>Remove</a></td>");
                out.print("<td>" + p.getQuantity() + "</td>");
                out.print("</tr>");
                price = price + (p.getPrice() * p.getQuantity());
            }
            %>
        </table>

        <br> Total Price: <%= df.format(price) %>
        <input type="hidden" name="totalPrice" value="<%= price %>"/>
        <br><br>
        <button type="submit">Checkout</button>
    </form>
</body>
</html>
