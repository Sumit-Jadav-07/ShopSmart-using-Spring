<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/forgetpassword.css">
            <title>Search Email</title>
        </head>
        <style>
            /* Global styles */
            body {
                margin: 0;
                padding: 0;
                font-family: sans-serif;
                /* Choose a readable font family */
                background-color: #f0f0f0;
                /* Light gray background */
                color: #333;
                /* Dark text for contrast */
            }

            /* Header styles */
            header {
                display: flex;
                /* Arrange header elements horizontally */
                justify-content: space-between;
                /* Space elements evenly */
                align-items: center;
                /* Align vertically */
                padding: 1rem;
                /* Add some padding for breathing room */
                background-color: #fff;
                /* White background for header */
                box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
                /* Subtle shadow */
            }

            h1 {
                font-size: 1.5rem;
                /* Adjust heading size as needed */
                margin: 0;
                /* Remove default margin */
            }

            /* Navigation styles */
            nav {
                display: flex;
                list-style: none;
                /* Remove bullet points for links */
                padding: 0;
                margin: 0;
            }

            nav a {
                padding: 0.5rem 1rem;
                /* Add some padding for clickable area */
                text-decoration: none;
                /* Remove underline */
                color: inherit;
                /* Use the same color as the body text */
                transition: color 0.2s ease-in-out;
                /* Smooth color transition on hover */
            }

            nav a:hover {
                color: #007bff;
                /* Blue highlight on hover */
            }

            /* Content area styles */
            main {
                padding: 1rem;
                margin: 0 auto;
                /* Center content horizontally */
                max-width: 800px;
                /* Limit content width for better responsiveness */
            }
        </style>

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
                <div class="login">
                    <a href="signuppage">Sign Up</a>
                    <a href="loginpage">Log In</a>
                </div>
                <div class="hamburger-menu">
                    <a onclick=showSidebar() href="#"><svg xmlns="http://www.w3.org/2000/svg" height="35"
                            viewBox="0 -960 960 960" width="35">
                            <path d="M120-240v-80h720v80H120Zm0-200v-80h720v80H120Zm0-200v-80h720v80H120Z" />
                        </svg></a>
                </div>
                <!-- Side Navbar -->
                <nav class="side-navbar">

                    <a onclick=hideSidebar() class="hamburger-menu" href="#"><svg xmlns="http://www.w3.org/2000/svg"
                            height="35" viewBox="0 -960 960 960" width="35">
                            <path
                                d="m256-200-56-56 224-224-224-224 56-56 224 224 224-224 56 56-224 224 224 224-56 56-224-224-224 224Z" />
                        </svg></a>


                    <a href="homepage">Home</a>
                    <a href="">About us </a>
                    <a href="">Products</a>
                    <a href="">Blog</a>


                    <a href="signuppage">Sign Up</a>
                    <a href="loginpage">Log In</a>

                </nav>
            </nav>

            <div class="container">

                <div class="title"><span id="element"></span></div>
                <form action="sendotp" method="post">

                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">Email-Id</span>
                            <input type="text" placeholder="Enter your email" name="email" value="${rEmail}">
                            <span class="error-details">${emailError}</span>
                            <input type="hidden" name="oldotp" value="${oldOtp}">
                        </div>
                    </div>
                    <div class="button">
                        <input type="submit" value="Search">
                    </div>

                </form>

            </div>

            <script src="https://unpkg.com/typed.js@2.1.0/dist/typed.umd.js"></script>

            <!-- Setup and start animation! -->
            <script>
                var typed = new Typed('#element', {
                    strings: ['Forget Password'],
                    typeSpeed: 50,
                });

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