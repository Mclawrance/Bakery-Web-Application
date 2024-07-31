<%-- 
    Document   : ingredient
    Created on : Jun 14, 2023, 3:26:02 PM
    Author     : Train
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="com.techgiants.topiefor.model.User"%>
<%@page import="com.techgiants.topiefor.model.Unit"%>
<%@page import="java.util.List"%>
<%@page import="com.techgiants.topiefor.model.Ingredient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Ingredients</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="Styles/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="Styles/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="Styles/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="Styles/css/style.css" rel="stylesheet">
    </head>

    <style>
        body {
            background-color: #ECECEC;
            font-family: 'Nunito', sans-serif;
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .popup {
            display: none;
            position: fixed;
            z-index: 9999;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .popup.active {
            display: block;
            opacity: 1;
        }

        .popup-content {
            background-color: #fff;
            max-width: 400px;
            margin: 100px auto;
            padding: 20px;
            border-radius: 5px;
            position: relative;
            opacity: 0;
            transform: translateY(-20px);
            transition: opacity 0.3s ease, transform 0.3s ease;
            animation: popupAnimation 0.7s ease;
        }

        .popup.active .popup-content {
            opacity: 1;
            transform: translateY(0);
        }
        .popup1 {
            display: none;
            position: fixed;
            z-index: 9999;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .popup1.active {
            display: block;
            opacity: 1;
        }

        .popup-content1 {
            background-color: #fff;
            max-width: 400px;
            margin: 100px auto;
            padding: 20px;
            border-radius: 5px;
            position: relative;
            opacity: 0;
            transform: translateY(-20px);
            transition: opacity 0.3s ease, transform 0.3s ease;
            animation: popupAnimation 0.7s ease;
        }

        .popup1.active .popup-content1 {
            opacity: 1;
            transform: translateY(0);
        }

        .close {
            position: absolute;
            top: 10px;
            right: 10px;
            cursor: pointer;
        }
        form {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            margin-top: 5px;
            font-weight: bold;
        }

        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            /*margin-top: 20px;*/
        }

        input[type="submit"] {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #de6900;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
        }
        @keyframes popupAnimation {
            0% {
                opacity: 0;
                transform: scale(0.3);
            }
            100% {
                opacity: 1;
                transform: scale(1);
            }
        }
        #cate{
            display: none;
        }
    </style>

    <body>
        <div class="container-fluid position-relative d-flex p-0">
            <!-- Spinner Start -->
            <div id="spinner" class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
            <!-- Spinner End -->


            <!-- Sidebar Start -->
            <div class="sidebar pe-4 pb-3">
                <nav class="navbar bg-secondary navbar-dark">
                    <a href="#" class="navbar-brand mx-4 mb-3">
                        <h3 class="text-primary"><i class="fa fa-user-edit me-2"></i>Admin</h3>
                    </a>



                    <div class="navbar-nav w-100">
                        <a href="asAdmin.jsp" class="nav-item nav-link active"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>


                        <a href="service?service=admin&process=all-products" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Products</a>

                        <a href="service?service=admin&process=all-categories" class="nav-item nav-link"><i class="fa fa-laptop me-2"></i>Categories</a>

                        <a href="service?service=admin&process=all-orders" class="nav-item nav-link"><i class="fa fa-laptop me-2"></i>Orders</a>

                        <a href="service?service=admin&process=all-ingredients" class="nav-item nav-link"><i class="fa fa-laptop me-2"></i>Ingredients</a>

                        <a href="service?service=admin&process=all-ingredient-orders" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Ingredient Order</a>


                    </div>
                </nav>
            </div>
            <!-- Sidebar End -->


            <!-- Content Start -->
            <div class="content">

                <!-- Navbar Start -->
                <nav class="navbar navbar-expand bg-secondary navbar-dark sticky-top px-4 py-0">
                    <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                        <h2 class="text-primary mb-0"><i class="fa fa-user-edit"></i></h2>
                    </a>


                    <div class="navbar-nav align-items-center ms-auto">


                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <img   alt="" style="width: 40px; height: 40px;">
                                <%
                                    User user = (User) session.getAttribute("user");
                                %>
                                <span class="d-none d-lg-inline-flex"><%= user != null ? user.getName() + " " + user.getSurname() : "No Name"%></span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
                                <a href="service?service=client&process=logout" class="dropdown-item">Log Out</a>
                                <a href="index.jsp" class="dropdown-item">As Customer</a>
                            </div>
                        </div>
                    </div>
                </nav>
                <!-- Navbar End -->


                <!-- Sale & Revenue Start -->
<!--                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <div class="col-sm-6 col-xl-3">
                            <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                                <i class="fa fa-chart-line fa-3x text-primary"></i>
                                <div class="ms-3">
                                    <p class="mb-2">Today Sale</p>
                                    <h6 class="mb-0">R1,234</h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xl-3">
                            <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                                <i class="fa fa-chart-bar fa-3x text-primary"></i>
                                <div class="ms-3">
                                    <p class="mb-2">Total Sale</p>
                                    <h6 class="mb-0">R1,234</h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xl-3">
                            <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                                <i class="fa fa-chart-area fa-3x text-primary"></i>
                                <div class="ms-3">
                                    <p class="mb-2">Today Revenue</p>
                                    <h6 class="mb-0">R1,234</h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xl-3">
                            <div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
                                <i class="fa fa-chart-pie fa-3x text-primary"></i>
                                <div class="ms-3">
                                    <p class="mb-2">Total Revenue</p>
                                    <h6 class="mb-0">R1,234</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>-->
                <!-- Sale & Revenue End -->


                <div id="popup" class="popup">
                    <div class="popup-content">
                        <span class="close" onclick="closePopup()">&times;</span>
                        <h3>Update Ingredients</h3>
                        <form action="service" method="POST">
                            <centre>
                                <input type ="hidden" id = "pro" name="process"value ="update-ingredient">
                                <input type ="hidden" id = "pro" name="service"value ="admin">
                            </centre>


                            <!--                            <label for="ingredient-id">Ingredient ID:</label>-->
                            <input type="hidden" id="ingredId" name="id" required readonly />

                            <!--                            <label for="ingredient-name">Name:</label> -->
                            <input type="hidden" id="ingred-name" name="ingred-name" required readonly>


                            <input type="hidden" id="stock" name="stock" required />

                            <label for="mimimum-stock">Minimum Stock:</label>
                            <input type="number" step="any" id="minimum-stock" name="min-stock" required>
                            <input type="hidden" id="cate" name="unit">


                            <input type="hidden" id="is-active" required name="is-active">

                            <input type="submit" value="Update Ingredients">
                        </form>
                    </div>
                </div>
                <div id="popup1" class="popup1">
                    <div class="popup-content1">
                        <span class="close" onclick="closePopup1()">&times;</span>
                        <h3>Adding Ingredient</h3>
                        <form action="service">
                            <centre>
                                <input type ="hidden" id = "pro" name="process"value ="add-ingredient">
                                <input type ="hidden" id = "pro" name="service"value ="admin">
                            </centre>


                            <label for="ingredient-name">Name:</label>
                            <input type="text" name="ingred-name"  required />

                            <label for="minimum stock">Minimum Stock:</label>
                            <input type="number"  name="min-stock" required />         

                            <label for="unit">Select Unit:</label>
                            <div class="input_box">
                                <select id="category" name="unit">
                                    <% int cnt = 0;
                                        for (Unit unit : Unit.values()) {%>
                                    <option value="<%= cnt%>"><%= unit.name()%></option>
                                    <% cnt++;
                                        } %>
                                </select>
                            </div>      


                            <div>
                                <input type="submit" name="name" value="ADD">
                            </div>
                        </form>
                    </div>
                </div>
                <h1>Ingredient details</h1>
                <%
                    List<Ingredient> ingreds = (List<Ingredient>) request.getAttribute("ingredients");
                %>
                <table>
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Stock</th>
                            <th>Min Stock</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            DecimalFormat df = new DecimalFormat("#,##0.00");

                            for (Ingredient ingred : ingreds) {

                        %>
                        <tr>
                            <td><%= ingred.getIngredientId()%></td>
                            <td><%= ingred.getName()%></td>
                            <td><%= df.format(ingred.getStock()) + " (" + ingred.getUnit().name() + ")"%></td>
                            <td><%= df.format(ingred.getMinStockOnHand())%></td>
                            <td>
                                <button onclick="openPopup('<%= ingred.getIngredientId()%>', '<%= ingred.getName().replaceAll("'", "\\\\'")%>', '<%= ingred.getMinStockOnHand()%>', '<%= ingred.getUnit().name()%>', '<%= ingred.getStock()%>', '<%= ingred.isIsActive()%>')">Edit</button>
                                <% if (ingred.isIsActive()) {%>
                                <a href="service?service=admin&process=activate-ingredient&ingredientId=<%= ingred.getIngredientId()%>&active=false">
                                    <button>Deactivate</button>
                                </a>
                                <% } else {%>
                                <a href="service?service=admin&process=activate-ingredient&ingredientId=<%= ingred.getIngredientId()%>&active=true" >
                                    <button>Activate</button>
                                </a>
                                <% } %>
                            </td>

                        </tr>
                        <%
                            }
                        %>

                    </tbody>
                </table>

                <br>
                <button style="margin-left: 400px" onclick="openPopup1()" >Add New Ingredient</button>




            </div>
            <!-- Content End -->

        </div>

        <script>
            function openPopup(ingredientId, ingredientName, minimumStock, ingreUnit, stock, isActive) {
                var popup = document.getElementById("popup");
                popup.classList.add("active");

                document.getElementById("ingredId").value = ingredientId;
                document.getElementById("ingred-name").value = ingredientName;
                document.getElementById("minimum-stock").value = minimumStock;
                document.getElementById("cate").value = ingreUnit;
                document.getElementById("stock").value = stock;
                document.getElementById("is-active").value = isActive;
            }

            function closePopup() {
                var popup = document.getElementById("popup");
                popup.classList.remove("active");
            }
            function openPopup1() {
                var popup = document.getElementById("popup1");
                popup.classList.add("active");
            }

            function closePopup1() {
                var popup = document.getElementById("popup1");
                popup.classList.remove("active");
            }
        </script>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="Styles/lib/chart/chart.min.js"></script>
        <script src="Styles/lib/easing/easing.min.js"></script>
        <script src="Styles/lib/waypoints/waypoints.min.js"></script>
        <script src="Styles/lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="Styles/lib/tempusdominus/js/moment.min.js"></script>
        <script src="Styles/lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="Styles/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Javascript -->
        <script src="Styles/js/main.js"></script>

        <script>
            <%
                String msg = (String) request.getAttribute("msg");
                if (msg != null) {
                    request.setAttribute("msg", null);
            %>
            alert("<%= msg%>");
            <%
                }
            %>
        </script>-+

    </body>
