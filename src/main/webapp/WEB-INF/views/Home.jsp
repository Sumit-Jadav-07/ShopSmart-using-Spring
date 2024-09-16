<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<%@ page import="com.bean.MobileBean"%>
<%@ page import="com.bean.LaptopBean"%>
<%@ page import="com.bean.CameraBean"%>
<%@ page import="com.bean.SmartWatchBean"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@4.1.4/dist/css/splide.min.css">
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
        <% List<MobileBean> mobiles = (List<MobileBean>) request.getAttribute("mobiles"); %>
        <% List<LaptopBean> laptops = (List<LaptopBean>) request.getAttribute("laptops"); %>
        <% List<CameraBean> cameras = (List<CameraBean>) request.getAttribute("cameras"); %>
        <% List<SmartWatchBean> smartwatches = (List<SmartWatchBean>) request.getAttribute("smartwatches"); %>
        <section class="section">
            <div class="sec-heading">
                <h1>Top Selling Mobiles</h1>
            </div>
            <div class="carousel-container">
                <button class="carousel-arrow carousel-arrow--prev"><</button>
                        <div class="splide" id="product-carousel-1">
                            <div class="splide__track">
                                <ul class="splide__list">
                                    <% for (MobileBean m : mobiles) { %>
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
                                    <% } %>
                                </ul>
                            </div>
                        </div>
                <button class="carousel-arrow carousel-arrow--next">></button>
            </div> 
        </section> 

        <section class="section">
            <div class="sec-heading">
                <h1>Top Selling Laptops</h1>
            </div>
            <div class="carousel-container">
                <button class="carousel-arrow carousel-arrow--prev"><</button>
                        <div class="splide" id="product-carousel-2">
                            <div class="splide__track">
                                <ul class="splide__list">
                                    <% for (LaptopBean l : laptops) { %>
                                    <li class="splide__slide">
                                        <div class="card">
                                            <% if (l.getLaptopImagePath() == null || l.getLaptopImagePath().length() == 0) { %>
                                                <img src="images/noImageAvailable.jpg" alt="" class="card-image">
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
                                                    <li><%= l.getProcessor() %></li>
                                                    <li><%= l.getBrand() %></li>
                                                </ul>
                                                <button class="card-button">Add to Cart</button>
                                            </div>
                                        </div>
                                    </li>
                                    <% } %>
                                </ul>
                            </div>
                        </div>
                <!-- Right Arrow -->
                <button class="carousel-arrow carousel-arrow--next">></button>
            </div>
        </section>

        <section class="section">
            <div class="sec-heading">
                <h1>Top Selling Cameras</h1>
            </div>
            <div class="carousel-container">
                <button class="carousel-arrow carousel-arrow--prev"><</button>
                        <div class="splide" id="product-carousel-3">
                            <div class="splide__track">
                                <ul class="splide__list">
                                    <% for (CameraBean c : cameras) { %>
                                    <li class="splide__slide">
                                        <div class="card">
                                            <% if (c.getCameraImagePath() == null || c.getCameraImagePath().length() == 0) { %>
                                                <img src="images/noImageAvailable.jpg" alt="" class="card-image">
                                              <% } else { %>
                                                <img src="<%= c.getCameraImagePath() %>"
                                               class="card-image" />
                                              <% } %>        
                                              <div class="card-content">
                                                <h2 class="card-title"><%= c.getName() %></h2>
                                                <p class="card-price"><%= c.getPrice() %></p>
                                                <ul class="card-specs">
                                                    <li><%= c.getResolution() %> MP</li>
                                                    <li><%= c.getZoom() %> X</li>
                                                    <li><%= c.getBattery() %> mAh</li>
                                                    <li><%= c.getBrand() %></li>
                                                </ul>
                                                <button class="card-button">Add to Cart</button>
                                            </div>
                                        </div>
                                    </li>
                                    <% } %>
                                </ul>
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

<script src="https://cdn.jsdelivr.net/npm/@splidejs/splide@4.1.4/dist/js/splide.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const carousels = ['#product-carousel-1', '#product-carousel-2', '#product-carousel-3'];
        
        carousels.forEach((selector, index) => {
            const splide = new Splide(selector, {
                type: 'loop',
                perPage: 4,
                perMove: 1,
                pagination: false,
                arrows: false,
                gap: '10px',
            }).mount();

            document.querySelectorAll('.carousel-arrow--prev')[index]?.addEventListener('click', () => splide.go('<'));
            document.querySelectorAll('.carousel-arrow--next')[index]?.addEventListener('click', () => splide.go('>'));
        });
    });
</script>
</body>
</html>
