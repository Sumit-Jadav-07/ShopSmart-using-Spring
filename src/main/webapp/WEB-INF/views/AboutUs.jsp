<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - ShopSmart</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AboutUs.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  </head>

  <body>

    <nav class="navbar">
      <div class="logo">
        <a href="homepage">ShopSmart</a>
      </div>
      <div class="list-items">
        <a href="homepage">Home</a>
        <a href="">About us</a>
        <a href="">Products</a>
        <a href="">Blog</a>
        <a href="loginpage">Log In</a>
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
        <a href="loginpage">Log In</a>
      </nav>
    </nav>

    <div class="about-us">
      <div class="about-header">
        <h1>About Us</h1>
      </div>
      <div class="about-content">
        <p>At ShopSmart, we believe that shopping should be convenient, affordable, and fun. We started our journey in
          [Year], and since then, we have been committed to delivering the best online shopping experience for our
          customers.</p>

        <p>Our mission is simple: to offer a wide selection of high-quality products at competitive prices, with a
          seamless shopping experience. Whether you're looking for the latest tech gadgets, fashion items, or home
          essentials, ShopSmart is your go-to destination.</p>

        <p>We value our customers, and their satisfaction is our top priority. Our dedicated team works tirelessly to
          ensure that every product you receive meets your expectations. We’re always here to help, from the moment you
          browse to the moment you unbox your purchase.</p>

        <p>Thank you for choosing ShopSmart as your trusted shopping partner. We’re excited to continue growing with you
          and making your shopping experience better every day.</p>
      </div>

      <div class="our-values">
        <h2>Our Values</h2>
        <ul>
          <li><i class="fas fa-check"></i> Customer-centric: We put our customers at the heart of everything we do.</li>
          <li><i class="fas fa-check"></i> Quality products: We ensure that our products are of the highest quality.</li>
          <li><i class="fas fa-check"></i> Affordability: We believe in making quality products accessible to everyone.</li>
          <li><i class="fas fa-check"></i> Innovation: We continuously improve our platform to make shopping easier and more enjoyable.</li>
          <li><i class="fas fa-check"></i> Trust: We build long-lasting relationships with our customers based on trust and transparency.</li>
        </ul>
      </div>

      <div class="team-section">
        <h2>Meet Our Team</h2>
        <div class="team-members">
          <div class="team-member">
            <img src="team1.jpg" alt="Team Member 1">
            <h3>Sumit Jadav</h3>
            <p>Founder & CEO</p>
          </div>
          <div class="team-member">
            <img src="team2.jpg" alt="Team Member 2">
            <h3>John Doe</h3>
            <p>Chief Marketing Officer</p>
          </div>
          <div class="team-member">
            <img src="team3.jpg" alt="Team Member 3">
            <h3>Jane Smith</h3>
            <p>Head of Product Development</p>
          </div>
        </div>
      </div>
    </div>

    <div class="footer">
      <p>&copy; 2024 ShopSmart. All rights reserved.</p>
      <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a>
    </div>

  </body>
  </html>