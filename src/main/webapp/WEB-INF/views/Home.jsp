<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<%@ page import="com.bean.MobileBean"%>
<%@ page import="com.bean.LaptopBean"%>
<%@ page import="com.bean.MasterProduct"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@latest/dist/css/splide.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/@splidejs/splide@latest/dist/js/splide.min.js" defer></script>
    <title>ShopSmart</title>
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
            <a onclick="showSidebar()" href="#"><svg xmlns="http://www.w3.org/2000/svg" height="35" viewBox="0 -960 960 960" width="35">
                <path d="M120-240v-80h720v80H120Zm0-200v-80h720v80H120Zm0-200v-80h720v80H120Z" />
            </svg></a>
        </div>
        <!-- Side Navbar -->
        <nav class="side-navbar">
            <a onclick="hideSidebar()" class="hamburger-menu" href="#"><svg xmlns="http://www.w3.org/2000/svg" height="35" viewBox="0 -960 960 960" width="35">
                <path d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-56 56-224-224-224 224Z" />
            </svg></a>
            <a href="homepage">Home</a>
            <a href="">About us</a>
            <a href="">Products</a>
            <a href="">Blog</a>
            <a href="loginpage">Log In</a>
        </nav>
    </nav>
    <nav class="mini-navbar">
        <a href="">Mobiles</a>
        <a href="">Smart Watch</a>
        <a href="">Laptops</a>
        <a href="">Cameras</a>
    </nav>
    <div class="main-content">
        <section class="section">
            <div class="sec-heading">
                <h1>Top Selling</h1>
            </div>
            <% List<MobileBean> mobiles = (List<MobileBean>) request.getAttribute("mobiles"); %>
            <div class="carousel-container">
                <!-- Left Arrow -->
                <button class="carousel-arrow carousel-arrow--prev"><</button>
                        <!-- First Carousel -->
                        <div class="splide" id="product-carousel-1">
                            <div class="splide__track">
                                <% for (MobileBean m : mobiles) { %>
                                <ul class="splide__list">
                                    <li class="splide__slide">
                                        <div class="card">
                                            <% if (m.getMobileImagePath() == null || m.getMobileImagePath().length() == 0) { %>
                                                <img src="images/noImageAvailable.jpg" alt="" class="card-image" width="100px" height="100px" >
                                              <% } else { %>
                                                <img src="<%= m.getMobileImagePath() %>"
                                               class="card-image" />
                                              <% } %>        
                                              <div class="card-content">
                                                <h2 class="card-title"><%= m.getName() %></h2>
                                                <p class="card-price"><%= m.getPrice() %></p>
                                                <ul class="card-specs">
                                                    <li><%= m.getRam() %> GB RAM</li>
                                                    <li><%= m.getStorage() %> GB Storage</li>
                                                    <li><%= m.getBattery() %> mAh</li>
                                                    <li><%= m.getBrand() %></li>
                                                </ul>
                                                <button class="card-button">Add to Cart</button>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                                <% } %>
                            </div>
                        </div>
                <!-- Right Arrow -->
                <button class="carousel-arrow carousel-arrow--next">></button>
            </div>
        </section>

        <!-- Second Carousel -->
        <section class="section">
            <div class="sec-heading">
                <h1>Top Selling</h1>
            </div>
            <% List<LaptopBean> laptops = (List<LaptopBean>) request.getAttribute("laptops"); %>
            <div class="carousel-container">
                <!-- Left Arrow -->
                <button class="carousel-arrow carousel-arrow--prev"><</button>
                        <div class="splide" id="product-carousel-2">
                            <div class="splide__track">
                                <% for (LaptopBean l : laptops) { %>
                                <ul class="splide__list">
                                    <li class="splide__slide">
                                        <div class="card">
                                            <% if (l.getLaptopImagePath() == null || l.getLaptopImagePath().length() == 0) { %>
                                                <img src="images/noImageAvailable.png" alt="" class="card-image" >
                                              <% } else { %>
                                                <img src="<%= l.getLaptopImagePath() %>"
                                               class="card-image" />
                                              <% } %>        
                                              <div class="card-content">
                                                <h2 class="card-title"><%= l.getName() %></h2>
                                                <p class="card-price"><%= l.getPrice() %></p>
                                                <ul class="card-specs">
                                                    <li><%= l.getRam() %> GB RAM</li>
                                                    <li><%= l.getStorage() %> GB Storage</li>
                                                    <li><%= l.getProcessor() %> </li>
                                                    <li><%= l.getBrand() %></li>
                                                </ul>
                                                <button class="card-button">Add to Cart</button>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                                <% } %>
                            </div>
                        </div>
                <!-- Right Arrow -->
                <button class="carousel-arrow carousel-arrow--next">></button>
            </div>
        </section>
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
    <script>
        document.addEventListener('DOMContentLoaded', function () {

        // Initialize the Splide instances (moved inside the event listener)
        const splide1 = new Splide('#product-carousel-1', {
        type: 'loop',
        perPage: 4,
        perMove: 1,
        pagination: false,
        arrows: false,
        gap: '1rem',
        }).mount();

        // Connect custom arrows to the first carousel
        document.querySelector('.carousel-arrow--prev').addEventListener('click', function () {
                splide1.go('<');
            });
        document.querySelector('.carousel-arrow--next').addEventListener('click', function () {
                splide1.go('>');
            });

        const splide2 = new Splide('#product-carousel-2', {
        type: 'loop',
        perPage: 4,
        perMove: 1,
        pagination: false,
        arrows: false,
        gap: '1rem',
        }).mount();

        // Connect custom arrows to the first carousel
        document.querySelector('.carousel-arrow--prev').addEventListener('click', function () {
                splide2.go('<');
            });
        document.querySelector('.carousel-arrow--next').addEventListener('click', function () {
                splide2.go('>');
            });
        });
      </script>
</body>
</html>