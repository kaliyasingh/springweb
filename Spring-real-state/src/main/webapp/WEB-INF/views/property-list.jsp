<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Property Listings - Real Estate</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

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
    <style type="text/css">
            .logo h2 { font-size: 24px; font-weight: bold; margin: 0; color: #333; }
    
    </style>
</head>

<body>
    <%@include file="header.jsp" %>
    
    <!-- Header Start -->
    <div class="container-fluid header bg-white p-0">
        <div class="row g-0 align-items-center flex-column-reverse flex-md-row">
            <div class="col-md-6 p-5 mt-lg-5">
                <h1 class="display-5 animated fadeIn mb-4">Property List</h1> 
                <nav aria-label="breadcrumb animated fadeIn">
                    <ol class="breadcrumb text-uppercase">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Pages</a></li>
                        <li class="breadcrumb-item text-body active" aria-current="page">Property List</li>
                    </ol>
                </nav>
            </div>
            <div class="col-md-6 animated fadeIn">
                <img class="img-fluid" src="img/header.jpg" alt="">
            </div>
        </div>
    </div>
    <!-- Header End -->

    <%
    // Get search parameters
    String searchKeyword = request.getParameter("search");
    String searchType = request.getParameter("type");
    String searchLocation = request.getParameter("location");
    
    if (searchKeyword == null) searchKeyword = "";
    if (searchType == null) searchType = "";
    if (searchLocation == null) searchLocation = "";
    %>

    <!-- Search Start -->
    <div class="container-fluid bg-primary mb-5 wow fadeIn" data-wow-delay="0.1s" style="padding: 35px;">
        <div class="container">
            <form method="GET" action="">
                <div class="row g-2">
                    <div class="col-md-10">
                        <div class="row g-2">
                            <div class="col-md-4">
                                <input type="text" name="search" class="form-control border-0 py-3" 
                                       placeholder="Search Keyword" value="<%= searchKeyword %>">
                            </div>
                            <div class="col-md-4">
                                <select name="type" class="form-select border-0 py-3">
                                    <option value="">Property Type</option>
                                    <option value="Villa" <%= "Villa".equals(searchType) ? "selected" : "" %>>Villa</option>
                                    <option value="Apartment" <%= "Apartment".equals(searchType) ? "selected" : "" %>>Apartment</option>
                                    <option value="Commercial" <%= "Commercial".equals(searchType) ? "selected" : "" %>>Commercial</option>
                                    <option value="House" <%= "House".equals(searchType) ? "selected" : "" %>>House</option>
                                    <option value="Plot" <%= "Plot".equals(searchType) ? "selected" : "" %>>Plot</option>
                                    <option value="Office" <%= "Office".equals(searchType) ? "selected" : "" %>>Office</option>
                                    <option value="Shop" <%= "Shop".equals(searchType) ? "selected" : "" %>>Shop</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <input type="text" name="location" class="form-control border-0 py-3" 
                                       placeholder="Location" value="<%= searchLocation %>">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <button type="submit" class="btn btn-dark border-0 w-100 py-3">Search</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- Search End -->

    <!-- Property List Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-0 gx-5 align-items-end">
                <div class="col-lg-6">
                    <div class="text-start mx-auto mb-5 wow slideInLeft" data-wow-delay="0.1s">
                        <h1 class="mb-3">Property Listing</h1>
                        <p>Browse through our exclusive collection of premium properties available for sale and rent.</p>
                    </div>
                </div>
                <div class="col-lg-6 text-start text-lg-end wow slideInRight" data-wow-delay="0.1s">
                    <ul class="nav nav-pills d-inline-flex justify-content-end mb-5">
                        <li class="nav-item me-2">
                            <a class="btn btn-outline-primary active" data-bs-toggle="pill" href="#tab-1">All Properties</a>
                        </li>
                        <li class="nav-item me-2">
                            <a class="btn btn-outline-primary" data-bs-toggle="pill" href="#tab-2">For Sale</a>
                        </li>
                        <li class="nav-item me-0">
                            <a class="btn btn-outline-primary" data-bs-toggle="pill" href="#tab-3">For Rent</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="tab-content">
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
                    
                    // Build SQL query with search filters
                    StringBuilder sql = new StringBuilder("SELECT * FROM properties WHERE 1=1");
                    
                    if (!searchKeyword.isEmpty()) {
                        sql.append(" AND (title LIKE ? OR location LIKE ?)");
                    }
                    if (!searchType.isEmpty()) {
                        sql.append(" AND type = ?");
                    }
                    if (!searchLocation.isEmpty()) {
                        sql.append(" AND location LIKE ?");
                    }
                    sql.append(" ORDER BY created_at DESC");
                    
                    pstmt = conn.prepareStatement(sql.toString());
                    
                    int paramIndex = 1;
                    if (!searchKeyword.isEmpty()) {
                        pstmt.setString(paramIndex++, "%" + searchKeyword + "%");
                        pstmt.setString(paramIndex++, "%" + searchKeyword + "%");
                    }
                    if (!searchType.isEmpty()) {
                        pstmt.setString(paramIndex++, searchType);
                    }
                    if (!searchLocation.isEmpty()) {
                        pstmt.setString(paramIndex++, "%" + searchLocation + "%");
                    }
                    
                    rs = pstmt.executeQuery();
                    
                    // Store properties for different tabs
                    List<Map<String, Object>> allProperties = new ArrayList<>();
                    List<Map<String, Object>> forSaleProperties = new ArrayList<>();
                    List<Map<String, Object>> forRentProperties = new ArrayList<>();
                    
                    while (rs.next()) {
                        Map<String, Object> property = new HashMap<>();
                        property.put("id", rs.getInt("id"));
                        property.put("title", rs.getString("title"));
                        property.put("location", rs.getString("location"));
                        property.put("price", rs.getDouble("price"));
                        property.put("priceUnit", rs.getString("price_unit"));
                        property.put("status", rs.getString("status"));
                        property.put("type", rs.getString("type"));
                        property.put("bedrooms", rs.getInt("bedrooms"));
                        property.put("bathrooms", rs.getInt("bathrooms"));
                        property.put("squareFeet", rs.getInt("square_feet"));
                        property.put("agentName", rs.getString("agent_name"));
                        
                        Blob imageBlob = rs.getBlob("image");
                        if (imageBlob != null) {
                            byte[] imgData = imageBlob.getBytes(1, (int) imageBlob.length());
                            property.put("image", Base64.getEncoder().encodeToString(imgData));
                        }
                        
                        allProperties.add(property);
                        
                        String status = rs.getString("status");
                        if ("Available".equals(status) || "Sold".equals(status)) {
                            forSaleProperties.add(property);
                        }
                        if ("Available".equals(status) || "Rented".equals(status)) {
                            forRentProperties.add(property);
                        }
                    }
                    
                    // Display All Properties Tab
                    %>
                    <div id="tab-1" class="tab-pane fade show p-0 active">
                        <div class="row g-4">
                            <% 
                            if (allProperties.isEmpty()) {
                            %>
                            <div class="col-12">
                                <div class="alert alert-info text-center">
                                    <h5>No properties found</h5>
                                    <p>Try adjusting your search criteria</p>
                                </div>
                            </div>
                            <%
                            } else {
                                for (Map<String, Object> prop : allProperties) {
                            %>
                            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                                <div class="property-item rounded overflow-hidden">
                                    <div class="position-relative overflow-hidden">
                                        <a href="property-details.jsp?id=<%= prop.get("id") %>">
                                            <% if (prop.get("image") != null) { %>
                                            <img class="img-fluid" src="data:image/jpeg;base64,<%= prop.get("image") %>" alt="<%= prop.get("title") %>">
                                            <% } else { %>
                                            <img class="img-fluid" src="img/property-1.jpg" alt="<%= prop.get("title") %>">
                                            <% } %>
                                        </a>
                                        <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3"><%= prop.get("status") %></div>
                                        <div class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3"><%= prop.get("type") %></div>
                                    </div>
                                    <div class="p-4 pb-0">
                                        <h5 class="text-primary mb-3">₹<%= String.format("%.2f", (Double)prop.get("price")) %> <%= prop.get("priceUnit") %></h5>
                                        <a class="d-block h5 mb-2" href="property-details.jsp?id=<%= prop.get("id") %>"><%= prop.get("title") %></a>
                                        <p><i class="fa fa-map-marker-alt text-primary me-2"></i><%= prop.get("location") %></p>
                                    </div>
                                    <div class="d-flex border-top">
                                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-ruler-combined text-primary me-2"></i><%= prop.get("squareFeet") %> Sqft</small>
                                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-bed text-primary me-2"></i><%= prop.get("bedrooms") %> Bed</small>
                                        <small class="flex-fill text-center py-2"><i class="fa fa-bath text-primary me-2"></i><%= prop.get("bathrooms") %> Bath</small>
                                    </div>
                                     <div class="d-flex border-top gap-2 p-2">
                                    <a href="viewProperty" class="flex-fill btn btn-sm btn-outline-primary rounded-pill">View Details</a>
                                   <a href="#" class="flex-fill btn btn-sm btn-primary rounded-pill">Schedule Tour</a>
                                   </div>
                                </div>
                            </div>
                            <%
                                }
                            }
                            %>
                        </div>
                    </div>
                    
                    <!-- For Sale Tab -->
                    <div id="tab-2" class="tab-pane fade show p-0">
                        <div class="row g-4">
                            <% 
                            if (forSaleProperties.isEmpty()) {
                            %>
                            <div class="col-12">
                                <div class="alert alert-info text-center">
                                    <h5>No properties available for sale</h5>
                                </div>
                            </div>
                            <%
                            } else {
                                for (Map<String, Object> prop : forSaleProperties) {
                            %>
                            <div class="col-lg-4 col-md-6">
                                <div class="property-item rounded overflow-hidden">
                                    <div class="position-relative overflow-hidden">
                                        <a href="property-details.jsp?id=<%= prop.get("id") %>">
                                            <% if (prop.get("image") != null) { %>
                                            <img class="img-fluid" src="data:image/jpeg;base64,<%= prop.get("image") %>" alt="<%= prop.get("title") %>">
                                            <% } else { %>
                                            <img class="img-fluid" src="img/property-1.jpg" alt="<%= prop.get("title") %>">
                                            <% } %>
                                        </a>
                                        <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">For Sale</div>
                                        <div class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3"><%= prop.get("type") %></div>
                                    </div>
                                    <div class="p-4 pb-0">
                                        <h5 class="text-primary mb-3">₹<%= String.format("%.2f", (Double)prop.get("price")) %> <%= prop.get("priceUnit") %></h5>
                                        <a class="d-block h5 mb-2" href="property-details.jsp?id=<%= prop.get("id") %>"><%= prop.get("title") %></a>
                                        <p><i class="fa fa-map-marker-alt text-primary me-2"></i><%= prop.get("location") %></p>
                                    </div>
                                    <div class="d-flex border-top">
                                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-ruler-combined text-primary me-2"></i><%= prop.get("squareFeet") %> Sqft</small>
                                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-bed text-primary me-2"></i><%= prop.get("bedrooms") %> Bed</small>
                                        <small class="flex-fill text-center py-2"><i class="fa fa-bath text-primary me-2"></i><%= prop.get("bathrooms") %> Bath</small>
                                    </div>
                                     <div class="d-flex border-top gap-2 p-2">
                                    <a href="viewProperty" class="flex-fill btn btn-sm btn-outline-primary rounded-pill">View Details</a>
                                   <a href="#" class="flex-fill btn btn-sm btn-primary rounded-pill">Schedule Tour</a>
                                   </div>
                                </div>
                            </div>
                            <%
                                }
                            }
                            %>
                        </div>
                    </div>
                    
                    <!-- For Rent Tab -->
                    <div id="tab-3" class="tab-pane fade show p-0">
                        <div class="row g-4">
                            <% 
                            if (forRentProperties.isEmpty()) {
                            %>
                            <div class="col-12">
                                <div class="alert alert-info text-center">
                                    <h5>No properties available for rent</h5>
                                </div>
                            </div>
                            <%
                            } else {
                                for (Map<String, Object> prop : forRentProperties) {
                            %>
                            <div class="col-lg-4 col-md-6">
                                <div class="property-item rounded overflow-hidden">
                                    <div class="position-relative overflow-hidden">
                                        <a href="property-details.jsp?id=<%= prop.get("id") %>">
                                            <% if (prop.get("image") != null) { %>
                                            <img class="img-fluid" src="data:image/jpeg;base64,<%= prop.get("image") %>" alt="<%= prop.get("title") %>">
                                            <% } else { %>
                                            <img class="img-fluid" src="img/property-1.jpg" alt="<%= prop.get("title") %>">
                                            <% } %>
                                        </a>
                                        <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">For Rent</div>
                                        <div class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3"><%= prop.get("type") %></div>
                                    </div>
                                    <div class="p-4 pb-0">
                                        <h5 class="text-primary mb-3">₹<%= String.format("%.2f", (Double)prop.get("price")) %> <%= prop.get("priceUnit") %></h5>
                                        <a class="d-block h5 mb-2" href="property-details.jsp?id=<%= prop.get("id") %>"><%= prop.get("title") %></a>
                                        <p><i class="fa fa-map-marker-alt text-primary me-2"></i><%= prop.get("location") %></p>
                                    </div>
                                    <div class="d-flex border-top">
                                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-ruler-combined text-primary me-2"></i><%= prop.get("squareFeet") %> Sqft</small>
                                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-bed text-primary me-2"></i><%= prop.get("bedrooms") %> Bed</small>
                                        <small class="flex-fill text-center py-2"><i class="fa fa-bath text-primary me-2"></i><%= prop.get("bathrooms") %> Bath</small>
                                    </div>
                                     <div class="d-flex border-top gap-2 p-2">
                                    <a href="viewProperty" class="flex-fill btn btn-sm btn-outline-primary rounded-pill">View Details</a>
                                   <a href="#" class="flex-fill btn btn-sm btn-primary rounded-pill">Schedule Tour</a>
                                   </div>
                                </div>
                            </div>
                            <%
                                }
                            }
                            %>
                        </div>
                    </div>
                    <%
                } catch (Exception e) {
                    out.println("<div class='alert alert-danger'>Error loading properties: " + e.getMessage() + "</div>");
                    e.printStackTrace();
                } finally {
                    if (rs != null) try { rs.close(); } catch(Exception e) {}
                    if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
                    if (conn != null) try { conn.close(); } catch(Exception e) {}
                }
                %>
            </div>
        </div>
    </div>
    <!-- Property List End -->

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
                                <p>Get in touch with our experienced real estate agents to find your dream property or get expert advice on buying, selling, or renting.</p>
                            </div>
                            <a href="" class="btn btn-primary py-3 px-4 me-2"><i class="fa fa-phone-alt me-2"></i>Make A Call</a>
                            <a href="" class="btn btn-dark py-3 px-4"><i class="fa fa-calendar-alt me-2"></i>Get Appointment</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Call to Action End -->
    
    <%@include file="footer.jsp" %>

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