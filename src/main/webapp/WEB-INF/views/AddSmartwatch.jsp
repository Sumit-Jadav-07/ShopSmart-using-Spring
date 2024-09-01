<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AddMobile.css">
    <title>Add New Product</title>
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
          <h1>Add Smartwatch</h1>
        </div>
        <form action="addsmartwatch" method="post" enctype="multipart/form-data" class="product-form">

          <div class="input-group">
            <input type="text" id="watchName" name="name" placeholder="Watch Name" class="input-full-width" required />
            <input type="text" id="watchBrand" name="brand" placeholder="Watch Brand" class="input-full-width"
              required />
          </div>

          <div class="input-group">
            <input type="number" id="watchBattery" name="battery" placeholder="Watch Battery" class="input-full-width"
              required />
            <input type="text" id="watchFeatures" name="features" placeholder="Watch Features" class="input-full-width"
              required />
          </div>

          <div class="input-group">
            <input type="text" id="watchPrice" name="display" placeholder="Display Resolution" class="input-full-width"
              required />
            <input type="number" id="watchPrice" name="quantity" placeholder="Watch Quantity" class="input-full-width"
              required />
          </div>

          <div class="input-group">
            <input type="number" id="watchPrice" name="price" placeholder="Watch Price" class="input-full-width"
              required />
            <input type="file" id="watchImage" name="smartWatchImage" accept="image/*" required />
          </div>
          <button type="submit">Add SmartWatch</button>
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