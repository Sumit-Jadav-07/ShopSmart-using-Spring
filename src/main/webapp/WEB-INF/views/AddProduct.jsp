<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/addproduct.css">
<title>Add New Product</title>
</head>
<body>
  <nav class="navbar">
    <div class="logo">
        <a href="homepage">E Commerce</a>
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
        <a onclick=hideSidebar() class="hamburger-menu" href="#"><svg xmlns="http://www.w3.org/2000/svg" height="35"
                viewBox="0 -960 960 960" width="35">
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

<div class="main_container">
    <div class="form_container">
        <div class="title">
            <h1>New Product</h1>
        </div>
        <form action="addProduct" method="post" enctype="multipart/form-data">
            <div class="product-details">
                <div class="input-box">
                    <span class="details">Product Name</span>
                    <input type="text" id="productName" name="productName">
                </div>

                <div class="input-box">
                    <span class="details">Category</span>
                    <input type="text" id="category" name="category">
                </div>

                <div class="input-box">
                    <span class="details">Price</span>
                    <input type="text" id="price" name="price">
                </div>

                <div class="input-box">
                    <span class="details">Quantity</span> <input type="text" id="quantity" name="quantity">
                </div>

                <div class="input-box">
                    <span class="details">Product Image</span>
                    <input type="file" id="productImage" name="productImage">
                </div>
            </div>

            <div class="button">
                <input type="submit" value="Add Product">
            </div>
        </form>
    </div>
</div>

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
</body>
</html>
