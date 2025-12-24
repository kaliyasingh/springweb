<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Properties Management - Premium Realty</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f1f5f9;
            min-height: 100vh;
            display: flex;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 260px;
            background: linear-gradient(180deg, #1e293b 0%, #0f172a 100%);
            color: white;
            display: flex;
            flex-direction: column;
            position: fixed;
            height: 100vh;
            left: 0;
            top: 0;
            z-index: 1000;
            overflow-y: auto;
        }

        .sidebar-header {
            padding: 30px 20px;
            text-align: center;
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }

        .sidebar-logo {
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, #10b981 0%, #059669 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 15px;
            font-size: 24px;
            font-weight: 700;
            box-shadow: 0 4px 15px rgba(16, 185, 129, 0.4);
        }

        .sidebar-title {
            font-size: 18px;
            font-weight: 700;
            margin-bottom: 5px;
        }

        .sidebar-subtitle {
            font-size: 13px;
            color: #94a3b8;
        }

        .sidebar-user {
            padding: 20px;
            display: flex;
            align-items: center;
            gap: 12px;
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }

        .user-avatar {
            width: 45px;
            height: 45px;
            background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
            font-weight: 700;
            box-shadow: 0 2px 10px rgba(239, 68, 68, 0.3);
        }

        .user-info h4 {
            font-size: 14px;
            margin-bottom: 3px;
        }

        .user-info p {
            font-size: 12px;
            color: #94a3b8;
        }

        .sidebar-nav {
            flex: 1;
            padding: 20px 0;
        }

        .nav-item {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 14px 20px;
            color: #cbd5e1;
            text-decoration: none;
            transition: all 0.3s;
            cursor: pointer;
            border-left: 3px solid transparent;
        }

        .nav-item:hover {
            background: rgba(255,255,255,0.05);
            color: white;
        }

        .nav-item.active {
            background: rgba(16, 185, 129, 0.15);
            color: #10b981;
            border-left-color: #10b981;
        }

        .nav-icon {
            width: 20px;
            height: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .sidebar-footer {
            padding: 20px;
            border-top: 1px solid rgba(255,255,255,0.1);
        }

        /* Main Content */
        .main-content {
            margin-left: 260px;
            flex: 1;
            padding: 30px;
            width: calc(100% - 260px);
        }

        .page-header {
            background: white;
            padding: 25px 30px;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            margin-bottom: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .breadcrumb {
            font-size: 13px;
            color: #94a3b8;
            margin-bottom: 8px;
        }

        .page-title {
            font-size: 28px;
            color: #1e293b;
            font-weight: 700;
        }

        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 600;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .btn-primary {
            background: linear-gradient(135deg, #10b981 0%, #059669 100%);
            color: white;
            box-shadow: 0 4px 15px rgba(16, 185, 129, 0.3);
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(16, 185, 129, 0.4);
        }

        .btn-edit {
            background: #e0e7ff;
            color: #4f46e5;
            padding: 8px 16px;
            font-size: 13px;
        }

        .btn-edit:hover {
            background: #c7d2fe;
        }

        .btn-delete {
            background: #fee2e2;
            color: #dc2626;
            padding: 8px 16px;
            font-size: 13px;
        }

        .btn-delete:hover {
            background: #fecaca;
        }

        .filters {
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            margin-bottom: 30px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
        }

        .filter-group {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .filter-group label {
            font-size: 13px;
            font-weight: 600;
            color: #475569;
        }

        .filter-group select,
        .filter-group input {
            padding: 10px;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            font-size: 14px;
            outline: none;
        }

        .filter-group select:focus,
        .filter-group input:focus {
            border-color: #10b981;
            box-shadow: 0 0 0 3px rgba(16, 185, 129, 0.1);
        }

        .properties-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 25px;
        }

        .property-card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            transition: all 0.3s;
        }

        .property-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        }

        .property-image {
            position: relative;
            height: 220px;
            overflow: hidden;
            background: #e2e8f0;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .property-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .status-badge {
            position: absolute;
            top: 15px;
            right: 15px;
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 700;
            color: white;
        }

        .status-available { background: #10b981; }
        .status-pending { background: #f59e0b; }
        .status-sold { background: #ef4444; }
        .status-rented { background: #3b82f6; }

        .property-content {
            padding: 20px;
        }

        .property-title {
            font-size: 20px;
            font-weight: 700;
            color: #1e293b;
            margin-bottom: 10px;
        }

        .property-location {
            display: flex;
            align-items: center;
            gap: 6px;
            color: #64748b;
            font-size: 14px;
            margin-bottom: 15px;
        }

        .property-price {
            font-size: 26px;
            font-weight: 800;
            color: #10b981;
            margin-bottom: 15px;
        }

        .property-features {
            display: flex;
            justify-content: space-between;
            padding: 15px 0;
            border-top: 1px solid #e2e8f0;
            border-bottom: 1px solid #e2e8f0;
            margin-bottom: 15px;
            font-size: 13px;
            color: #64748b;
        }

        .property-agent {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 15px;
        }

        .agent-info {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .agent-avatar {
            width: 35px;
            height: 35px;
            border-radius: 50%;
            background: #10b981;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
            font-weight: 700;
        }

        .type-badge {
            background: #f1f5f9;
            color: #64748b;
            padding: 4px 10px;
            border-radius: 6px;
            font-size: 11px;
            font-weight: 600;
        }

        .property-actions {
            display: flex;
            gap: 10px;
        }

        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.6);
            z-index: 2000;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .modal.active {
            display: flex;
        }

        .modal-content {
            background: white;
            border-radius: 16px;
            max-width: 700px;
            width: 100%;
            max-height: 90vh;
            overflow-y: auto;
        }

        .modal-header {
            padding: 25px;
            border-bottom: 1px solid #e2e8f0;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            background: white;
            z-index: 10;
        }

        .modal-header h2 {
            font-size: 24px;
            color: #1e293b;
        }

        .close-btn {
            background: none;
            border: none;
            font-size: 28px;
            cursor: pointer;
            color: #94a3b8;
        }

        .close-btn:hover {
            color: #475569;
        }

        .modal-body {
            padding: 25px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            color: #475569;
            margin-bottom: 8px;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 12px;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            font-size: 14px;
            outline: none;
        }

        .form-group input:focus,
        .form-group select:focus {
            border-color: #10b981;
            box-shadow: 0 0 0 3px rgba(16, 185, 129, 0.1);
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }

        .modal-footer {
            padding: 20px 25px;
            border-top: 1px solid #e2e8f0;
            display: flex;
            gap: 10px;
            justify-content: flex-end;
        }

        .btn-cancel {
            background: white;
            border: 1px solid #e2e8f0;
            color: #64748b;
        }

        .btn-submit {
            background: #10b981;
            color: white;
        }

        .message {
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 8px;
            font-weight: 500;
        }

        .success {
            background: #d1fae5;
            color: #065f46;
            border-left: 4px solid #10b981;
        }

        .error {
            background: #fee2e2;
            color: #991b1b;
            border-left: 4px solid #ef4444;
        }

        .file-upload-wrapper {
            position: relative;
            overflow: hidden;
            display: inline-block;
            width: 100%;
        }

        .file-upload-input {
            position: absolute;
            left: -9999px;
        }

        .file-upload-label {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            padding: 40px 20px;
            border: 2px dashed #e2e8f0;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s;
            background: #f8fafc;
        }

        .file-upload-label:hover {
            border-color: #10b981;
            background: #f0fdf4;
        }

        .file-upload-text {
            color: #64748b;
            font-size: 14px;
        }

        .image-preview {
            margin-top: 15px;
            display: none;
        }

        .image-preview img {
            max-width: 100%;
            max-height: 200px;
            border-radius: 8px;
            border: 1px solid #e2e8f0;
        }

        @media (max-width: 1024px) {
            .sidebar {
                transform: translateX(-100%);
                transition: transform 0.3s;
            }
            
            .sidebar.active {
                transform: translateX(0);
            }
            
            .main-content {
                margin-left: 0;
                width: 100%;
            }
            
            .properties-grid {
                grid-template-columns: 1fr;
            }
            
            .form-row {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
<%
    // Database configuration
    String dbURL = "jdbc:mysql://localhost:3306/ips26mca";
    String dbUser = "root";
    String dbPassword = "root";
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    String message = "";
    String messageType = "";
    
    // Handle multipart form submission
    if (ServletFileUpload.isMultipartContent(request)) {
        try {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setSizeThreshold(1024 * 1024 * 2);
            factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
            
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setFileSizeMax(1024 * 1024 * 5);
            
            List<FileItem> items = upload.parseRequest(request);
            
            String action = "";
            int propertyId = 0;
            String title = "";
            String location = "";
            double price = 0;
            String priceUnit = "Lakh";
            String status = "Available";
            String type = "Villa";
            int bedrooms = 0;
            int bathrooms = 0;
            int squareFeet = 0;
            String agentName = "";
            byte[] imageData = null;
            boolean updateImage = false;
            
            for (FileItem item : items) {
                if (item.isFormField()) {
                    String fieldName = item.getFieldName();
                    String fieldValue = item.getString();
                    
                    switch(fieldName) {
                        case "action": action = fieldValue; break;
                        case "propertyId": 
                            if (fieldValue != null && !fieldValue.isEmpty()) {
                                propertyId = Integer.parseInt(fieldValue); 
                            }
                            break;
                        case "title": title = fieldValue; break;
                        case "location": location = fieldValue; break;
                        case "price": 
                            price = (fieldValue != null && !fieldValue.isEmpty()) ? Double.parseDouble(fieldValue) : 0;
                            break;
                        case "priceUnit": priceUnit = fieldValue; break;
                        case "status": status = fieldValue; break;
                        case "type": type = fieldValue; break;
                        case "beds": 
                            bedrooms = (fieldValue != null && !fieldValue.isEmpty()) ? Integer.parseInt(fieldValue) : 0;
                            break;
                        case "baths": 
                            bathrooms = (fieldValue != null && !fieldValue.isEmpty()) ? Integer.parseInt(fieldValue) : 0;
                            break;
                        case "sqft": 
                            squareFeet = (fieldValue != null && !fieldValue.isEmpty()) ? Integer.parseInt(fieldValue) : 0;
                            break;
                        case "agent": agentName = fieldValue; break;
                    }
                } else {
                    if (item.getSize() > 0) {
                        imageData = item.get();
                        updateImage = true;
                    }
                }
            }
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
            
            if ("add".equals(action)) {
                String sql = "INSERT INTO properties (title, location, price, price_unit, status, type, bedrooms, bathrooms, square_feet, agent_name, image) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, title);
                pstmt.setString(2, location);
                pstmt.setDouble(3, price);
                pstmt.setString(4, priceUnit);
                pstmt.setString(5, status);
                pstmt.setString(6, type);
                pstmt.setInt(7, bedrooms);
                pstmt.setInt(8, bathrooms);
                pstmt.setInt(9, squareFeet);
                pstmt.setString(10, agentName);
                
                if (imageData != null) {
                    pstmt.setBytes(11, imageData);
                } else {
                    pstmt.setNull(11, Types.BLOB);
                }
                
                int rows = pstmt.executeUpdate();
                if (rows > 0) {
                    message = "Property added successfully!";
                    messageType = "success";
                }
            } else if ("edit".equals(action)) {
                String sql;
                if (updateImage) {
                    sql = "UPDATE properties SET title=?, location=?, price=?, price_unit=?, status=?, type=?, bedrooms=?, bathrooms=?, square_feet=?, agent_name=?, image=? WHERE id=?";
                } else {
                    sql = "UPDATE properties SET title=?, location=?, price=?, price_unit=?, status=?, type=?, bedrooms=?, bathrooms=?, square_feet=?, agent_name=? WHERE id=?";
                }
                
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, title);
                pstmt.setString(2, location);
                pstmt.setDouble(3, price);
                pstmt.setString(4, priceUnit);
                pstmt.setString(5, status);
                pstmt.setString(6, type);
                pstmt.setInt(7, bedrooms);
                pstmt.setInt(8, bathrooms);
                pstmt.setInt(9, squareFeet);
                pstmt.setString(10, agentName);
                
                if (updateImage) {
                    pstmt.setBytes(11, imageData);
                    pstmt.setInt(12, propertyId);
                } else {
                    pstmt.setInt(11, propertyId);
                }
                
                int rows = pstmt.executeUpdate();
                if (rows > 0) {
                    message = "Property updated successfully!";
                    messageType = "success";
                }
            }
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
            messageType = "error";
            e.printStackTrace();
        } finally {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    }
    
    // Handle regular POST for delete
    if ("POST".equals(request.getMethod()) && request.getParameter("action") != null && !ServletFileUpload.isMultipartContent(request)) {
        String action = request.getParameter("action");
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
            
            if ("delete".equals(action)) {
                String sql = "DELETE FROM properties WHERE id = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, Integer.parseInt(request.getParameter("id")));
                pstmt.executeUpdate();
                message = "Property deleted successfully!";
                messageType = "success";
            }
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
            messageType = "error";
            e.printStackTrace();
        } finally {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    }
%>

    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <div class="sidebar-logo">PR</div>
            <div class="sidebar-title">Premium Realty</div>
            <div class="sidebar-subtitle">Admin Dashboard</div>
        </div>
        
        <div class="sidebar-user">
            <div class="user-avatar">RR</div>
            <div class="user-info">
                <h4>Ritik Rathore</h4>
                <p>Administrator</p>
            </div>
        </div>
        
        <nav class="sidebar-nav">
            <a href="dashboard" class="nav-item">
                <span class="nav-icon">📊</span>
                <span>Dashboard</span>
            </a>
            <a href="property" class="nav-item active">
                <span class="nav-icon">🏠</span>
                <span>Properties</span>
            </a>
            <a href="agent" class="nav-item">
                <span class="nav-icon">👥</span>
                <span>Agents</span>
            </a>
            <a href="#" class="nav-item">
                <span class="nav-icon">👤</span>
                <span>Clients</span>
            </a>
            <a href="#" class="nav-item">
                <span class="nav-icon">💬</span>
                <span>Inquiries</span>
            </a>
            <a href="#" class="nav-item">
                <span class="nav-icon">💰</span>
                <span>Transactions</span>
            </a>
            <a href="#" class="nav-item">
                <span class="nav-icon">📈</span>
                <span>Reports</span>
            </a>
            <a href="#" class="nav-item">
                <span class="nav-icon">⚙️</span>
                <span>Settings</span>
            </a>
            <a href="admin" class="nav-item">
                <span class="nav-icon">🚪</span>
                <span>Logout</span>
            </a>
        </nav>
        
            
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <% if (!message.isEmpty()) { %>
        <div class="message <%= messageType %>"><%= message %></div>
        <% } %>
        
        <div class="page-header">
            <div>
                <div class="breadcrumb">Home / Properties</div>
                <h1 class="page-title">Properties Management</h1>
            </div>
            <button class="btn btn-primary" onclick="openAddModal()">
                <span>+</span> Add Property
            </button>
        </div>

        <div class="filters">
            <div class="filter-group">
                <label>Status</label>
                <select id="filterStatus" onchange="filterProperties()">
                    <option value="All">All Status</option>
                    <option value="Available">Available</option>
                    <option value="Pending">Pending</option>
                    <option value="Sold">Sold</option>
                    <option value="Rented">Rented</option>
                </select>
            </div>
            <div class="filter-group">
                <label>Type</label>
                <select id="filterType" onchange="filterProperties()">
                    <option value="All">All Types</option>
                    <option value="Villa">Villa</option>
                    <option value="Apartment">Apartment</option>
                    <option value="Commercial">Commercial</option>
                    <option value="House">House</option>
                    <option value="Plot">Plot</option>
                </select>
            </div>
            <div class="filter-group">
                <label>Search</label>
                <input type="text" id="searchInput" placeholder="Search properties..." oninput="filterProperties()">
            </div>
        </div>

        <div class="properties-grid" id="propertiesGrid">
            <%
            Statement stmt = null;
            ResultSet rs = null;
            
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                stmt = conn.createStatement();
                String selectSQL = "SELECT * FROM properties ORDER BY created_at DESC";
                rs = stmt.executeQuery(selectSQL);
                
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String title = rs.getString("title");
                    String location = rs.getString("location");
                    double price = rs.getDouble("price");
                    String priceUnit = rs.getString("price_unit");
                    String status = rs.getString("status");
                    String type = rs.getString("type");
                    int bedrooms = rs.getInt("bedrooms");
                    int bathrooms = rs.getInt("bathrooms");
                    int squareFeet = rs.getInt("square_feet");
                    String agentName = rs.getString("agent_name");
                    
                    String[] nameParts = agentName.split(" ");
                    String initials = "";
                    for (String part : nameParts) {
                        if (part.length() > 0) {
                            initials += part.charAt(0);
                        }
                    }
            %>
            <div class="property-card" data-status="<%= status %>" data-type="<%= type %>" data-title="<%= title.toLowerCase() %>" data-location="<%= location.toLowerCase() %>">
                <div class="property-image">
                    <% 
                    Blob imageBlob = rs.getBlob("image");
                    if (imageBlob != null) {
                        byte[] imgData = imageBlob.getBytes(1, (int) imageBlob.length());
                        String base64Image = Base64.getEncoder().encodeToString(imgData);
                    %>
                    <img src="data:image/jpeg;base64,<%= base64Image %>" alt="<%= title %>">
                    <% } else { %>
                    <img src="https://via.placeholder.com/400x300?text=No+Image" alt="<%= title %>">
                    <% } %>
                    <span class="status-badge status-<%= status.toLowerCase() %>"><%= status %></span>
                </div>
                <div class="property-content">
                    <h3 class="property-title"><%= title %></h3>
                    <div class="property-location">
                        <svg width="16" height="16" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
                        </svg>
                        <%= location %>
                    </div>
                    <div class="property-price">₹<%= String.format("%.2f", price) %> <%= priceUnit %></div>
                    <div class="property-features">
                        <% if (bedrooms > 0) { %>
                        <div><svg width="16" height="16" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"></path></svg> <%= bedrooms %> Beds</div>
                        <% } %>
                        <div><svg width="16" height="16" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"></path></svg> <%= bathrooms %> Bath</div>
                        <div><svg width="16" height="16" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 5a1 1 0 011-1h14a1 1 0 011 1v2a1 1 0 01-1 1H5a1 1 0 01-1-1V5zM4 13a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H5a1 1 0 01-1-1v-6zM16 13a1 1 0 011-1h2a1 1 0 011 1v6a1 1 0 01-1 1h-2a1 1 0 01-1-1v-6z"></path></svg> <%= squareFeet %> sqft</div>
                    </div>
                    <div class="property-agent">
                        <div class="agent-info">
                            <div class="agent-avatar"><%= initials.toUpperCase() %></div>
                            <span><%= agentName %></span>
                        </div>
                        <span class="type-badge"><%= type %></span>
                    </div>
                    <div class="property-actions">
                        <button class="btn btn-edit" onclick='openEditModal(<%= id %>, "<%= title.replace("\"", "\\\"") %>", "<%= location.replace("\"", "\\\"") %>", <%= price %>, "<%= priceUnit %>", "<%= status %>", "<%= type %>", <%= bedrooms %>, <%= bathrooms %>, <%= squareFeet %>, "<%= agentName.replace("\"", "\\\"") %>")'>
                            Edit
                        </button>
                        <form method="POST" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this property?');">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="id" value="<%= id %>">
                            <button type="submit" class="btn btn-delete">Delete</button>
                        </form>
                    </div>
                </div>
            </div>
            <%
                }
            } catch (Exception e) {
                out.println("<div class='message error'>Error loading properties: " + e.getMessage() + "</div>");
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
            %>
        </div>
    </div>

    <!-- Add/Edit Property Modal -->
    <div class="modal" id="propertyModal">
        <div class="modal-content">
            <div class="modal-header">
                <h2 id="modalTitle">Add New Property</h2>
                <button class="close-btn" onclick="closeModal()">&times;</button>
            </div>
            <form method="POST" enctype="multipart/form-data" id="propertyForm">
                <input type="hidden" name="action" id="formAction" value="add">
                <input type="hidden" name="propertyId" id="propertyId" value="">
                <div class="modal-body">
                    <div class="form-group">
                        <label>Property Image</label>
                        <div class="file-upload-wrapper">
                            <input type="file" name="image" id="imageUpload" class="file-upload-input" accept="image/*" onchange="previewImage(event)">
                            <label for="imageUpload" class="file-upload-label">
                                <svg width="24" height="24" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12"></path>
                                </svg>
                                <div>
                                    <div class="file-upload-text">Click to upload image</div>
                                    <div style="font-size: 12px; color: #94a3b8;">PNG, JPG up to 5MB</div>
                                </div>
                            </label>
                        </div>
                        <div class="image-preview" id="imagePreview">
                            <img id="previewImg" src="" alt="Preview">
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Title *</label>
                        <input type="text" name="title" id="title" required placeholder="Enter property title">
                    </div>
                    <div class="form-group">
                        <label>Location *</label>
                        <input type="text" name="location" id="location" required placeholder="e.g., Arera Colony, Bhopal, MP">
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label>Price *</label>
                            <input type="number" name="price" id="price" step="0.01" required placeholder="Enter price">
                        </div>
                        <div class="form-group">
                            <label>Price Unit</label>
                            <select name="priceUnit" id="priceUnit">
                                <option value="Lakh">Lakh</option>
                                <option value="Crore">Crore</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label>Status</label>
                            <select name="status" id="status">
                                <option value="Available">Available</option>
                                <option value="Pending">Pending</option>
                                <option value="Sold">Sold</option>
                                <option value="Rented">Rented</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Type</label>
                            <select name="type" id="type">
                                <option value="Villa">Villa</option>
                                <option value="Apartment">Apartment</option>
                                <option value="Commercial">Commercial</option>
                                <option value="House">House</option>
                                <option value="Plot">Plot</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label>Bedrooms</label>
                            <input type="number" name="beds" id="beds" value="0" min="0">
                        </div>
                        <div class="form-group">
                            <label>Bathrooms</label>
                            <input type="number" name="baths" id="baths" value="0" min="0">
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Square Feet *</label>
                        <input type="number" name="sqft" id="sqft" required placeholder="Enter area in sq ft">
                    </div>
                    <div class="form-group">
                        <label>Agent Name *</label>
                        <input type="text" name="agent" id="agent" required placeholder="Enter agent name">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-cancel" onclick="closeModal()">Cancel</button>
                    <button type="submit" class="btn btn-submit" id="submitBtn">Save Property</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        function openAddModal() {
            document.getElementById('modalTitle').textContent = 'Add New Property';
            document.getElementById('formAction').value = 'add';
            document.getElementById('submitBtn').textContent = 'Save Property';
            document.getElementById('propertyForm').reset();
            document.getElementById('propertyId').value = '';
            document.getElementById('imagePreview').style.display = 'none';
            document.getElementById('propertyModal').classList.add('active');
        }

        function openEditModal(id, title, location, price, priceUnit, status, type, beds, baths, sqft, agent) {
            document.getElementById('modalTitle').textContent = 'Edit Property';
            document.getElementById('formAction').value = 'edit';
            document.getElementById('submitBtn').textContent = 'Update Property';
            document.getElementById('propertyId').value = id;
            document.getElementById('title').value = title;
            document.getElementById('location').value = location;
            document.getElementById('price').value = price;
            document.getElementById('priceUnit').value = priceUnit;
            document.getElementById('status').value = status;
            document.getElementById('type').value = type;
            document.getElementById('beds').value = beds;
            document.getElementById('baths').value = baths;
            document.getElementById('sqft').value = sqft;
            document.getElementById('agent').value = agent;
            document.getElementById('imagePreview').style.display = 'none';
            document.getElementById('propertyModal').classList.add('active');
        }

        function closeModal() {
            document.getElementById('propertyModal').classList.remove('active');
            document.getElementById('imagePreview').style.display = 'none';
        }

        document.getElementById('propertyModal').addEventListener('click', function(e) {
            if (e.target === this) closeModal();
        });

        function previewImage(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('previewImg').src = e.target.result;
                    document.getElementById('imagePreview').style.display = 'block';
                }
                reader.readAsDataURL(file);
            }
        }

        function filterProperties() {
            const status = document.getElementById('filterStatus').value;
            const type = document.getElementById('filterType').value;
            const search = document.getElementById('searchInput').value.toLowerCase();
            
            document.querySelectorAll('.property-card').forEach(card => {
                const cardStatus = card.getAttribute('data-status');
                const cardType = card.getAttribute('data-type');
                const cardTitle = card.getAttribute('data-title');
                const cardLocation = card.getAttribute('data-location');
                
                const matchStatus = status === 'All' || cardStatus === status;
                const matchType = type === 'All' || cardType === type;
                const matchSearch = search === '' || cardTitle.includes(search) || cardLocation.includes(search);
                
                if (matchStatus && matchType && matchSearch) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
        }
    </script>
</body>
</html>