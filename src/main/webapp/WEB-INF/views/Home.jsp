<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
    <title>E Commerce Website </title>
</head>
<body>
    <!-- Navbar -->
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


            <a href="signuppage">Sign Up</a>
            <a href="loginpage">Log In</a>

        </nav>

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
</html>