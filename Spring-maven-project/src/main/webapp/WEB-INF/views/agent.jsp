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
    <title>Agent Management - Premium Realty</title>
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
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
        }

        .btn-secondary {
            background: #ecf0f1;
            color: #2c3e50;
        }

        .btn-edit {
            background: #e0e7ff;
            color: #4f46e5;
            padding: 8px 16px;
            font-size: 13px;
        }

        .btn-delete {
            background: #fee2e2;
            color: #dc2626;
            padding: 8px 16px;
            font-size: 13px;
        }

        /* Stats Grid */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .stat-card {
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
            border-left: 4px solid;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.12);
        }

        .stat-card.blue { border-left-color: #3498db; }
        .stat-card.green { border-left-color: #27ae60; }
        .stat-card.orange { border-left-color: #f39c12; }
        .stat-card.purple { border-left-color: #9b59b6; }

        .stat-number {
            font-size: 36px;
            font-weight: 700;
            color: #2c3e50;
            margin-bottom: 8px;
        }

        .stat-label {
            color: #7f8c8d;
            font-size: 14px;
            margin-bottom: 10px;
        }

        .stat-change {
            font-size: 12px;
            padding: 4px 10px;
            border-radius: 20px;
            display: inline-block;
            background-color: #d5f4e6;
            color: #27ae60;
        }

        /* Filters */
        .filters {
            background: white;
            padding: 25px;
            border-radius: 15px;
            margin-bottom: 25px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
        }

        .filters-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 15px;
        }

        .filter-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #2c3e50;
            font-size: 14px;
        }

        .filter-group input,
        .filter-group select {
            width: 100%;
            padding: 12px;
            border: 2px solid #ecf0f1;
            border-radius: 8px;
            font-size: 14px;
            transition: border-color 0.3s ease;
            outline: none;
        }

        .filter-group input:focus,
        .filter-group select:focus {
            border-color: #3498db;
        }

        /* Agents Grid */
        .agents-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 25px;
        }

        .agent-card {
            background: white;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
            position: relative;
        }

        .agent-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 30px rgba(0,0,0,0.15);
        }

        .agent-header {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .agent-photo {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            font-size: 28px;
            margin-right: 15px;
            border: 3px solid #f0f0f0;
            overflow: hidden;
        }

        .agent-photo img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .agent-info h3 {
            color: #2c3e50;
            margin-bottom: 5px;
            font-size: 18px;
        }

        .agent-specialty {
            color: #7f8c8d;
            font-size: 13px;
        }

        .agent-status {
            position: absolute;
            top: 20px;
            right: 20px;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 600;
            text-transform: uppercase;
        }

        .status-active {
            background-color: #d5f4e6;
            color: #27ae60;
        }

        .status-inactive {
            background-color: #fadbd8;
            color: #e74c3c;
        }

        .agent-stats {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 12px;
            margin: 20px 0;
        }

        .stat-item {
            text-align: center;
            padding: 15px;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            border-radius: 10px;
        }

        .stat-value {
            font-size: 20px;
            font-weight: 700;
            color: #2c3e50;
        }

        .stat-label-small {
            font-size: 11px;
            color: #7f8c8d;
            margin-top: 5px;
        }

        .agent-details {
            margin: 15px 0;
            font-size: 13px;
            color: #7f8c8d;
            line-height: 1.8;
        }

        .agent-actions {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
            margin-top: 20px;
        }

        .action-btn {
            padding: 10px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 13px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .action-btn:hover {
            opacity: 0.85;
            transform: translateY(-2px);
        }

        /* Modal */
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
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 16px 16px 0 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .modal-header h2 {
            font-size: 24px;
        }

        .close-btn {
            background: none;
            border: none;
            font-size: 28px;
            cursor: pointer;
            color: white;
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
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
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
            background: #f8f9fa;
            border-radius: 0 0 16px 16px;
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
            border-color: #667eea;
            background: #f0f4ff;
        }

        .image-preview {
            margin-top: 15px;
            display: none;
            text-align: center;
        }

        .image-preview img {
            max-width: 150px;
            max-height: 150px;
            border-radius: 50%;
            border: 3px solid #e2e8f0;
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
            
            .agents-grid {
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
            int agentId = 0;
            String name = "";
            String email = "";
            String phone = "";
            String specialization = "";
            int experience = 0;
            String status = "active";
            String territory = "";
            int propertiesSold = 0;
            double commission = 0;
            double rating = 4.0;
            byte[] imageData = null;
            boolean updateImage = false;
            
            for (FileItem item : items) {
                if (item.isFormField()) {
                    String fieldName = item.getFieldName();
                    String fieldValue = item.getString();
                    
                    switch(fieldName) {
                        case "action": action = fieldValue; break;
                        case "agentId": 
                            if (!fieldValue.isEmpty()) {
                                agentId = Integer.parseInt(fieldValue); 
                            }
                            break;
                        case "name": name = fieldValue; break;
                        case "email": email = fieldValue; break;
                        case "phone": phone = fieldValue; break;
                        case "specialization": specialization = fieldValue; break;
                        case "experience": experience = Integer.parseInt(fieldValue); break;
                        case "status": status = fieldValue; break;
                        case "territory": territory = fieldValue; break;
                        case "propertiesSold": propertiesSold = Integer.parseInt(fieldValue); break;
                        case "commission": commission = Double.parseDouble(fieldValue); break;
                        case "rating": rating = Double.parseDouble(fieldValue); break;
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
                String sql = "INSERT INTO agents (name, email, phone, specialization, experience, status, territory, properties_sold, commission, rating, photo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, name);
                pstmt.setString(2, email);
                pstmt.setString(3, phone);
                pstmt.setString(4, specialization);
                pstmt.setInt(5, experience);
                pstmt.setString(6, status);
                pstmt.setString(7, territory);
                pstmt.setInt(8, propertiesSold);
                pstmt.setDouble(9, commission);
                pstmt.setDouble(10, rating);
                
                if (imageData != null) {
                    pstmt.setBytes(11, imageData);
                } else {
                    pstmt.setNull(11, Types.BLOB);
                }
                
                int rows = pstmt.executeUpdate();
                if (rows > 0) {
                    message = "Agent added successfully!";
                    messageType = "success";
                }
            } else if ("edit".equals(action)) {
                String sql;
                if (updateImage) {
                    sql = "UPDATE agents SET name=?, email=?, phone=?, specialization=?, experience=?, status=?, territory=?, properties_sold=?, commission=?, rating=?, photo=? WHERE id=?";
                } else {
                    sql = "UPDATE agents SET name=?, email=?, phone=?, specialization=?, experience=?, status=?, territory=?, properties_sold=?, commission=?, rating=? WHERE id=?";
                }
                
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, name);
                pstmt.setString(2, email);
                pstmt.setString(3, phone);
                pstmt.setString(4, specialization);
                pstmt.setInt(5, experience);
                pstmt.setString(6, status);
                pstmt.setString(7, territory);
                pstmt.setInt(8, propertiesSold);
                pstmt.setDouble(9, commission);
                pstmt.setDouble(10, rating);
                
                if (updateImage) {
                    pstmt.setBytes(11, imageData);
                    pstmt.setInt(12, agentId);
                } else {
                    pstmt.setInt(11, agentId);
                }
                
                int rows = pstmt.executeUpdate();
                if (rows > 0) {
                    message = "Agent updated successfully!";
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
                String sql = "DELETE FROM agents WHERE id = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, Integer.parseInt(request.getParameter("id")));
                pstmt.executeUpdate();
                message = "Agent deleted successfully!";
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
    
    // Calculate statistics
    int totalAgents = 0;
    int activeAgents = 0;
    double totalCommission = 0;
    double avgPerformance = 0;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
        
        Statement statsStmt = conn.createStatement();
        ResultSet statsRs = statsStmt.executeQuery("SELECT COUNT(*) as total, SUM(CASE WHEN status='active' THEN 1 ELSE 0 END) as active, SUM(commission) as total_comm, AVG(rating)*20 as avg_perf FROM agents");
        if (statsRs.next()) {
            totalAgents = statsRs.getInt("total");
            activeAgents = statsRs.getInt("active");
            totalCommission = statsRs.getDouble("total_comm");
            avgPerformance = statsRs.getDouble("avg_perf");
        }
        statsRs.close();
        statsStmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
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
                <h4>saliha khan</h4>
                <p>Administrator</p>
            </div>
        </div>
        
        <nav class="sidebar-nav">
            <a href="dashboard" class="nav-item">
                <span class="nav-icon">📊</span>
                <span>Dashboard</span>
            </a>
            <a href="property" class="nav-item">
                <span class="nav-icon">🏠</span>
                <span>Properties</span>
            </a>
            <a href="agent" class="nav-item active">
                <span class="nav-icon">👥</span>
                <span>Agents</span>
            </a>
            <a href="#" class="nav-item">
                <span class="nav-icon">👤</span>
                <span>Clients</span>
            </a>
            <a href="#" class="nav-item">
                <span class="nav-icon">📈</span>
                <span>Reports</span>
            </a>
            
        </nav>
        
        <div class="sidebar-footer">
            <a href="#" class="nav-item">
                <span class="nav-icon">🚪</span>
                <span>Logout</span>
            </a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <% if (!message.isEmpty()) { %>
        <div class="message <%= messageType %>"><%= message %></div>
        <% } %>
        
        <div class="page-header">
            <div>
                <div class="breadcrumb">Home / Agents</div>
                <h1 class="page-title">Agent Management</h1>
            </div>
            <button class="btn btn-primary" onclick="openAddModal()">
                <span>+</span> Add Agent
            </button>
        </div>

        <!-- Stats -->
        <div class="stats-grid">
            <div class="stat-card blue">
                <div class="stat-number"><%= totalAgents %></div>
                <div class="stat-label">Total Agents</div>
                <div class="stat-change">↑ 12% this month</div>
            </div>
            <div class="stat-card green">
                <div class="stat-number"><%= activeAgents %></div>
                <div class="stat-label">Active Agents</div>
                <div class="stat-change">↑ 5% this month</div>
            </div>
            <div class="stat-card orange">
                <div class="stat-number">₹<%= String.format("%.1f", totalCommission/100000) %>L</div>
                <div class="stat-label">Monthly Commission</div>
                <div class="stat-change">↑ 28% this month</div>
            </div>
            <div class="stat-card purple">
                <div class="stat-number"><%= String.format("%.0f", avgPerformance) %>%</div>
                <div class="stat-label">Avg Performance</div>
                <div class="stat-change">↑ 8% this month</div>
            </div>
        </div>

        <!-- Filters -->
        <div class="filters">
            <div class="filters-grid">
                <div class="filter-group">
                    <label for="statusFilter">Status</label>
                    <select id="statusFilter" onchange="filterAgents()">
                        <option value="all">All Agents</option>
                        <option value="active">Active Only</option>
                        <option value="inactive">Inactive Only</option>
                    </select>
                </div>
                <div class="filter-group">
                    <label for="specialtyFilter">Specialization</label>
                    <select id="specialtyFilter" onchange="filterAgents()">
                        <option value="all">All Specializations</option>
                        <option value="residential">Residential</option>
                        <option value="commercial">Commercial</option>
                        <option value="luxury">Luxury Properties</option>
                    </select>
                </div>
                <div class="filter-group">
                    <label for="searchInput">Search</label>
                    <input type="text" id="searchInput" placeholder="Search by name..." oninput="filterAgents()">
                </div>
            </div>
        </div>

        <!-- Agents Grid -->
        <div class="agents-grid" id="agentsGrid">
            <%
            Statement stmt = null;
            ResultSet rs = null;
            
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                stmt = conn.createStatement();
                String selectSQL = "SELECT * FROM agents ORDER BY created_at DESC";
                rs = stmt.executeQuery(selectSQL);
                
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
                    double commission = rs.getDouble("commission");
                    double rating = rs.getDouble("rating");
                    
                    String initials = "";
                    String[] nameParts = name.split(" ");
                    for (String part : nameParts) {
                        if (part.length() > 0) {
                            initials += part.charAt(0);
                        }
                    }
                    
                    String specializationCap = specialization.substring(0, 1).toUpperCase() + specialization.substring(1);
            %>
            <div class="agent-card" data-status="<%= status %>" data-specialization="<%= specialization %>" data-name="<%= name.toLowerCase() %>">
                <div class="agent-status status-<%= status %>"><%= status %></div>
                <div class="agent-header">
                    <div class="agent-photo">
                        <% 
                        Blob photoBlob = rs.getBlob("photo");
                        if (photoBlob != null) {
                            byte[] imgData = photoBlob.getBytes(1, (int) photoBlob.length());
                            String base64Image = Base64.getEncoder().encodeToString(imgData);
                        %>
                        <img src="data:image/jpeg;base64,<%= base64Image %>" alt="<%= name %>">
                        <% } else { %>
                        <%= initials.toUpperCase() %>
                        <% } %>
                    </div>
                    <div class="agent-info">
                        <h3><%= name %></h3>
                        <div class="agent-specialty"><%= specializationCap %> Specialist</div>
                        <div class="agent-specialty">⭐ <%= String.format("%.1f", rating) %>/5.0 | <%= experience %> yrs exp</div>
                    </div>
                </div>
                
                <div class="agent-stats">
                    <div class="stat-item">
                        <div class="stat-value"><%= propertiesSold %></div>
                        <div class="stat-label-small">Properties Sold</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-value">₹<%= commission >= 100000 ? String.format("%.1f", commission/100000) + "L" : String.format("%.1f", commission/1000) + "K" %></div>
                        <div class="stat-label-small">Commission</div>
                    </div>
                </div>
                
                <div class="agent-details">
                    📍 <%= territory %><br>
                    📧 <%= email %><br>
                    📞 <%= phone %>
                </div>
                
                <div class="agent-actions">
                    <button class="action-btn btn-edit" onclick='openEditModal(<%= id %>, "<%= name.replace("\"", "\\\"") %>", "<%= email %>", "<%= phone %>", "<%= specialization %>", <%= experience %>, "<%= status %>", "<%= territory.replace("\"", "\\\"") %>", <%= propertiesSold %>, <%= commission %>, <%= rating %>)'>
                        ✏️ Edit
                    </button>
                    <form method="POST" style="display:inline; width: 100%;" onsubmit="return confirm('Are you sure you want to delete this agent?');">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="<%= id %>">
                        <button type="submit" class="action-btn btn-delete" style="width: 100%;">🗑️ Delete</button>
                    </form>
                </div>
            </div>
            <%
                }
            } catch (Exception e) {
                out.println("<div class='message error'>Error loading agents: " + e.getMessage() + "</div>");
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
            %>
        </div>
    </div>

    <!-- Add/Edit Agent Modal -->
    <div class="modal" id="agentModal">
        <div class="modal-content">
            <div class="modal-header">
                <h2 id="modalTitle">Add New Agent</h2>
                <button class="close-btn" onclick="closeModal()">&times;</button>
            </div>
            <form method="POST" enctype="multipart/form-data" id="agentForm">
                <input type="hidden" name="action" id="formAction" value="add">
                <input type="hidden" name="agentId" id="agentId" value="">
                <div class="modal-body">
                    <div class="form-group">
                        <label>Agent Photo</label>
                        <div class="file-upload-wrapper">
                            <input type="file" name="photo" id="photoUpload" class="file-upload-input" accept="image/*" onchange="previewImage(event)">
                            <label for="photoUpload" class="file-upload-label">
                                <svg width="24" height="24" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12"></path>
                                </svg>
                                <div>
                                    <div style="color: #64748b; font-size: 14px;">Click to upload photo</div>
                                    <div style="font-size: 12px; color: #94a3b8;">PNG, JPG up to 5MB</div>
                                </div>
                            </label>
                        </div>
                        <div class="image-preview" id="imagePreview">
                            <img id="previewImg" src="" alt="Preview">
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label>Full Name *</label>
                            <input type="text" name="name" id="name" required placeholder="Enter full name">
                        </div>
                        <div class="form-group">
                            <label>Email *</label>
                            <input type="email" name="email" id="email" required placeholder="agent@example.com">
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label>Phone *</label>
                            <input type="tel" name="phone" id="phone" required placeholder="9876543210">
                        </div>
                        <div class="form-group">
                            <label>Specialization *</label>
                            <select name="specialization" id="specialization" required>
                                <option value="">Select...</option>
                                <option value="residential">Residential</option>
                                <option value="commercial">Commercial</option>
                                <option value="luxury">Luxury Properties</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label>Experience (Years)</label>
                            <input type="number" name="experience" id="experience" min="0" value="0">
                        </div>
                        <div class="form-group">
                            <label>Status</label>
                            <select name="status" id="status">
                                <option value="active">Active</option>
                                <option value="inactive">Inactive</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label>Territory</label>
                        <input type="text" name="territory" id="territory" placeholder="e.g., Vijay Nagar, Indore">
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label>Properties Sold</label>
                            <input type="number" name="propertiesSold" id="propertiesSold" min="0" value="0">
                        </div>
                        <div class="form-group">
                            <label>Commission (₹)</label>
                            <input type="number" name="commission" id="commission" min="0" value="0" step="1000">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label>Rating (1-5)</label>
                        <input type="number" name="rating" id="rating" min="1" max="5" step="0.1" value="4.0">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" onclick="closeModal()">Cancel</button>
                    <button type="submit" class="btn btn-primary" id="submitBtn">Save Agent</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        function openAddModal() {
            document.getElementById('modalTitle').textContent = 'Add New Agent';
            document.getElementById('formAction').value = 'add';
            document.getElementById('submitBtn').textContent = 'Save Agent';
            document.getElementById('agentForm').reset();
            document.getElementById('agentId').value = '';
            document.getElementById('imagePreview').style.display = 'none';
            document.getElementById('agentModal').classList.add('active');
        }

        function openEditModal(id, name, email, phone, specialization, experience, status, territory, propertiesSold, commission, rating) {
            document.getElementById('modalTitle').textContent = 'Edit Agent';
            document.getElementById('formAction').value = 'edit';
            document.getElementById('submitBtn').textContent = 'Update Agent';
            document.getElementById('agentId').value = id;
            document.getElementById('name').value = name;
            document.getElementById('email').value = email;
            document.getElementById('phone').value = phone;
            document.getElementById('specialization').value = specialization;
            document.getElementById('experience').value = experience;
            document.getElementById('status').value = status;
            document.getElementById('territory').value = territory;
            document.getElementById('propertiesSold').value = propertiesSold;
            document.getElementById('commission').value = commission;
            document.getElementById('rating').value = rating;
            document.getElementById('imagePreview').style.display = 'none';
            document.getElementById('agentModal').classList.add('active');
        }

        function closeModal() {
            document.getElementById('agentModal').classList.remove('active');
            document.getElementById('imagePreview').style.display = 'none';
        }

        document.getElementById('agentModal').addEventListener('click', function(e) {
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

        function filterAgents() {
            const status = document.getElementById('statusFilter').value;
            const specialty = document.getElementById('specialtyFilter').value;
            const search = document.getElementById('searchInput').value.toLowerCase();
            
            document.querySelectorAll('.agent-card').forEach(card => {
                const cardStatus = card.getAttribute('data-status');
                const cardSpecialty = card.getAttribute('data-specialization');
                const cardName = card.getAttribute('data-name');
                
                const matchStatus = status === 'all' || cardStatus === status;
                const matchSpecialty = specialty === 'all' || cardSpecialty === specialty;
                const matchSearch = search === '' || cardName.includes(search);
                
                if (matchStatus && matchSpecialty && matchSearch) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
        }

        // Close modal on Escape key
        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape') closeModal();
        });
    </script>
</body>
</html>