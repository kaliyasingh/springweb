<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Property Details - Real Estate</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            color: #333;
        }

        .header {
            background-color: white;
            padding: 20px 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 24px;
            font-weight: bold;
        }

        .logo-icon {
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg, #00d4aa, #00a885);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
        }

        .nav {
            display: flex;
            gap: 30px;
            align-items: center;
        }

        .nav a {
            text-decoration: none;
            color: #333;
            font-weight: 500;
            transition: color 0.3s;
        }

        .nav a:hover {
            color: #00d4aa;
        }

        .login-btn {
            background-color: #00d4aa;
            color: white;
            padding: 10px 25px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 600;
        }

        .container {
            max-width: 1400px;
            margin: 30px auto;
            padding: 0 20px;
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            color: #00d4aa;
            text-decoration: none;
            margin-bottom: 20px;
            font-weight: 500;
        }

        .gallery {
            display: grid;
            grid-template-columns: 2fr 1fr;
            grid-template-rows: 400px 200px;
            gap: 10px;
            margin-bottom: 30px;
        }

        .main-image {
            grid-row: 1 / 3;
            background-size: cover;
            background-position: center;
            border-radius: 10px;
            position: relative;
            overflow: hidden;
            cursor: zoom-in;
            transition: opacity 0.3s;
        }

        .gallery-item {
            background-color: #ddd;
            border-radius: 10px;
            background-size: cover;
            background-position: center;
            cursor: pointer;
            transition: transform 0.3s, border 0.3s;
            border: 3px solid transparent;
        }

        .gallery-item:hover {
            transform: scale(1.05);
        }

        .gallery-item.selected {
            border: 3px solid #00d4aa;
        }

        .for-sell-badge {
            position: absolute;
            top: 20px;
            left: 20px;
            background-color: #00d4aa;
            color: white;
            padding: 8px 20px;
            border-radius: 5px;
            font-weight: 600;
            z-index: 10;
        }

        .image-counter {
            position: absolute;
            bottom: 20px;
            right: 20px;
            background-color: rgba(0, 0, 0, 0.7);
            color: white;
            padding: 8px 15px;
            border-radius: 5px;
            font-size: 14px;
            z-index: 10;
        }

        /* Image Modal */
        .modal {
            display: none;
            position: fixed;
            z-index: 2000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.95);
            animation: fadeIn 0.3s;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .modal-content {
            position: relative;
            margin: auto;
            display: block;
            max-width: 90%;
            max-height: 85vh;
            top: 50%;
            transform: translateY(-50%);
            border-radius: 10px;
        }

        .close {
            position: absolute;
            top: 20px;
            right: 40px;
            color: #fff;
            font-size: 50px;
            font-weight: bold;
            cursor: pointer;
            z-index: 2001;
            transition: color 0.3s;
        }

        .close:hover {
            color: #00d4aa;
        }

        .modal-nav {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background-color: rgba(0, 212, 170, 0.8);
            color: white;
            padding: 20px 15px;
            cursor: pointer;
            border: none;
            font-size: 24px;
            transition: background-color 0.3s;
            z-index: 2001;
        }

        .modal-nav:hover {
            background-color: rgba(0, 212, 170, 1);
        }

        .modal-prev {
            left: 20px;
            border-radius: 0 5px 5px 0;
        }

        .modal-next {
            right: 20px;
            border-radius: 5px 0 0 5px;
        }

        .content-grid {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 30px;
        }

        .main-content {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .sidebar {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            height: fit-content;
            position: sticky;
            top: 20px;
        }

        .price {
            font-size: 36px;
            color: #00d4aa;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .property-title {
            font-size: 28px;
            margin-bottom: 10px;
            color: #1a1a1a;
        }

        .property-location {
            color: #666;
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 16px;
        }

        .features {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            padding: 25px;
            background-color: #f9f9f9;
            border-radius: 10px;
            margin: 25px 0;
        }

        .feature-item {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }

        .feature-icon {
            width: 50px;
            height: 50px;
            background-color: #00d4aa;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 10px;
            color: white;
            font-size: 20px;
        }

        .feature-value {
            font-weight: bold;
            font-size: 18px;
            color: #1a1a1a;
        }

        .feature-label {
            color: #666;
            font-size: 14px;
        }

        .section {
            margin: 30px 0;
        }

        .section-title {
            font-size: 22px;
            margin-bottom: 15px;
            color: #1a1a1a;
            border-bottom: 2px solid #00d4aa;
            padding-bottom: 10px;
        }

        .description {
            line-height: 1.8;
            color: #555;
        }

        .map {
            width: 100%;
            height: 400px;
            border-radius: 10px;
            overflow: hidden;
            border: 2px solid #e0e0e0;
        }

        .agent-card {
            text-align: center;
        }

        .agent-avatar {
            width: 100px;
            height: 100px;
            background: linear-gradient(135deg, #00d4aa, #00a885);
            border-radius: 50%;
            margin: 0 auto 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 40px;
            border: 3px solid #f0f0f0;
        }

        .agent-name {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .agent-title {
            color: #666;
            margin-bottom: 20px;
        }

        .contact-btn {
            width: 100%;
            padding: 15px;
            background-color: #00d4aa;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            margin-bottom: 10px;
            transition: background-color 0.3s;
        }

        .contact-btn:hover {
            background-color: #00a885;
        }

        .contact-btn.secondary {
            background-color: white;
            color: #00d4aa;
            border: 2px solid #00d4aa;
        }

        .contact-btn.secondary:hover {
            background-color: #f0f0f0;
        }

        .property-details-list {
            display: flex;
            flex-direction: column;
            gap: 12px;
            font-size: 14px;
        }

        .detail-item {
            display: flex;
            justify-content: space-between;
            padding: 8px 0;
            border-bottom: 1px solid #eee;
        }

        .detail-label {
            color: #666;
        }

        .detail-value {
            font-weight: 600;
        }

        @media (max-width: 968px) {
            .content-grid {
                grid-template-columns: 1fr;
            }
            .gallery {
                grid-template-columns: 1fr;
                grid-template-rows: 300px 150px 150px;
            }
            .main-image {
                grid-row: 1;
            }
            .features {
                grid-template-columns: repeat(2, 1fr);
            }
        }
    </style>
</head>
<body>
    <%
    // Get property ID from URL
    String propertyId = request.getParameter("id");
    
    // Database configuration
    String dbURL = "jdbc:mysql://localhost:3306/ips26mca";
    String dbUser = "root";
    String dbPassword = "root";
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    // Property data variables
    String title = "";
    String location = "";
    double price = 0;
    String priceUnit = "";
    String status = "";
    String type = "";
    int bedrooms = 0;
    int bathrooms = 0;
    int squareFeet = 0;
    String agentName = "";
    String description = "";
    String imageBase64 = "";
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
        
        String sql = "SELECT * FROM properties WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, propertyId);
        rs = pstmt.executeQuery();
        
        if (rs.next()) {
            title = rs.getString("title");
            location = rs.getString("location");
            price = rs.getDouble("price");
            priceUnit = rs.getString("price_unit");
            status = rs.getString("status");
            type = rs.getString("type");
            bedrooms = rs.getInt("bedrooms");
            bathrooms = rs.getInt("bathrooms");
            squareFeet = rs.getInt("square_feet");
            agentName = rs.getString("agent_name");
            description = rs.getString("description");
            
            Blob imageBlob = rs.getBlob("image");
            if (imageBlob != null) {
                byte[] imgData = imageBlob.getBytes(1, (int) imageBlob.length());
                imageBase64 = Base64.getEncoder().encodeToString(imgData);
            }
        }
    } catch (Exception e) {
        out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
        e.printStackTrace();
    }
    %>

    <!-- Header -->
    <div class="header">
        <div class="logo">
            <div class="logo-icon">
                <i class="fas fa-home"></i>
            </div>
            <span>Premium Realty</span>
        </div>
        <nav class="nav">
            <a href="index.jsp">HOME</a>
            <a href="about.jsp">ABOUT</a>
            <a href="property-list.jsp">PROPERTY</a>
            <a href="pages.jsp">PAGES</a>
            <a href="contact.jsp">CONTACT</a>
            <a href="login.jsp" class="login-btn">Login</a>
        </nav>
    </div>

    <!-- Main Content -->
    <div class="container">
        <a href="property-list.jsp" class="back-link">
            <i class="fas fa-arrow-left"></i> Back to listings
        </a>

        <!-- Image Gallery -->
        <div class="gallery">
            <div class="main-image" id="mainImage" 
                 style="background-image: url('data:image/jpeg;base64,<%= imageBase64 %>')">
                <div class="for-sell-badge"><%= status %></div>
                <div class="image-counter"><i class="fas fa-images"></i> 1 / 1</div>
            </div>
            <div class="gallery-item selected" 
                 style="background-image: url('data:image/jpeg;base64,<%= imageBase64 %>')"></div>
        </div>

        <!-- Image Modal -->
        <div id="imageModal" class="modal">
            <span class="close">&times;</span>
            <button class="modal-nav modal-prev"><i class="fas fa-chevron-left"></i></button>
            <img class="modal-content" id="modalImage">
            <button class="modal-nav modal-next"><i class="fas fa-chevron-right"></i></button>
        </div>

        <!-- Content Grid -->
        <div class="content-grid">
            <!-- Main Content -->
            <div class="main-content">
                <div class="property-header">
                    <div class="price">₹<%= String.format("%.2f", price) %> <%= priceUnit %></div>
                    <h1 class="property-title"><%= title %></h1>
                    <div class="property-location">
                        <i class="fas fa-map-marker-alt"></i> <%= location %>
                    </div>
                </div>

                <!-- Features -->
                <div class="features">
                    <div class="feature-item">
                        <div class="feature-icon">
                            <i class="fas fa-ruler-combined"></i>
                        </div>
                        <div class="feature-value"><%= squareFeet %></div>
                        <div class="feature-label">Sqft</div>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon">
                            <i class="fas fa-bed"></i>
                        </div>
                        <div class="feature-value"><%= bedrooms %></div>
                        <div class="feature-label">Bedrooms</div>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon">
                            <i class="fas fa-bath"></i>
                        </div>
                        <div class="feature-value"><%= bathrooms %></div>
                        <div class="feature-label">Bathrooms</div>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon">
                            <i class="fas fa-car"></i>
                        </div>
                        <div class="feature-value">2</div>
                        <div class="feature-label">Garage</div>
                    </div>
                </div>

                <!-- Description -->
                <div class="section">
                    <h2 class="section-title">Property Description</h2>
                    <div class="description">
                        <p><%= description != null ? description : "Beautiful property with modern amenities and excellent location." %></p>
                    </div>
                </div>

                <!-- Location Map -->
                <div class="section">
                    <h2 class="section-title">Location</h2>
                    <div class="map">
                        <iframe 
                            width="100%" 
                            height="400" 
                            frameborder="0" 
                            style="border:0;" 
                            src="https://www.google.com/maps/embed/v1/place?key=YOUR_API_KEY&q=<%= location.replace(" ", "+") %>"
                            allowfullscreen>
                        </iframe>
                    </div>
                </div>
            </div>

            <!-- Sidebar -->
            <div class="sidebar">
                <div class="agent-card">
                    <div class="agent-avatar">
                        <i class="fas fa-user"></i>
                    </div>
                    <div class="agent-name"><%= agentName %></div>
                    <div class="agent-title">Real Estate Agent</div>
                    <button class="contact-btn">
                        <i class="fas fa-calendar-check"></i> Schedule Tour
                    </button>
                    <button class="contact-btn secondary">
                        <i class="fas fa-comment-dots"></i> Contact Agent
                    </button>
                </div>

                <div class="section" style="margin-top: 30px;">
                    <h3 style="font-size: 18px; margin-bottom: 15px;">Property Details</h3>
                    <div class="property-details-list">
                        <div class="detail-item">
                            <span class="detail-label"><i class="fas fa-hashtag"></i> Property ID:</span>
                            <span class="detail-value">#<%= propertyId %></span>
                        </div>
                        <div class="detail-item">
                            <span class="detail-label"><i class="fas fa-building"></i> Property Type:</span>
                            <span class="detail-value"><%= type %></span>
                        </div>
                        <div class="detail-item">
                            <span class="detail-label"><i class="fas fa-calendar"></i> Year Built:</span>
                            <span class="detail-value">2020</span>
                        </div>
                        <div class="detail-item">
                            <span class="detail-label"><i class="fas fa-info-circle"></i> Status:</span>
                            <span class="detail-value" style="color: #00d4aa;"><%= status %></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Get the modal
        const modal = document.getElementById('imageModal');
        const modalImg = document.getElementById('modalImage');
        const mainImage = document.getElementById('mainImage');
        const closeBtn = document.getElementsByClassName('close')[0];

        // Open modal when main image is clicked
        mainImage.onclick = function() {
            modal.style.display = 'block';
            const bgImage = this.style.backgroundImage;
            const url = bgImage.slice(5, -2);
            modalImg.src = url;
        }

        // Close modal
        closeBtn.onclick = function() {
            modal.style.display = 'none';
        }

        // Close modal when clicking outside image
        modal.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = 'none';
            }
        }

        // Close modal with Escape key
        document.addEventListener('keydown', function(event) {
            if (event.key === 'Escape') {
                modal.style.display = 'none';
            }
        });

        // Gallery navigation
        const galleryItems = document.querySelectorAll('.gallery-item');
        galleryItems.forEach(item => {
            item.addEventListener('click', function() {
                galleryItems.forEach(i => i.classList.remove('selected'));
                this.classList.add('selected');
                const clickedBg = this.style.backgroundImage;
                mainImage.style.backgroundImage = clickedBg;
            });
        });
    </script>

    <%
    // Close database resources
    if (rs != null) try { rs.close(); } catch(Exception e) {}
    if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
    if (conn != null) try { conn.close(); } catch(Exception e) {}
    %>
</body>
</html>