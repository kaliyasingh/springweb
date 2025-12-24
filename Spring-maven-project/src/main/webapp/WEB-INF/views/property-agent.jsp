<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Property Agents - Premium Realty</title>
    
    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">
    
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    
    <style>
        .agent-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
            position: relative;
        }

        .agent-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 12px 40px rgba(0,0,0,0.15);
        }

        .agent-image {
            width: 100%;
            height: 300px;
            position: relative;
            overflow: hidden;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .agent-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .agent-initials {
            width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 72px;
            color: white;
            font-weight: 700;
        }

        .agent-social {
            position: absolute;
            bottom: -50px;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
            gap: 10px;
            transition: bottom 0.3s ease;
            z-index: 10;
        }

        .agent-card:hover .agent-social {
            bottom: 20px;
        }

        .social-btn {
            width: 40px;
            height: 40px;
            background: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #00b98e;
            text-decoration: none;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            transition: all 0.3s;
        }

        .social-btn:hover {
            background: #00b98e;
            color: white;
            transform: scale(1.1);
        }

        .agent-info {
            padding: 25px 20px;
            text-align: center;
        }

        .agent-info h3 {
            font-size: 20px;
            color: #0e2e50;
            margin-bottom: 5px;
            font-weight: 700;
        }

        .agent-info .designation {
            color: #6c757d;
            font-size: 14px;
        }

        .status-badge {
            position: absolute;
            top: 15px;
            right: 15px;
            padding: 6px 15px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 600;
            text-transform: uppercase;
            background: rgba(255,255,255,0.95);
            z-index: 10;
        }

        .status-active {
            color: #28a745;
        }

        .status-inactive {
            color: #dc3545;
        }
                    .logo h2 { font-size: 24px; font-weight: bold; margin: 0; color: #333; }
        
    </style>
</head>
<body>

    <%@include file="header.jsp" %>
    
        <!-- Header Start -->
        <div class="container-fluid header bg-white p-0">
            <div class="row g-0 align-items-center flex-column-reverse flex-md-row">
                <div class="col-md-6 p-5 mt-lg-5">
                    <h1 class="display-5 animated fadeIn mb-4">Property Agent</h1> 
                    <nav aria-label="breadcrumb animated fadeIn">
                        <ol class="breadcrumb text-uppercase">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Pages</a></li>
                            <li class="breadcrumb-item text-body active" aria-current="page">Property Agent</li>
                        </ol>
                    </nav>
                </div>
                <div class="col-md-6 animated fadeIn">
                    <img class="img-fluid" src="img/header.jpg" alt="">
                </div>
            </div>
        </div>
        <!-- Header End -->

        <!-- Search Start -->
        <div class="container-fluid bg-primary mb-5 wow fadeIn" data-wow-delay="0.1s" style="padding: 35px;">
            <div class="container">
                <form class="row g-2" method="GET">
                    <div class="col-md-10">
                        <div class="row g-2">
                            <div class="col-md-4">
                                <input type="text" name="search" class="form-control border-0 py-3" placeholder="Search by name..." value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">
                            </div>
                            <div class="col-md-4">
                                <select name="specialization" class="form-select border-0 py-3">
                                    <option value="">All Specializations</option>
                                    <option value="residential" <%= "residential".equals(request.getParameter("specialization")) ? "selected" : "" %>>Residential</option>
                                    <option value="commercial" <%= "commercial".equals(request.getParameter("specialization")) ? "selected" : "" %>>Commercial</option>
                                    <option value="luxury" <%= "luxury".equals(request.getParameter("specialization")) ? "selected" : "" %>>Luxury Properties</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <select name="status" class="form-select border-0 py-3">
                                    <option value="">All Status</option>
                                    <option value="active" <%= "active".equals(request.getParameter("status")) ? "selected" : "" %>>Active</option>
                                    <option value="inactive" <%= "inactive".equals(request.getParameter("status")) ? "selected" : "" %>>Inactive</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <button type="submit" class="btn btn-dark border-0 w-100 py-3">Search</button>
                    </div>
                </form>
            </div>
        </div>
        <!-- Search End -->

        <!-- Team Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                    <h1 class="mb-3">Property Agents</h1>
                    <p>Meet our team of experienced real estate professionals dedicated to helping you find your perfect property.</p>
                </div>
                <div class="row g-4">
                    <%
                    // Database configuration
                    String dbURL = "jdbc:mysql://localhost:3306/ips26mca";
                    String dbUser = "root";
                    String dbPassword = "root";
                    
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;
                    
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                        
                        // Build dynamic query based on filters
                        StringBuilder sql = new StringBuilder("SELECT * FROM agents WHERE 1=1");
                        
                        String searchParam = request.getParameter("search");
                        String specializationParam = request.getParameter("specialization");
                        String statusParam = request.getParameter("status");
                        
                        if (searchParam != null && !searchParam.trim().isEmpty()) {
                            sql.append(" AND name LIKE ?");
                        }
                        if (specializationParam != null && !specializationParam.isEmpty()) {
                            sql.append(" AND specialization = ?");
                        }
                        if (statusParam != null && !statusParam.isEmpty()) {
                            sql.append(" AND status = ?");
                        }
                        
                        sql.append(" ORDER BY created_at DESC");
                        
                        pstmt = conn.prepareStatement(sql.toString());
                        
                        int paramIndex = 1;
                        if (searchParam != null && !searchParam.trim().isEmpty()) {
                            pstmt.setString(paramIndex++, "%" + searchParam + "%");
                        }
                        if (specializationParam != null && !specializationParam.isEmpty()) {
                            pstmt.setString(paramIndex++, specializationParam);
                        }
                        if (statusParam != null && !statusParam.isEmpty()) {
                            pstmt.setString(paramIndex++, statusParam);
                        }
                        
                        rs = pstmt.executeQuery();
                        
                        while (rs.next()) {
                            int id = rs.getInt("id");
                            String name = rs.getString("name");
                            String email = rs.getString("email");
                            String phone = rs.getString("phone");
                            String specialization = rs.getString("specialization");
                            int experience = rs.getInt("experience");
                            String status = rs.getString("status");
                            String territory = rs.getString("territory");
                            int propertiesSold = rs.getInt("properties_sold");
                            double rating = rs.getDouble("rating");
                            
                            // Get initials for avatar
                            String initials = "";
                            String[] nameParts = name.split(" ");
                            for (String part : nameParts) {
                                if (part.length() > 0) {
                                    initials += part.charAt(0);
                                }
                            }
                            
                            String specializationCap = specialization.substring(0, 1).toUpperCase() + specialization.substring(1);
                    %>
                    
                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="agent-card">
                            <div class="agent-image">
                                <% 
                                Blob photoBlob = rs.getBlob("photo");
                                if (photoBlob != null) {
                                    byte[] imgData = photoBlob.getBytes(1, (int) photoBlob.length());
                                    String base64Image = Base64.getEncoder().encodeToString(imgData);
                                %>
                                <img src="data:image/jpeg;base64,<%= base64Image %>" alt="<%= name %>">
                                <% } else { %>
                                <div class="agent-initials"><%= initials.toUpperCase() %></div>
                                <% } %>
                                
                                <span class="status-badge status-<%= status %>">
                                    <%= status.toUpperCase() %>
                                </span>
                                
                                <div class="agent-social">
                                    <a href="#" class="social-btn"><i class="fab fa-facebook-f"></i></a>
                                    <a href="#" class="social-btn"><i class="fab fa-twitter"></i></a>
                                    <a href="#" class="social-btn"><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                            
                            <div class="agent-info">
                                <h3><%= name %></h3>
                                <div class="designation"><%= specializationCap %></div>
                            </div>
                        </div>
                    </div>
                    
                    <%
                        }
                    } catch (Exception e) {
                        out.println("<div class='col-12'>");
                        out.println("<div class='alert alert-danger text-center'>");
                        out.println("<h3>Error loading agents</h3>");
                        out.println("<p>" + e.getMessage() + "</p>");
                        out.println("</div></div>");
                        e.printStackTrace();
                    } finally {
                        if (rs != null) rs.close();
                        if (pstmt != null) pstmt.close();
                        if (conn != null) conn.close();
                    }
                    %>
                </div>
            </div>
        </div>
        <!-- Team End -->

        <!-- Call to Action Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="bg-light rounded p-3">
                    <div class="bg-white rounded p-4" style="border: 1px dashed rgba(0, 185, 142, .3)">
                        <div class="row g-5 align-items-center">
                            <div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">
                                <img class="img-fluid rounded w-100" src="img/call-to-action.jpg" alt="">
                            </div>
                            <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
                                <div class="mb-4">
                                    <h1 class="mb-3">Contact With Our Certified Agent</h1>
                                    <p>Eirmod sed ipsum dolor sit rebum magna erat. Tempor lorem kasd vero ipsum sit sit diam justo sed vero dolor duo.</p>
                                </div>
                                <a href="" class="btn btn-primary py-3 px-4 me-2"><i class="fa fa-phone-alt me-2"></i>Make A Call</a>
                                <a href="" class="btn btn-dark py-3 px-4"><i class="fa fa-calendar-alt me-2"></i>Get Appoinment</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Call to Action End -->

        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container py-5">
                <div class="row g-5">
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-white mb-4">Get In Touch</h5>
                        <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>Location, City, Country</p>
                        <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
                        <p class="mb-2"><i class="fa fa-envelope me-3"></i>info@example.com</p>
                        <div class="d-flex pt-2">
                            <a class="btn btn-outline-light btn-social" href="https://twitter.com/freewebsitecode"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-light btn-social" href="https://facebook.com/freewebsitecode"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light btn-social" href="https://youtube.com/freewebsitecode"><i class="fab fa-youtube"></i></a>
                            <a class="btn btn-outline-light btn-social" href="https://linkedin/in/freewebsitecode"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-white mb-4">Quick Links</h5>
                        <a class="btn btn-link text-white-50" href="">About Us</a>
                        <a class="btn btn-link text-white-50" href="">Contact Us</a>
                        <a class="btn btn-link text-white-50" href="">Our Services</a>
                        <a class="btn btn-link text-white-50" href="">Privacy Policy</a>
                        <a class="btn btn-link text-white-50" href="">Terms & Condition</a>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-white mb-4">Photo Gallery</h5>
                        <div class="row g-2 pt-2">
                            <div class="col-4">
                                <img class="img-fluid rounded bg-light p-1" src="img/property-1.jpg" alt="">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid rounded bg-light p-1" src="img/property-2.jpg" alt="">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid rounded bg-light p-1" src="img/property-3.jpg" alt="">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid rounded bg-light p-1" src="img/property-4.jpg" alt="">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid rounded bg-light p-1" src="img/property-5.jpg" alt="">
                            </div>
                            <div class="col-4">
                                <img class="img-fluid rounded bg-light p-1" src="img/property-6.jpg" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-white mb-4">Newsletter</h5>
                        <p>Dolor amet sit justo amet elitr clita ipsum elitr est.</p>
                        <div class="position-relative mx-auto" style="max-width: 400px;">
                            <input class="form-control bg-transparent w-100 py-3 ps-4 pe-5" type="text" placeholder="Your email">
                            <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="copyright">
                    <div class="row">
                        <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                            &copy; <a class="border-bottom" href="https://freewebsitecode.com">Your Site Name</a>, All Right Reserved. 
                            Designed By <a class="border-bottom" href="https://freewebsitecode.com">Free Website Code</a>
                        </div>
                        <div class="col-md-6 text-center text-md-end">
                            <div class="footer-menu">
                                <a href="">Home</a>
                                <a href="">Cookies</a>
                                <a href="">Help</a>
                                <a href="">FQAs</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->

        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>
</html>