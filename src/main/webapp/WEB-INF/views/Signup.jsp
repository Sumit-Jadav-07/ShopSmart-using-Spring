<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/signup.css">
            <title>Registration Form</title>
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
                <form action="signUp" method="post">
                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">Full Name</span>
                            <input type="text" placeholder="Enter your name" name="fullname" value="${ecom.fullname}">
                            <span class="error-details">${fullnameError}</span>
                        </div>
                        <div class="input-box">
                            <span class="details">Email</span>
                            <input type="text" placeholder="Enter your email" name="email" value="${ecom.email}">
                            <span class="error-details">${emailError}</span>
                        </div>
                        <div class="input-box">
                            <span class="details">Password</span>
                            <input type="text" placeholder="Enter your password" name="password" value="${ecom.password}">
                            <span class="error-details">${passError}</span>
                        </div>
                        <div class="input-box">
                            <span class="details">Confirm Password</span>
                            <input type="text" placeholder="Confirm your password" name="confirmpassword" value="${ecom.confirmpassword}">
                            <span class="error-details">${cpassError}</span>
                        </div>
                    </div>
                    <div class="gender-details">
                        <input type="radio" name="gender" id="dot-1" value="Male">
                        <input type="radio" name="gender" id="dot-2" value="Female">
                        <input type="radio" name="gender" id="dot-3" value="Prefer not to say">
                        <span class="gender-title">Gender</span>
                        <div class="category">
                            <label for="dot-1">
                                <span class="dot one"></span>
                                <span class="gender">Male</span>
                            </label>
                            <label for="dot-2">
                                <span class="dot two"></span>
                                <span class="gender">Female</span>
                            </label>
                            <label for="dot-3">
                                <span class="dot three"></span>
                                <span class="gender">Prefer not to say</span>
                            </label>
                        </div>
                    </div>
                    <div class="button">
                        <input type="submit" value="Register">
                    </div>
                    <div class="login">
                        <p>Already have an account?</p>
                        <a href="loginpage">Login here</a>
                    </div>
                </form>
            </div>

            <script src="https://unpkg.com/typed.js@2.1.0/dist/typed.umd.js"></script>

            <!-- Setup and start animation! -->
            <script>
                var typed = new Typed('#element', {
                    strings: ['Registration'],
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