<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AddMobile.css">
    <title>Add Mobile</title>
  </head>

  <body>
    <nav class="navbar">
      <div class="logo">
        <a href="homepage">ShopSmart</a>
      </div>
      <div class="list-items">
        <a href="homepage">Home</a>
        <a href="">About us </a>
        <a href="">Products</a>
        <a href="">Blog</a>
      </div>
      <div class="hamburger-menu">
        <a onclick=showSidebar() href="#"><svg xmlns="http://www.w3.org/2000/svg" height="35" viewBox="0 -960 960 960"
            width="35">
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
      </nav>
    </nav>

    <div class="main_container">
      <div class="form_container">
        <div class="title">
          <h1>Add Mobile</h1>
        </div>
        <form action="addMobile" method="post" class="product-form" enctype="multipart/form-data">
          <div class="input-group">
            <input type="text" id="mobileName" name="name" placeholder="Mobile Name" required />
            <input type="text" id="mobileBrand" name="brand" placeholder="Brand" required />
          </div>
          <div class="input-group">
            <input type="number" id="mobilePrice" name="ram" placeholder="Ram" required />
            <input type="number" id="mobileStorage" name="storage" placeholder="Storage (GB)" required />
          </div>
          <div class="input-group">
            <input type="number" id="mobileBattery" name="battery" placeholder="Battery (mAh)" required />
            <input type="number" id="mobileCamera" name="camera" placeholder="Camera (MP)" required />
          </div>
          <div class="input-group">
            <input type="number" id="mobilePrice" name="quantity" placeholder="Quantity" required />
            <input type="number" id="mobilePrice" name="price" placeholder="Price" required />
          </div>
          <input type="file" id="mobileImage" name="mobileImage"required />
          <button type="submit">Add Mobile</button>
        </form>
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