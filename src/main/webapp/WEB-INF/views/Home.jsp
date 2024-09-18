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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <title>ShopSmart</title>
</head>
<body>
    <nav class="navbar">
        <div class="logo">
            <a href="homepage">ShopSmart</a>
        </div>
        <div class="list-items">
            <a href="homepage" class="active" >Home</a>
            <a href="" >Shop</a>
            <a href="" >Blog</a>
            <a href="aboutuspage" >About us</a>
            <a href="aboutuspage" >Contact us</a>
            <a href="mycartpage"><i class="fa-solid fa-cart-shopping"></i></a>
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

    <div class="main-content">
        <% List<MobileBean> mobiles = (List<MobileBean>) request.getAttribute("mobiles"); %>
        <% List<LaptopBean> laptops = (List<LaptopBean>) request.getAttribute("laptops"); %>
        <% List<CameraBean> cameras = (List<CameraBean>) request.getAttribute("cameras"); %>
        <% List<SmartWatchBean> smartwatches = (List<SmartWatchBean>) request.getAttribute("smartwatches"); %>

        <section id="mobiles-section" class="section">
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
                                                <button class="card-button"><a href="addtocart?type=mobile&productId=<%= m.getMobileId() %>">Add to Cart</a></button>
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

        <section id="laptops-section" class="section">
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
                                                <button class="card-button"><a href="addtocart?type=laptop&productId=<%= l.getLaptopId() %>">Add to Cart</a></button>
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

        <section id="cameras-section" class="section">
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
                                                    <li><%= c.getResolution() %>MP</li>
                                                    <li><%= c.getZoom() %>X</li>
                                                    <li><%= c.getBattery() %> mAh</li>
                                                    <li><%= c.getBrand() %></li>
                                                </ul>
                                                <button class="card-button"><a href="addtocart?type=camera&productId=<%= c.getCameraId() %>">Add to Cart</a></button>
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
        
        <section id="smartwatches-section" class="section">
            <div class="sec-heading">
                <h1>Top Selling SmartWatches</h1>
            </div>
            <div class="carousel-container">
                <button class="carousel-arrow carousel-arrow--prev"><</button>
                        <div class="splide" id="product-carousel-4">
                            <div class="splide__track">
                                <ul class="splide__list">
                                    <% for (SmartWatchBean s : smartwatches) { %>
                                    <li class="splide__slide">
                                        <div class="card">
                                            <% if (s.getSmartWatchImagePath() == null || s.getSmartWatchImagePath().length() == 0) { %>
                                                <img src="images/noImageAvailable.jpg" alt="" class="card-image">
                                              <% } else { %>
                                                <img src="<%= s.getSmartWatchImagePath() %>"
                                               class="card-image" />
                                              <% } %>        
                                              <div class="card-content">
                                                <h2 class="card-title"><%= s.getName() %></h2>
                                                <p class="card-price"><%= s.getPrice() %></p>
                                                <ul class="card-specs">
                                                    <li><%= s.getDisplay() %></li>
                                                    <li><%= s.getFeatures() %></li>
                                                    <li><%= s.getBattery() %> mAh</li>
                                                    <li><%= s.getBrand() %></li>
                                                </ul>
                                                <button class="card-button"><a href="addtocart?type=smartwatch&productId=<%= s.getSmartWatchId() %>">Add to Cart</a></button>
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

    <footer>
        <div class="footer-container">
            <!-- Company Info and Logo -->
            <div class="footer-section about">
                <h3>ShopSmart</h3>
                <p>Your one-stop shop for Mobiles, Laptops, Smart Watches, and Cameras. We offer top-quality products at competitive prices with fast and reliable delivery.</p>
                <div class="social-media">
                    <a href="https://facebook.com"><i class="fab fa-facebook"></i> Facebook</a>
                    <a href="https://instagram.com"><i class="fab fa-instagram"></i> Instagram</a>
                    <a href="https://twitter.com"><i class="fab fa-twitter"></i> Twitter</a>
                </div>
            </div>
    
            <!-- Quick Links -->
            <div class="footer-section links">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="aboutuspage">About Us</a></li>
                    <li><a href="contactuspage">Contact Us</a></li>
                    <li><a href="faq.html">FAQ</a></li>
                    <li><a href="privacy-policy.html">Privacy Policy</a></li>
                    <li><a href="terms.html">Terms & Conditions</a></li>
                </ul>
            </div>
    
            <!-- Customer Service -->
            <div class="footer-section customer-service">
                <h3>Customer Service</h3>
                <ul>
                    <li><a href="returns.html">Returns & Refunds</a></li>
                    <li><a href="shipping.html">Shipping Info</a></li>
                    <li><a href="support.html">Support Center</a></li>
                    <li><a href="order-status.html">Track Your Order</a></li>
                </ul>
            </div>
    
            <!-- Contact Information -->
            <div class="footer-section contact-info">
                <h3>Contact Us</h3>
                <ul>
                    <li><i class="fas fa-map-marker-alt"></i> 123 ShopSmart St, Ahmedabad, India</li>
                    <li><i class="fas fa-phone"></i> +91 7016994734</li>
                    <li><i class="fas fa-envelope"></i> support@shopsmart.com</li>
                </ul>
            </div>
        </div>
    
        <!-- Copyright Section -->
        <div class="footer-bottom">
            <p>&copy; 2024 ShopSmart. All rights reserved.</p>
        </div>
    </footer>
    
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
            const carousels = ['#product-carousel-1', '#product-carousel-2', '#product-carousel-3','#product-carousel-4'];
            
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
