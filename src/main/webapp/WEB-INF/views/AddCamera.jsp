<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="ISO-8859-1">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AddMobile.css">
  <title>Add Camera</title>
</head>

<body>
  <!-- Navbar -->
  <nav class="navbar">
    <div class="logo">
      <a href="homepage">ShopSmart</a>
    </div>
    <div class="list-items">
      <a href="homepage">Home</a>
      <a href="">About us</a>
      <a href="">Products</a>
      <a href="">Blog</a>
    </div>
    <div class="hamburger-menu">
      <a onclick="showSidebar()" href="#"><svg xmlns="http://www.w3.org/2000/svg" height="35" viewBox="0 -960 960 960"
          width="35">
          <path d="M120-240v-80h720v80H120Zm0-200v-80h720v80H120Zm0-200v-80h720v80H120Z" />
        </svg></a>
    </div>
    <!-- Side Navbar -->
    <nav class="side-navbar">
      <a onclick="hideSidebar()" class="hamburger-menu" href="#"><svg xmlns="http://www.w3.org/2000/svg" height="35"
          viewBox="0 -960 960 960" width="35">
          <path
            d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-56 56-224-224-224 224Z" />
        </svg></a>
      <a href="homepage">Home</a>
      <a href="">About us</a>
      <a href="">Products</a>
      <a href="">Blog</a>
    </nav>
  </nav>

  <!-- Main Container -->
  <div class="main_container">
    <div class="form_container">
      <div class="title">
        <h1>Add Camera</h1>
      </div>
      <!-- Camera Form -->
      <form action="addcamera" method="post" class="product-form" enctype="multipart/form-data">
        <div class="input-group">
          <input type="text" id="cameraName" name="name" placeholder="Camera Name" required />
          <input type="text" id="cameraBrand" name="brand" placeholder="Brand" required />
        </div>
        <div class="input-group">
          <input type="number" id="cameraResolution" name="resolution" placeholder="Resolution (MP)" required />
          <input type="number" id="cameraZoom" name="zoom" placeholder="Zoom (x)" required />
        </div>
        <div class="input-group">
          <input type="text" id="cameraLens" name="lensType" placeholder="Lens Type" required />
          <input type="number" id="cameraBattery" name="battery" placeholder="Battery (mAh)" required />
        </div>
        <div class="input-group">
          <input type="number" id="cameraQuantity" name="quantity" placeholder="Quantity" required />
          <input type="number" id="cameraPrice" name="price" placeholder="Price" required />
        </div>
        <input type="file" id="cameraImage" name="cameraImage" accept="image/*" required />
        <button type="submit">Add Camera</button>
      </form>
    </div>
  </div>

  <script>
    function showSidebar() {
      const sidebar = document.querySelector(".side-navbar");
      sidebar.style.display = 'flex';
      setTimeout(() => {
        sidebar.style.transform = 'translateX(0%)';
      }, 10);
    }

    function hideSidebar() {
      const sidebar = document.querySelector(".side-navbar");
      sidebar.style.transform = 'translateX(100%)';
      setTimeout(() => {
        sidebar.style.display = 'none';
      }, 1000);
    }
  </script>
</body>

</html>
