<%@ page import="com.bean.ProductBean" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>Products List</title>
  <style>
    table {
      border-collapse: collapse;
      width: 70%;
    }
    th, td {
      padding: 8px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }
    tr:nth-child(even) {
      background-color: #f2f2f2;
    }
    th {
      background-color: #4CAF50;
      color: white;
    }
    img {
      width: 100px;
      height: auto;
    }
  </style>
</head>

<body>
  <h2>List Products</h2>

  <br>
  <br>

  <% List<ProductBean> products = (List<ProductBean>) request.getAttribute("products"); %>

  <% if (products != null && !products.isEmpty()) { %>
    <table>
      <tr>
        <th>Product Name</th>
        <th>Image</th>
        <th>Price</th>
        <th>Action</th>
      </tr>

      <% for (ProductBean p : products) { %>
      <tr>
        <td><%= p.getProductName() %></td>
        <td><img src="<%= p.getProductImagePath() %>" alt="<%= p.getProductName() %>"></td>
        <td><%= p.getPrice() %></td>
        <td>
          <a href="addtocart?id=<%= p.getId() %>">Add to Cart</a>
        </td>
      </tr>
      <% } %>

    </table>
  <% } else { %>
    <p>No products found.</p>
  <% } %>

</body>

</html>
