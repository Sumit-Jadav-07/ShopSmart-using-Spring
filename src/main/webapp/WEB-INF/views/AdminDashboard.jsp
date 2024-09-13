<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html lang="en">
    
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
            integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminDashboard.css">
        <title>Admin Dashboard</title>
    </head>
    
    <body>
        <div class="sidebar">
            <div class="logo">
                <h3>SHOPSMART</h3>
            </div>
            <ul class="main">
                <li class="active">
                    <a href="#">
                        <i class="fas fa-tachometer-alt"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li class="products">
                    <a href="#">
                        <i class="fas fa-box"></i>
                        <span>Products</span>
                        <i class="fas fa-chevron-down dropdown-icon"></i>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="addmobilepage">Add Mobile</a></li>
                        <li><a href="addlaptoppage">Add Laptop</a></li>
                        <li><a href="addcamerapage">Add Camera</a></li>
                        <li><a href="addsmartwatchpage">Add SmartWatch</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <i class="fas fa-shopping-cart"></i>
                        <span>Orders</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fas fa-users"></i>
                        <span>Customers</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fas fa-chart-bar"></i>
                        <span>Analytics</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fas fa-cog"></i>
                        <span>Settings</span>
                    </a>
                </li>
                <li class="logout">
                    <a href="#">
                        <i class="fas fa-sign-out-alt"></i>
                        <span>Logout</span>
                    </a>
                </li>
            </ul>
        </div>
    
        <div class="main--content">
            <div class="header--wrapper">
                <div class="header--title">
                    <span>Primary</span>
                    <h2>Dashboard</h2>
                </div>
                <div class="user--info">
                    <div class="search--box">
                        <i class="fas fa-search"></i>
                        <input type="text" placeholder="Search">
                    </div>
                    <img src="paper-bag-8557551_1280.webp" alt="">
                </div>
            </div>
    
            <div class="card--container">
                <div class="card--wrapper">
    
                    <div class="card">
                        <div class="card--logo">
                            <i class="fas fa-shopping-cart"></i>
                        </div>
                        <div class="card--body">
                            <h3>Today's Sale</h1>
                                <span>$500</span>
                        </div>
                    </div>
    
                    <div class="card">
                        <div class="card--logo">
                            <i class="fas fa-shopping-cart"></i>
                        </div>
                        <div class="card--body">
                            <h3>Today's Sale</h1>
                                <span>$500</span>
                        </div>
                    </div>
    
                    <div class="card">
                        <div class="card--logo">
                            <i class="fas fa-shopping-cart"></i>
                        </div>
                        <div class="card--body">
                            <h3>Today's Sale</h1>
                                <span>$500</span>
                        </div>
                    </div>
    
                    <div class="card">
                        <div class="card--logo">
                            <i class="fas fa-shopping-cart"></i>
                        </div>
                        <div class="card--body">
                            <h3>Today's Sale</h1>
                                <span>$500</span>
                        </div>
                    </div>
    
                </div>
            </div>
    
            <div class="tabular--wrapper">
                <h3 class="main--title">Customer Data</h3>
                <div class="table--container">
                    <table>
                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Transaction Type</th>
                                <th>Desctiption</th>
                                <th>Amount</th>
                                <th>Category</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        <tbody>
                            <tr>
                                <td>
                                    2023-01-01
                                </td>
                                <td>
                                    Expenses
                                </td>
                                <td>Office Supplies</td>
                                <td>$250</td>
                                <td>Office Expenses</td>
                                <td>Pending</td>
                                <td><button>Edit</button></td>
                            </tr>
    
                            <tr></tr>
                            <td>
                                2023-01-01
                            </td>
                            <td>
                                Expenses
                            </td>
                            <td>Office Supplies</td>
                            <td>$250</td>
                            <td>Office Expenses</td>
                            <td>Pending</td>
                            <td><button>Edit</button></td>
                            </tr>
    
                            <tr></tr>
                            <td>
                                2023-01-01
                            </td>
                            <td>
                                Expenses
                            </td>
                            <td>Office Supplies</td>
                            <td>$250</td>
                            <td>Office Expenses</td>
                            <td>Pending</td>
                            <td><button>Edit</button></td>
                            </tr>
    
                            <tr></tr>
                            <td>
                                2023-01-01
                            </td>
                            <td>
                                Expenses
                            </td>
                            <td>Office Supplies</td>
                            <td>$250</td>
                            <td>Office Expenses</td>
                            <td>Pending</td>
                            <td><button>Edit</button></td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="7">Total : $1000</td>
                            </tr>
                        </tfoot>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    
    </body>
    <!-- <script>
        document.querySelectorAll('.products > a').forEach(item => {
            item.addEventListener('click', (e) => {
                e.preventDefault();
                const dropdown = item.nextElementSibling;
                dropdown.style.display = dropdown.style.display === 'flex' ? 'none' : 'flex';
            });
        });
    
    </script> -->
    
    </html>