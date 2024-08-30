<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@latest/dist/css/splide.min.css" />
    <!-- Splide.js JS -->
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
            <a href="">About us </a>
            <a href="">Products</a>
            <a href="">Blog</a>
            <a href="loginpage">Log In</a>
        </div>
        <div class="hamburger-menu">
            <a onclick=showSidebar() href="#"><svg xmlns="http://www.w3.org/2000/svg" height="35" viewBox="0 -960 960 960" width="35">
                    <path d="M120-240v-80h720v80H120Zm0-200v-80h720v80H120Zm0-200v-80h720v80H120Z" />
                </svg></a>
        </div>
		<!-- Side Navbar -->
        <nav class="side-navbar">

            <a onclick=hideSidebar() class="hamburger-menu" href="#"><svg xmlns="http://www.w3.org/2000/svg" height="35" viewBox="0 -960 960 960" width="35"><path d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-56 56-224-224-224 224Z"/></svg></a>


            <a href="homepage">Home</a>
            <a href="">About us </a>
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
            <div class="carousel-container">
                <button class="carousel-arrow carousel-arrow--prev"><</button>
                <div class="splide" id="product-carousel">
                    <div class="splide__track">
                        <ul class="splide__list">
                            <!-- Slide 1 -->
                            <li class="splide__slide">
                                <div class="card">
                                    <img src="https://www.91-cdn.com/hub/wp-content/uploads/2023/10/iQOO-12-render.jpg"
                                        alt="SuperPhone X" class="card-image" />
                                    <div class="card-content">
                                        <h2 class="card-title">SuperPhone X</h2>
                                        <p class="card-price">$999.99</p>
                                        <ul class="card-specs">
                                            <li>8GB RAM</li>
                                            <li>256GB Storage</li>
                                            <li>Octa-core 2.8 GHz Processor</li>
                                            <li>4500mAh Battery</li>
                                        </ul>
                                        <button class="card-button">Add to Cart</button>
                                    </div>
                                </div>
                            </li>

                            <li class="splide__slide">
                                <div class="card">
                                    <img src="https://www.91-cdn.com/hub/wp-content/uploads/2023/10/iQOO-12-render.jpg"
                                        alt="SuperPhone X" class="card-image" />
                                    <div class="card-content">
                                        <h2 class="card-title">SuperPhone X</h2>
                                        <p class="card-price">$999.99</p>
                                        <ul class="card-specs">
                                            <li>8GB RAM</li>
                                            <li>256GB Storage</li>
                                            <li>Octa-core 2.8 GHz Processor</li>
                                            <li>4500mAh Battery</li>
                                        </ul>
                                        <button class="card-button">Add to Cart</button>
                                    </div>
                                </div>
                            </li>

                            <li class="splide__slide">
                                <div class="card">
                                    <img src="https://www.91-cdn.com/hub/wp-content/uploads/2023/10/iQOO-12-render.jpg"
                                        alt="SuperPhone X" class="card-image" />
                                    <div class="card-content">
                                        <h2 class="card-title">SuperPhone X</h2>
                                        <p class="card-price">$999.99</p>
                                        <ul class="card-specs">
                                            <li>8GB RAM</li>
                                            <li>256GB Storage</li>
                                            <li>Octa-core 2.8 GHz Processor</li>
                                            <li>4500mAh Battery</li>
                                        </ul>
                                        <button class="card-button">Add to Cart</button>
                                    </div>
                                </div>
                            </li>

                            <li class="splide__slide">
                                <div class="card">
                                    <img src="https://www.91-cdn.com/hub/wp-content/uploads/2023/10/iQOO-12-render.jpg"
                                        alt="SuperPhone X" class="card-image" />
                                    <div class="card-content">
                                        <h2 class="card-title">SuperPhone X</h2>
                                        <p class="card-price">$999.99</p>
                                        <ul class="card-specs">
                                            <li>8GB RAM</li>
                                            <li>256GB Storage</li>
                                            <li>Octa-core 2.8 GHz Processor</li>
                                            <li>4500mAh Battery</li>
                                        </ul>
                                        <button class="card-button">Add to Cart</button>
                                    </div>
                                </div>
                            </li>
                            <!-- Repeat for other slides -->
                        </ul>
                    </div>
                </div>
                <button class="carousel-arrow carousel-arrow--next">></button>
        </section>
    </div>

    <!-- <footer class="footer">
        <p>&copy; 2024 ShopSmart. All rights reserved.</p>
        <nav>
            <a href="#">Privacy Policy</a> |
            <a href="#">Terms of Service</a> |
            <a href="#">Contact Us</a>
        </nav>
    </footer> -->

</body>

<script>

    function showSidebar(){
        const sidebar = document.querySelector(".side-navbar");
        sidebar.style.display = 'flex';
        setTimeout(() => {
            sidebar.style.transform = 'translateX(0%)';
        },10)
    }
    function hideSidebar(){
        const sidebar = document.querySelector(".side-navbar");
        sidebar.style.transform = 'translateX(100%)';
        setTimeout(() => {
            sidebar.style.display = 'none';
        },1000)
    }

</script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var splide = new Splide('#product-carousel', {
            type: 'loop',
            perPage: 4,
            perMove: 1,
            pagination: false,
            arrows: false, // Disable default arrows
            gap: '1rem',
        });

        // Custom arrow functionality
        document.querySelector('.carousel-arrow--prev').addEventListener('click', function () {
            splide.go('<');
        });

        document.querySelector('.carousel-arrow--next').addEventListener('click', function () {
            splide.go('>');
        });

        splide.mount();
    });
</script>

</html>