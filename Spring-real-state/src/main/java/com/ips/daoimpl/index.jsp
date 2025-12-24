<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Premium Realty - Real Estate</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Premium real estate properties for sale and rent" name="description">
    <meta content="real estate, property, home, house, apartment, villa" name="keywords">
    <link href="img/favicon.ico" rel="icon">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <style>
        .logo h2 { font-size: 24px; font-weight: bold; margin: 0; color: #333; }
        .hero {
            height: calc(100vh - 80px);
            background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)), url('https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?ixlib=rb-4.0.3&auto=format&fit=crop&w=2053&q=80');
            background-size: cover;
            background-position: center;
            display: flex;
            align-items: center;
            color: white;
        }
        .hero-content { max-width: 1200px; margin: 0 auto; padding: 0 20px; }
        .hero-text h1 { font-size: 48px; font-weight: 700; margin-bottom: 20px; line-height: 1.2; }
        .hero-text .highlight { color: #00d4aa; }
        .hero-text p { font-size: 18px; margin-bottom: 30px; color: rgba(255, 255, 255, 0.9); }
        @media (max-width: 768px) { .hero-text h1 { font-size: 36px; } }
    </style>
</head>
<body>
    <div class="container-xxl bg-white p-0">
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>

        <div class="container-fluid nav-bar bg-transparent">
            <nav class="navbar navbar-expand-lg bg-white navbar-light py-0 px-4">
                <a href="index" class="navbar-brand d-flex align-items-center text-center">
                    <div class="icon p-2 me-2">
                        <img class="img-fluid" src="img/icon-deal.png" alt="Icon" style="width: 30px; height: 30px;">
                    </div>
                    <div class="logo"><h2>Premium Realty</h2></div>
                </a>
                <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto">
                        <a href="index" class="nav-item nav-link active">Home</a>
                        <a href="about" class="nav-item nav-link">About</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Property</a>
                            <div class="dropdown-menu rounded-0 m-0">
                                <a href="property-list" class="dropdown-item">Property List</a>
                                <a href="property-type" class="dropdown-item">Property Type</a>
                                <a href="property-agent" class="dropdown-item">Property Agent</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                            <div class="dropdown-menu rounded-0 m-0">
                                <a href="testimonial.jsp" class="dropdown-item">Testimonial</a>
                                <a href="404.jsp" class="dropdown-item">404 Error</a>
                            </div>
                        </div>
                        <a href="contact.jsp" class="nav-item nav-link">Contact</a>
                    </div>
                    <a href="login" class="btn btn-primary px-3 d-none d-lg-flex">Login</a>
                </div>
            </nav>
        </div>

        <section class="hero">
            <div class="hero-content">
                <div class="hero-text">
                    <h1 style="color: white;">Find A <span class="highlight">Perfect Home</span> To Live With Your Family</h1>
                    <p>Discover luxury properties with Premium Realty. We help you find the perfect home that matches your lifestyle and dreams.</p>
                </div>
            </div>
        </section>

        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                    <h1 class="mb-3">Property Types</h1>
                    <p>Explore our diverse range of property types to find the perfect match for your needs and preferences.</p>
                </div>
                <div class="row g-4">
                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
                        <a class="cat-item d-block bg-light text-center rounded p-3" href="property-type.jsp?type=Apartment">
                            <div class="rounded p-4">
                                <div class="icon mb-3"><img class="img-fluid" src="img/icon-apartment.png" alt="Icon"></div>
                                <h6>Apartment</h6><span>Modern Living Spaces</span>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
                        <a class="cat-item d-block bg-light text-center rounded p-3" href="property-type.jsp?type=Villa">
                            <div class="rounded p-4">
                                <div class="icon mb-3"><img class="img-fluid" src="img/icon-villa.png" alt="Icon"></div>
                                <h6>Villa</h6><span>Luxury Properties</span>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
                        <a class="cat-item d-block bg-light text-center rounded p-3" href="property-type.jsp?type=House">
                            <div class="rounded p-4">
                                <div class="icon mb-3"><img class="img-fluid" src="img/icon-house.png" alt="Icon"></div>
                                <h6>Home</h6><span>Family Residences</span>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                        <a class="cat-item d-block bg-light text-center rounded p-3" href="property-type.jsp?type=Commercial">
                            <div class="rounded p-4">
                                <div class="icon mb-3"><img class="img-fluid" src="img/icon-housing.png" alt="Icon"></div>
                                <h6>Office</h6><span>Commercial Spaces</span>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-5 align-items-center">
                    <div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">
                        <div class="about-img position-relative overflow-hidden p-5 pe-0">
                            <img class="img-fluid w-100" src="img/about.jpg">
                        </div>
                    </div>
                    <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
                        <h1 class="mb-4">#1 Place To Find The Perfect Property</h1>
                        <p class="mb-4">Premium Realty offers exceptional real estate services with a commitment to finding you the perfect property. Our experienced team provides personalized assistance throughout your property search journey.</p>
                        <p><i class="fa fa-check text-primary me-3"></i>Extensive property listings across multiple locations</p>
                        <p><i class="fa fa-check text-primary me-3"></i>Professional agents with local market expertise</p>
                        <p><i class="fa fa-check text-primary me-3"></i>Transparent pricing and seamless transactions</p>
                        <a class="btn btn-primary py-3 px-5 mt-3" href="about">Read More</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-0 gx-5 align-items-end">
                    <div class="col-lg-6">
                        <div class="text-start mx-auto mb-5 wow slideInLeft" data-wow-delay="0.1s">
                            <h1 class="mb-3">Property Listing</h1>
                            <p>Browse our curated selection of premium properties available for sale and rent.</p>
                        </div>
                    </div>
                    <div class="col-lg-6 text-start text-lg-end wow slideInRight" data-wow-delay="0.1s">
                        <ul class="nav nav-pills d-inline-flex justify-content-end mb-5">
                            <li class="nav-item me-2">
                                <a class="btn btn-outline-primary active" data-bs-toggle="pill" href="#tab-1">Featured</a>
                            </li>
                            <li class="nav-item me-2">
                                <a class="btn btn-outline-primary" data-bs-toggle="pill" href="#tab-2">For Sell</a>
                            </li>
                            <li class="nav-item me-0">
                                <a class="btn btn-outline-primary" data-bs-toggle="pill" href="#tab-3">For Rent</a>
                            </li>
                        </ul>
                    </div>
                </div>
                
                <div class="tab-content">
                    <%
                    String dbURL = "jdbc:mysql://localhost:3306/ips26mca";
                    String dbUser = "root";
                    String dbPassword = "root";
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;
                    List<Map<String, Object>> featuredProps = new ArrayList<>();
                    List<Map<String, Object>> forSaleProps = new ArrayList<>();
                    List<Map<String, Object>> forRentProps = new ArrayList<>();
                    
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                        
                        String sqlFeatured = "SELECT * FROM properties ORDER BY created_at DESC LIMIT 6";
                        pstmt = conn.prepareStatement(sqlFeatured);
                        rs = pstmt.executeQuery();
                        while(rs.next()) {
                            Map<String, Object> prop = new HashMap<>();
                            prop.put("id", rs.getInt("id"));
                            prop.put("title", rs.getString("title"));
                            prop.put("location", rs.getString("location"));
                            prop.put("price", rs.getDouble("price"));
                            prop.put("priceUnit", rs.getString("price_unit"));
                            prop.put("status", rs.getString("status"));
                            prop.put("type", rs.getString("type"));
                            prop.put("bedrooms", rs.getInt("bedrooms"));
                            prop.put("bathrooms", rs.getInt("bathrooms"));
                            prop.put("squareFeet", rs.getInt("square_feet"));
                            Blob imageBlob = rs.getBlob("image");
                            if(imageBlob != null) {
                                byte[] imgData = imageBlob.getBytes(1, (int) imageBlob.length());
                                prop.put("image", Base64.getEncoder().encodeToString(imgData));
                            }
                            featuredProps.add(prop);
                        }
                        rs.close();
                        pstmt.close();
                        
                        String sqlSale = "SELECT * FROM properties WHERE status IN ('Available', 'Sold') ORDER BY created_at DESC LIMIT 6";
                        pstmt = conn.prepareStatement(sqlSale);
                        rs = pstmt.executeQuery();
                        while(rs.next()) {
                            Map<String, Object> prop = new HashMap<>();
                            prop.put("id", rs.getInt("id"));
                            prop.put("title", rs.getString("title"));
                            prop.put("location", rs.getString("location"));
                            prop.put("price", rs.getDouble("price"));
                            prop.put("priceUnit", rs.getString("price_unit"));
                            prop.put("status", rs.getString("status"));
                            prop.put("type", rs.getString("type"));
                            prop.put("bedrooms", rs.getInt("bedrooms"));
                            prop.put("bathrooms", rs.getInt("bathrooms"));
                            prop.put("squareFeet", rs.getInt("square_feet"));
                            Blob imageBlob = rs.getBlob("image");
                            if(imageBlob != null) {
                                byte[] imgData = imageBlob.getBytes(1, (int) imageBlob.length());
                                prop.put("image", Base64.getEncoder().encodeToString(imgData));
                            }
                            forSaleProps.add(prop);
                        }
                        rs.close();
                        pstmt.close();
                        
                        String sqlRent = "SELECT * FROM properties WHERE status IN ('Available', 'Rented') ORDER BY created_at DESC LIMIT 6";
                        pstmt = conn.prepareStatement(sqlRent);
                        rs = pstmt.executeQuery();
                        while(rs.next()) {
                            Map<String, Object> prop = new HashMap<>();
                            prop.put("id", rs.getInt("id"));
                            prop.put("title", rs.getString("title"));
                            prop.put("location", rs.getString("location"));
                            prop.put("price", rs.getDouble("price"));
                            prop.put("priceUnit", rs.getString("price_unit"));
                            prop.put("status", rs.getString("status"));
                            prop.put("type", rs.getString("type"));
                            prop.put("bedrooms", rs.getInt("bedrooms"));
                            prop.put("bathrooms", rs.getInt("bathrooms"));
                            prop.put("squareFeet", rs.getInt("square_feet"));
                            Blob imageBlob = rs.getBlob("image");
                            if(imageBlob != null) {
                                byte[] imgData = imageBlob.getBytes(1, (int) imageBlob.length());
                                prop.put("image", Base64.getEncoder().encodeToString(imgData));
                            }
                            forRentProps.add(prop);
                        }
                    } catch(Exception e) {
                        out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
                        e.printStackTrace();
                    } finally {
                        if(rs != null) try { rs.close(); } catch(SQLException e) {}
                        if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
                        if(conn != null) try { conn.close(); } catch(SQLException e) {}
                    }
                    %>
                    
                    <div id="tab-1" class="tab-pane fade show p-0 active">
                        <div class="row g-4">
                            <% if(featuredProps.isEmpty()) { %>
                            <div class="col-12 text-center">
                                <div class="alert alert-info"><h5>No properties available</h5><p>Check back soon for new listings!</p></div>
                            </div>
                            <% } else { for(Map<String, Object> prop : featuredProps) { %>
                            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                                <div class="property-item rounded overflow-hidden">
                                    <div class="position-relative overflow-hidden">
                                        <a href="property-details.jsp?id=<%= prop.get("id") %>">
                                            <% if(prop.get("image") != null) { %>
                                            <img class="img-fluid" src="data:image/jpeg;base64,<%= prop.get("image") %>" alt="<%= prop.get("title") %>" style="height: 250px; width: 100%; object-fit: cover;">
                                            <% } else { %>
                                            <img class="img-fluid" src="img/property-1.jpg" alt="<%= prop.get("title") %>" style="height: 250px; width: 100%; object-fit: cover;">
                                            <% } %>
                                        </a>
                                        <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3"><%= prop.get("status") %></div>
                                        <div class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3"><%= prop.get("type") %></div>
                                    </div>
                                    <div class="p-4 pb-0">
                                        <h5 class="text-primary mb-3">₹<%= String.format("%,.2f", (Double)prop.get("price")) %> <%= prop.get("priceUnit") %></h5>
                                        <a class="d-block h5 mb-2" href="property-details.jsp?id=<%= prop.get("id") %>"><%= prop.get("title") %></a>
                                        <p><i class="fa fa-map-marker-alt text-primary me-2"></i><%= prop.get("location") %></p>
                                    </div>
                                    <div class="d-flex border-top">
                                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-ruler-combined text-primary me-2"></i><%= prop.get("squareFeet") %> Sqft</small>
                                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-bed text-primary me-2"></i><%= prop.get("bedrooms") %> Bed</small>
                                        <small class="flex-fill text-center py-2"><i class="fa fa-bath text-primary me-2"></i><%= prop.get("bathrooms") %> Bath</small>
                                    </div>
                                  <div class="d-flex border-top p-2">
                                <form action="property-details" method="post" style="width: 100%; margin: 0;">
                                  <input type="hidden" name="propertyId" value="<%= prop.get("id") %>">
                                <button type="submit" class="btn btn-primary w-100 rounded-pill">
                                <i class="fa fa-eye me-2"></i>View Details
                               </button>
                                </form>
                               </div>
                                </div>
                            </div>
                            <% } } %>
                            <% if(!featuredProps.isEmpty()) { %>
                            <div class="col-12 text-center wow fadeInUp" data-wow-delay="0.1s">
                                <a class="btn btn-primary py-3 px-5" href="property-list.jsp">Browse More Property</a>
                            </div>
                            <% } %>
                        </div>
                    </div>
                    
                    <div id="tab-2" class="tab-pane fade show p-0">
                        <div class="row g-4">
                            <% if(forSaleProps.isEmpty()) { %>
                            <div class="col-12 text-center">
                                <div class="alert alert-info"><h5>No properties for sale</h5><p>Check back soon!</p></div>
                            </div>
                            <% } else { for(Map<String, Object> prop : forSaleProps) { %>
                            <div class="col-lg-4 col-md-6">
                                <div class="property-item rounded overflow-hidden">
                                    <div class="position-relative overflow-hidden">
                                        <a href="property-details.jsp?id=<%= prop.get("id") %>">
                                            <% if(prop.get("image") != null) { %>
                                            <img class="img-fluid" src="data:image/jpeg;base64,<%= prop.get("image") %>" alt="<%= prop.get("title") %>" style="height: 250px; width: 100%; object-fit: cover;">
                                            <% } else { %>
                                            <img class="img-fluid" src="img/property-1.jpg" alt="<%= prop.get("title") %>" style="height: 250px; width: 100%; object-fit: cover;">
                                            <% } %>
                                        </a>
                                        <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">For Sale</div>
                                        <div class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3"><%= prop.get("type") %></div>
                                    </div>
                                    <div class="p-4 pb-0">
                                        <h5 class="text-primary mb-3">₹<%= String.format("%,.2f", (Double)prop.get("price")) %> <%= prop.get("priceUnit") %></h5>
                                        <a class="d-block h5 mb-2" href="property-details.jsp?id=<%= prop.get("id") %>"><%= prop.get("title") %></a>
                                        <p><i class="fa fa-map-marker-alt text-primary me-2"></i><%= prop.get("location") %></p>
                                    </div>
                                    <div class="d-flex border-top">
                                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-ruler-combined text-primary me-2"></i><%= prop.get("squareFeet") %> Sqft</small>
                                        <small class="flex-fill text-center border-end py-2"><i class="fa fa-bed text-primary me-2"></i><%= prop.get("bedrooms") %> Bed</small>
                                        <small class="flex-fill text-center py-2"><i class="fa fa-bath text-primary me-2"></i><%= prop.get("bathrooms") %> Bath</small>
                                    </div>
                                    <div class="d-flex border-top p-2">
                                 <form action="property-details" method="post" style="width: 100%; margin: 0;">
                                 <input type="hidden" name="propertyId" value="<%= prop.get("id") %>">
                               <button type="submit" class="btn btn-primary w-100 rounded-pill">
                                <i class="fa fa-eye me-2"></i>View Details
                                 </button>
    </form>
</div>
                                </div>
                            </div>
                            <% } } %>
                            <% if(!forSaleProps.isEmpty()) { %>
                            <div class="col-12 text-center">
                                <a class="btn btn-primary py-3 px-5" href="property-list.jsp">Browse More Property</a>
                            </div>
                            <% } %>
                        </div>
                    </div>
                    
                    <div id="tab-3" class="tab-pane fade show p-0">
                        <div class="row g-4">
                            <% if(forRentProps.isEmpty()) { %>
                            <div class="col-12 text-center">
                                <div class="alert alert-info"><h5>No properties for rent</h5><p>Check back soon!</p></div>
                            </div>
                            <% } else { for(Map<String, Object> prop : forRentProps) { %>
                            <div class="col-lg-4 col-md-6">
                                <div class="property-item rounded overflow-hidden">
                                    <div class="position-relative overflow-hidden">
                                        <a href="property-details.jsp?id=<%= prop.get("id") %>">
                                            <% if(prop.get("image") != null) { %>
                                            <img class="img-fluid" src="data:image/jpeg;base64,<%= prop.get("image") %>" alt="<%= prop.get("title") %>" style="height: 250px; width: 100%; object-fit: cover;">
                                            <% } else { %>
                                            <img class="img-fluid" src="img/property-1.jpg" alt="<%= prop.get("title") %>" style="height: 250px; width: 100%; object-fit: cover;">
                                            <% } %>
                                        </a>
                                        <div class="bg-primary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">For Rent</div>
                                        <div class="bg-white rounded-top text-primary position-absolute start-0 bottom-0 mx-4 pt-1 px-3"><%= prop.get("type") %></div>
                                    </div>
                                    <div class="p-4 pb-0">
                                        <h5 class="text-primary mb-3">₹<%= String.format("%,.2f", (Double)prop.get("price")) %> <%= prop.get("priceUnit") %></h5>
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
                                   <a href="detail" class="flex-fill btn btn-sm btn-primary rounded-pill">Schedule Tour</a>
                                   </div>
                                </div>
                            </div>
                            <% } } %>
                            <% if(!forRentProps.isEmpty()) { %>
                            <div class="col-12 text-center">
                                <a class="btn btn-primary py-3 px-5" href="property-list.jsp">Browse More Property</a>
                            </div>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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
                                    <p>Our certified real estate agents are ready to assist you in finding your dream property.</p>
                                </div>
                                <a href="contact.jsp" class="btn btn-primary py-3 px-4 me-2"><i class="fa fa-phone-alt me-2"></i>Make A Call</a>
                                <a href="contact.jsp" class="btn btn-dark py-3 px-4"><i class="fa fa-calendar-alt me-2"></i>Get Appointment</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                    <h1 class="mb-3">Property Agents</h1>
                    <p>Meet our team of experienced and certified property agents dedicated to helping you find your perfect home.</p>
                </div>
                <div class="row g-4">
                    <%
                    Connection agentConn = null;
                    PreparedStatement agentPstmt = null;
                    ResultSet agentRs = null;
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        agentConn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                        String agentSQL = "SELECT * FROM agents WHERE status = 'active' ORDER BY created_at DESC LIMIT 4";
                        agentPstmt = agentConn.prepareStatement(agentSQL);
                        agentRs = agentPstmt.executeQuery();
                        int agentDelay = 1;
                        boolean hasAgents = false;
                        while(agentRs.next()) {
                            hasAgents = true;
                            String agentName = agentRs.getString("name");
                            String specialization = agentRs.getString("specialization");
                            int experience = agentRs.getInt("experience");
                            double rating = agentRs.getDouble("rating");
                            int propertiesSold = agentRs.getInt("properties_sold");
                            String initials = "";
                            String[] nameParts = agentName.split(" ");
                            for (String part : nameParts) {
                                if (part.length() > 0) initials += part.charAt(0);
                            }
                            String specializationCap = specialization.substring(0, 1).toUpperCase() + specialization.substring(1);
                    %>
                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.<%=agentDelay%>s">
                        <div class="team-item rounded overflow-hidden">
                            <div class="position-relative">
                                <%
                                Blob photoBlob = agentRs.getBlob("photo");
                                if (photoBlob != null) {
                                    byte[] imgData = photoBlob.getBytes(1, (int) photoBlob.length());
                                    String base64Image = Base64.getEncoder().encodeToString(imgData);
                                %>
                                <img class="img-fluid" src="data:image/jpeg;base64,<%=base64Image%>" alt="<%=agentName%>" style="height: 300px; width: 100%; object-fit: cover;">
                                <% } else { %>
                                <div style="height: 300px; width: 100%; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); display: flex; align-items: center; justify-content: center; color: white; font-size: 48px; font-weight: 700;">
                                    <%=initials.toUpperCase()%>
                                </div>
                                <% } %>
                                <div class="position-absolute start-50 top-100 translate-middle d-flex align-items-center">
                                    <a class="btn btn-square mx-1" href="#"><i class="fab fa-facebook-f"></i></a>
                                    <a class="btn btn-square mx-1" href="#"><i class="fab fa-twitter"></i></a>
                                    <a class="btn btn-square mx-1" href="#"><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                            <div class="text-center p-4 mt-3">
                                <h5 class="fw-bold mb-0"><%=agentName%></h5>
                                <small class="text-muted"><%=specializationCap%> Specialist</small>
                                <div class="mt-3" style="font-size: 13px; color: #666;">
                                    <div class="mb-1"><i class="fa fa-star text-warning me-1"></i> <%=String.format("%.1f", rating)%> Rating</div>
                                    <div class="mb-1"><i class="fa fa-briefcase text-primary me-1"></i> <%=experience%> Years Exp</div>
                                    <div><i class="fa fa-home text-success me-1"></i> <%=propertiesSold%> Properties Sold</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                            agentDelay += 2;
                        }
                        if (!hasAgents) {
                    %>
                    <div class="col-12 text-center">
                        <div class="alert alert-info"><h5>No agents available</h5><p>Check back soon to meet our team!</p></div>
                    </div>
                    <%
                        }
                    } catch(Exception e) {
                        out.println("<div class='col-12'><div class='alert alert-danger'>Error loading agents: " + e.getMessage() + "</div></div>");
                        e.printStackTrace();
                    } finally {
                        if(agentRs != null) try { agentRs.close(); } catch(SQLException e) {}
                        if(agentPstmt != null) try { agentPstmt.close(); } catch(SQLException e) {}
                        if(agentConn != null) try { agentConn.close(); } catch(SQLException e) {}
                    }
                    %>
                </div>
            </div>
        </div>

        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                    <h1 class="mb-3">Our Clients Say!</h1>
                    <p>Read what our satisfied clients have to say about their experience with Premium Realty.</p>
                </div>
                <div class="owl-carousel testimonial-carousel wow fadeInUp" data-wow-delay="0.1s">
                    <div class="testimonial-item bg-light rounded p-3">
                        <div class="bg-white border rounded p-4">
                            <p>Premium Realty helped me find my dream home. Their professional service made the entire process smooth.</p>
                            <div class="d-flex align-items-center">
                                <img class="img-fluid flex-shrink-0 rounded" src="img/testimonial-1.jpg" style="width: 45px; height: 45px;">
                                <div class="ps-3">
                                    <h6 class="fw-bold mb-1">Rajesh Kumar</h6>
                                    <small>Business Owner</small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="testimonial-item bg-light rounded p-3">
                        <div class="bg-white border rounded p-4">
                            <p>Excellent service! The agents were knowledgeable and patient. They understood my requirements perfectly.</p>
                            <div class="d-flex align-items-center">
                                <img class="img-fluid flex-shrink-0 rounded" src="img/testimonial-2.jpg" style="width: 45px; height: 45px;">
                                <div class="ps-3">
                                    <h6 class="fw-bold mb-1">Priya Sharma</h6>
                                    <small>Software Engineer</small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="testimonial-item bg-light rounded p-3">
                        <div class="bg-white border rounded p-4">
                            <p>I highly recommend Premium Realty. Their transparent approach made my property purchase hassle-free.</p>
                            <div class="d-flex align-items-center">
                                <img class="img-fluid flex-shrink-0 rounded" src="img/testimonial-3.jpg" style="width: 45px; height: 45px;">
                                <div class="ps-3">
                                    <h6 class="fw-bold mb-1">Amit Patel</h6>
                                    <small>Doctor</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container py-5">
                <div class="row g-5">
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-white mb-4">Get In Touch</h5>
                        <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>123 Street, Indore, India</p>
                        <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+91 12345 67890</p>
                        <p class="mb-2"><i class="fa fa-envelope me-3"></i>info@premiumrealty.com</p>
                        <div class="d-flex pt-2">
                            <a class="btn btn-outline-light btn-social" href="#"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-light btn-social" href="#"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light btn-social" href="#"><i class="fab fa-youtube"></i></a>
                            <a class="btn btn-outline-light btn-social" href="#"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-white mb-4">Quick Links</h5>
                        <a class="btn btn-link text-white-50" href="about.jsp">About Us</a>
                        <a class="btn btn-link text-white-50" href="contact.jsp">Contact Us</a>
                        <a class="btn btn-link text-white-50" href="property-list.jsp">Our Services</a>
                        <a class="btn btn-link text-white-50" href="#">Privacy Policy</a>
                        <a class="btn btn-link text-white-50" href="#">Terms & Condition</a>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-white mb-4">Photo Gallery</h5>
                        <div class="row g-2 pt-2">
                            <div class="col-4"><img class="img-fluid rounded bg-light p-1" src="img/property-1.jpg" alt=""></div>
                            <div class="col-4"><img class="img-fluid rounded bg-light p-1" src="img/property-2.jpg" alt=""></div>
                            <div class="col-4"><img class="img-fluid rounded bg-light p-1" src="img/property-3.jpg" alt=""></div>
                            <div class="col-4"><img class="img-fluid rounded bg-light p-1" src="img/property-4.jpg" alt=""></div>
                            <div class="col-4"><img class="img-fluid rounded bg-light p-1" src="img/property-5.jpg" alt=""></div>
                            <div class="col-4"><img class="img-fluid rounded bg-light p-1" src="img/property-6.jpg" alt=""></div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-white mb-4">Newsletter</h5>
                        <p>Subscribe to our newsletter for the latest property updates and exclusive deals.</p>
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
                            &copy; <a class="border-bottom" href="#">Premium Realty</a>, All Right Reserved.
                        </div>
                        <div class="col-md-6 text-center text-md-end">
                            <div class="footer-menu">
                                <a href="index.jsp">Home</a>
                                <a href="#">Cookies</a>
                                <a href="contact.jsp">Help</a>
                                <a href="#">FAQs</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
    <script>
        $(window).on('load', function() {
            $('#spinner').removeClass('show');
        });
        $(document).ready(function() {
            $(window).scroll(function() {
                if ($(this).scrollTop() > 300) {
                    $('.back-to-top').fadeIn('slow');
                } else {
                    $('.back-to-top').fadeOut('slow');
                }
            });
            $('.back-to-top').click(function() {
                $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
                return false;
            });
            if (typeof WOW !== 'undefined') {
                new WOW().init();
            }
            if (typeof $.fn.owlCarousel !== 'undefined') {
                $(".testimonial-carousel").owlCarousel({
                    autoplay: true,
                    smartSpeed: 1000,
                    center: true,
                    margin: 24,
                    dots: true,
                    loop: true,
                    nav: false,
                    responsive: {
                        0: { items: 1 },
                        768: { items: 2 },
                        992: { items: 3 }
                    }
                });
            }
            $('.nav-pills .btn').on('click', function() {
                $('.nav-pills .btn').removeClass('active');
                $(this).addClass('active');
            });
            $(window).scroll(function() {
                if ($(this).scrollTop() > 45) {
                    $('.nav-bar').addClass('sticky-top shadow-sm');
                } else {
                    $('.nav-bar').removeClass('sticky-top shadow-sm');
                }
            });
            $('.dropdown').hover(
                function() { $(this).find('.dropdown-menu').stop(true, true).delay(100).fadeIn(200); },
                function() { $(this).find('.dropdown-menu').stop(true, true).delay(100).fadeOut(200); }
            );
            $('.property-item').hover(
                function() { $(this).find('img').css('transform', 'scale(1.1)'); },
                function() { $(this).find('img').css('transform', 'scale(1)'); }
            );
            $('.footer .btn-primary').click(function(e) {
                e.preventDefault();
                var email = $(this).siblings('input').val();
                if (email && /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
                    alert('Thank you for subscribing!');
                    $(this).siblings('input').val('');
                } else {
                    alert('Please enter a valid email address.');
                }
            });
            $('.cat-item').hover(
                function() { $(this).css({'transform': 'translateY(-10px)', 'box-shadow': '0 10px 20px rgba(0,0,0,0.1)'}); },
                function() { $(this).css({'transform': 'translateY(0)', 'box-shadow': 'none'}); }
            );
            $('.cat-item, .property-item img').css({'transition': 'all 0.3s ease'});
        });
    </script>
</body>
</html>