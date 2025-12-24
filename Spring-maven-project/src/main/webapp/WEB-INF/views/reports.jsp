<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>

<%
String DB_URL = "jdbc:mysql://localhost:3306/premium_realty";
String DB_USER = "root";
String DB_PASSWORD = "root";

// File upload configuration
String UPLOAD_DIR = application.getRealPath("") + File.separator + "uploads" + File.separator + "reports";
File uploadDir = new File(UPLOAD_DIR);
if (!uploadDir.exists()) {
    uploadDir.mkdirs();
}

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String message = "";
String messageType = "";

// Handle file download
if ("download".equals(request.getParameter("download"))) {
    String reportId = request.getParameter("id");
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        
        String sql = "SELECT file_name, file_path FROM reports WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, Integer.parseInt(reportId));
        rs = pstmt.executeQuery();
        
        if (rs.next()) {
            String fileName = rs.getString("file_name");
            String filePath = rs.getString("file_path");
            
            File file = new File(filePath);
            
            if (file.exists()) {
                response.setContentType("application/octet-stream");
                response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
                response.setContentLength((int) file.length());
                
                FileInputStream fileIn = new FileInputStream(file);
                OutputStream outStream = response.getOutputStream();
                
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                
                while ((bytesRead = fileIn.read(buffer)) != -1) {
                    outStream.write(buffer, 0, bytesRead);
                }
                
                fileIn.close();
                outStream.close();
                return;
            }
        }
    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch(Exception e) {}
        if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
        if (conn != null) try { conn.close(); } catch(Exception e) {}
    }
}

// Handle all form submissions
if ("POST".equals(request.getMethod())) {
    String action = request.getParameter("action");
    
    if (action != null && !action.equals("delete")) {
        // Handle multipart form data for file upload
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        
        if (isMultipart) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                
                DiskFileItemFactory factory = new DiskFileItemFactory();
                factory.setSizeThreshold(1024 * 1024 * 10); // 10 MB
                factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
                
                ServletFileUpload upload = new ServletFileUpload(factory);
                upload.setSizeMax(1024 * 1024 * 50); // 50 MB max
                
                List<FileItem> items = upload.parseRequest(request);
                
                String reportName = "";
                String period = "";
                String reportType = "";
                String fileSize = "";
                String revenue = "";
                String reportId = "";
                String fileName = "";
                String filePath = "";
                
                // Process form fields and file
                for (FileItem item : items) {
                    if (item.isFormField()) {
                        String fieldName = item.getFieldName();
                        String fieldValue = item.getString("UTF-8");
                        
                        if ("reportName".equals(fieldName)) reportName = fieldValue;
                        else if ("period".equals(fieldName)) period = fieldValue;
                        else if ("reportType".equals(fieldName)) reportType = fieldValue;
                        else if ("fileSize".equals(fieldName)) fileSize = fieldValue;
                        else if ("revenue".equals(fieldName)) revenue = fieldValue;
                        else if ("reportId".equals(fieldName)) reportId = fieldValue;
                        else if ("action".equals(fieldName)) action = fieldValue;
                    } else {
                        // Process uploaded file
                        if (item.getSize() > 0) {
                            fileName = new File(item.getName()).getName();
                            String timestamp = String.valueOf(System.currentTimeMillis());
                            String uniqueFileName = timestamp + "_" + fileName;
                            filePath = UPLOAD_DIR + File.separator + uniqueFileName;
                            
                            File uploadedFile = new File(filePath);
                            item.write(uploadedFile);
                            
                            // Calculate actual file size
                            long fileSizeBytes = item.getSize();
                            if (fileSizeBytes < 1024) {
                                fileSize = fileSizeBytes + " B";
                            } else if (fileSizeBytes < 1024 * 1024) {
                                fileSize = String.format("%.2f KB", fileSizeBytes / 1024.0);
                            } else {
                                fileSize = String.format("%.2f MB", fileSizeBytes / (1024.0 * 1024.0));
                            }
                        }
                    }
                }
                
                if ("add".equals(action)) {
                    String sql = "INSERT INTO reports (report_name, period, report_type, file_size, revenue, file_name, file_path, generated_date) VALUES (?, ?, ?, ?, ?, ?, ?, NOW())";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, reportName);
                    pstmt.setString(2, period);
                    pstmt.setString(3, reportType);
                    pstmt.setString(4, fileSize);
                    pstmt.setString(5, revenue);
                    pstmt.setString(6, fileName);
                    pstmt.setString(7, filePath);
                    
                    int rows = pstmt.executeUpdate();
                    if (rows > 0) {
                        message = "Report added successfully!";
                        messageType = "success";
                    } else {
                        message = "Failed to add report";
                        messageType = "error";
                    }
                    
                } else if ("edit".equals(action)) {
                    String sql;
                    if (fileName.isEmpty()) {
                        sql = "UPDATE reports SET report_name=?, period=?, report_type=?, file_size=?, revenue=? WHERE id=?";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, reportName);
                        pstmt.setString(2, period);
                        pstmt.setString(3, reportType);
                        pstmt.setString(4, fileSize);
                        pstmt.setString(5, revenue);
                        pstmt.setInt(6, Integer.parseInt(reportId));
                    } else {
                        // Delete old file if exists
                        String getOldFileSql = "SELECT file_path FROM reports WHERE id = ?";
                        PreparedStatement getPstmt = conn.prepareStatement(getOldFileSql);
                        getPstmt.setInt(1, Integer.parseInt(reportId));
                        ResultSet oldFileRs = getPstmt.executeQuery();
                        if (oldFileRs.next()) {
                            String oldFilePath = oldFileRs.getString("file_path");
                            if (oldFilePath != null && !oldFilePath.isEmpty()) {
                                File oldFile = new File(oldFilePath);
                                if (oldFile.exists()) {
                                    oldFile.delete();
                                }
                            }
                        }
                        oldFileRs.close();
                        getPstmt.close();
                        
                        sql = "UPDATE reports SET report_name=?, period=?, report_type=?, file_size=?, revenue=?, file_name=?, file_path=? WHERE id=?";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, reportName);
                        pstmt.setString(2, period);
                        pstmt.setString(3, reportType);
                        pstmt.setString(4, fileSize);
                        pstmt.setString(5, revenue);
                        pstmt.setString(6, fileName);
                        pstmt.setString(7, filePath);
                        pstmt.setInt(8, Integer.parseInt(reportId));
                    }
                    
                    int rows = pstmt.executeUpdate();
                    if (rows > 0) {
                        message = "Report updated successfully!";
                        messageType = "success";
                    } else {
                        message = "Failed to update report";
                        messageType = "error";
                    }
                }
                
            } catch(Exception e) {
                message = "Error: " + e.getMessage();
                messageType = "error";
                e.printStackTrace();
            } finally {
                if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
                if (conn != null) try { conn.close(); } catch(Exception e) {}
            }
        }
    } else if ("delete".equals(action)) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            
            String reportId = request.getParameter("id");
            
            // Get file path before deleting
            String getFileSql = "SELECT file_path FROM reports WHERE id = ?";
            pstmt = conn.prepareStatement(getFileSql);
            pstmt.setInt(1, Integer.parseInt(reportId));
            rs = pstmt.executeQuery();
            
            String filePath = "";
            if (rs.next()) {
                filePath = rs.getString("file_path");
            }
            
            // Delete from database
            String sql = "DELETE FROM reports WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(reportId));
            int rows = pstmt.executeUpdate();
            
            if (rows > 0) {
                // Delete physical file
                if (filePath != null && !filePath.isEmpty()) {
                    File file = new File(filePath);
                    if (file.exists()) {
                        file.delete();
                    }
                }
                message = "Report deleted successfully!";
                messageType = "success";
            } else {
                message = "Failed to delete report";
                messageType = "error";
            }
            
        } catch(Exception e) {
            message = "Error: " + e.getMessage();
            messageType = "error";
        } finally {
            if (rs != null) try { rs.close(); } catch(Exception e) {}
            if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
            if (conn != null) try { conn.close(); } catch(Exception e) {}
        }
    }
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Premium Realty - Reports Management</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
            background: #f5f7fa;
        }

        .sidebar {
            position: fixed;
            left: 0;
            top: 0;
            height: 100vh;
            width: 250px;
            background: #1e293b;
            color: white;
            transition: transform 0.3s ease;
            z-index: 1000;
            overflow-y: auto;
        }

        .sidebar.collapsed {
            transform: translateX(-250px);
        }

        .logo {
            padding: 30px 20px;
            text-align: center;
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }

        .logo-circle {
            width: 60px;
            height: 60px;
            background: #10b981;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            font-weight: bold;
            margin: 0 auto 10px;
        }

        .logo h2 {
            font-size: 20px;
            margin-bottom: 5px;
        }

        .logo p {
            font-size: 12px;
            color: #94a3b8;
        }

        .user-profile {
            padding: 20px;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            background: #ef4444;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
        }

        .user-info h3 {
            font-size: 14px;
            margin-bottom: 3px;
        }

        .user-info p {
            font-size: 12px;
            color: #94a3b8;
        }

        .nav-menu {
            padding: 20px 0;
        }

        .nav-item {
            padding: 12px 20px;
            display: flex;
            align-items: center;
            gap: 12px;
            color: #94a3b8;
            cursor: pointer;
            transition: all 0.3s;
        }

        .nav-item:hover {
            background: rgba(255,255,255,0.05);
            color: white;
        }

        .nav-item.active {
            background: #10b981;
            color: white;
        }

        .main-content {
            margin-left: 250px;
            transition: margin-left 0.3s ease;
            min-height: 100vh;
        }

        .main-content.expanded {
            margin-left: 0;
        }

        .header {
            background: white;
            padding: 20px 30px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .menu-toggle {
            display: none;
            background: #10b981;
            border: none;
            color: white;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
        }

        .breadcrumb {
            color: #64748b;
            font-size: 14px;
        }

        .page-title {
            font-size: 32px;
            color: #1e293b;
            margin-top: 5px;
        }

        .btn-primary {
            background: #10b981;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .btn-primary:hover {
            background: #059669;
        }

        .content {
            padding: 30px;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .stat-card {
            background: white;
            padding: 24px;
            border-radius: 10px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }

        .stat-icon {
            width: 48px;
            height: 48px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 15px;
            font-size: 24px;
        }

        .stat-icon.green { background: #d1fae5; color: #10b981; }
        .stat-icon.blue { background: #dbeafe; color: #3b82f6; }
        .stat-icon.purple { background: #e9d5ff; color: #a855f7; }
        .stat-icon.orange { background: #fed7aa; color: #f97316; }

        .stat-value {
            font-size: 28px;
            font-weight: bold;
            color: #1e293b;
            margin-bottom: 5px;
        }

        .stat-label {
            font-size: 14px;
            color: #64748b;
        }

        .reports-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 20px;
        }

        .report-card {
            background: white;
            padding: 24px;
            border-radius: 10px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            transition: all 0.3s;
        }

        .report-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }

        .report-icon {
            width: 48px;
            height: 48px;
            background: #f0fdf4;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #10b981;
            margin-bottom: 15px;
            font-size: 24px;
        }

        .report-title {
            font-size: 16px;
            font-weight: 600;
            color: #1e293b;
            margin-bottom: 8px;
        }

        .report-meta {
            display: flex;
            flex-direction: column;
            gap: 5px;
            font-size: 13px;
            color: #64748b;
            margin-bottom: 15px;
        }

        .report-footer {
            padding-top: 15px;
            border-top: 1px solid #f1f5f9;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 10px;
        }

        .btn-action {
            padding: 6px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 12px;
            font-weight: 500;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
        }

        .btn-download {
            background: #3b82f6;
            color: white;
        }

        .btn-download:hover {
            background: #2563eb;
        }

        .btn-delete {
            background: #ef4444;
            color: white;
        }

        .btn-delete:hover {
            background: #dc2626;
        }

        .btn-edit {
            background: #f59e0b;
            color: white;
        }

        .btn-edit:hover {
            background: #d97706;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 2000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
            align-items: center;
            justify-content: center;
        }

        .modal.active {
            display: flex;
        }

        .modal-content {
            background-color: white;
            margin: 5% auto;
            padding: 30px;
            border-radius: 10px;
            width: 90%;
            max-width: 500px;
            max-height: 90vh;
            overflow-y: auto;
        }

        .modal-header {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #1e293b;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #64748b;
            font-size: 14px;
            font-weight: 500;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 10px 15px;
            border: 1px solid #e2e8f0;
            border-radius: 6px;
            font-size: 14px;
        }

        .form-group input[type="file"] {
            padding: 8px;
            border: 2px dashed #e2e8f0;
            background: #f8fafc;
            cursor: pointer;
        }

        .form-group input[type="file"]:hover {
            border-color: #10b981;
            background: #f0fdf4;
        }

        .form-group small {
            display: block;
            margin-top: 5px;
            color: #64748b;
            font-size: 12px;
        }

        .form-actions {
            display: flex;
            gap: 10px;
            justify-content: flex-end;
            margin-top: 25px;
        }

        .btn-cancel {
            background: #94a3b8;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .btn-cancel:hover {
            background: #64748b;
        }

        .btn-submit {
            background: #10b981;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .btn-submit:hover {
            background: #059669;
        }

        .alert {
            position: fixed;
            top: 20px;
            right: 20px;
            padding: 15px 20px;
            border-radius: 8px;
            color: white;
            font-weight: 500;
            z-index: 3000;
            animation: slideIn 0.3s ease;
            max-width: 300px;
        }

        .alert.success {
            background: #10b981;
        }

        .alert.error {
            background: #ef4444;
        }

        @keyframes slideIn {
            from {
                transform: translateX(400px);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }

        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-250px);
            }

            .sidebar.active {
                transform: translateX(0);
            }

            .main-content {
                margin-left: 0;
            }

            .menu-toggle {
                display: block;
            }

            .stats-grid {
                grid-template-columns: 1fr;
            }

            .reports-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <% if (!message.isEmpty()) { %>
    <div class="alert <%= messageType %>" id="alert">
        <%= message %>
    </div>
    <script>
        setTimeout(function() {
            document.getElementById('alert').style.display = 'none';
        }, 3000);
    </script>
    <% } %>

    <div class="sidebar" id="sidebar">
        <div class="logo">
            <div class="logo-circle">PR</div>
            <h2>Premium Realty</h2>
            <p>Admin Dashboard</p>
        </div>

        <div class="user-profile">
            <div class="user-avatar">RR</div>
            <div class="user-info">
                <h3>Ritik Rathore</h3>
                <p>Administrator</p>
            </div>
        </div>

        <nav class="nav-menu">
            <div class="nav-item">Dashboard</div>
            <div class="nav-item">Properties</div>
            <div class="nav-item">Agents</div>
            <div class="nav-item">Clients</div>
            <div class="nav-item">Inquiries</div>
            <div class="nav-item">Transactions</div>
            <div class="nav-item active">Reports</div>
            <div class="nav-item">Settings</div>
            <div class="nav-item">Logout</div>
        </nav>
    </div>

    <div class="main-content" id="mainContent">
        <div class="header">
            <div>
                <button class="menu-toggle" onclick="toggleSidebar()">☰</button>
                <div class="breadcrumb">Home / Reports</div>
                <h1 class="page-title">Reports Management</h1>
            </div>
            <button class="btn-primary" onclick="openAddModal()">
                + Add Report
            </button>
        </div>

        <div class="content">
            <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                
                String statsSql = "SELECT " +
                    "COUNT(*) as total, " +
                    "SUM(CASE WHEN report_type = 'Financial' THEN 1 ELSE 0 END) as financial, " +
                    "SUM(CASE WHEN report_type = 'Analytics' THEN 1 ELSE 0 END) as analytics, " +
                    "SUM(CASE WHEN report_type = 'Custom' THEN 1 ELSE 0 END) as custom " +
                    "FROM reports";
                
                Statement stmt = conn.createStatement();
                rs = stmt.executeQuery(statsSql);
                
                int total = 0, financial = 0, analytics = 0, custom = 0;
                if (rs.next()) {
                    total = rs.getInt("total");
                    financial = rs.getInt("financial");
                    analytics = rs.getInt("analytics");
                    custom = rs.getInt("custom");
                }
            %>
            
            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-icon green">📊</div>
                    <div class="stat-value"><%= total %></div>
                    <div class="stat-label">Total Reports</div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon blue">💰</div>
                    <div class="stat-value"><%= financial %></div>
                    <div class="stat-label">Financial Reports</div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon purple">📈</div>
                    <div class="stat-value"><%= analytics %></div>
                    <div class="stat-label">Analytics Reports</div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon orange">⚙️</div>
                    <div class="stat-value"><%= custom %></div>
                    <div class="stat-label">Custom Reports</div>
                </div>
            </div>

            <div class="reports-grid" id="reportsGrid">
                <%
                String reportsSql = "SELECT * FROM reports ORDER BY generated_date DESC";
                rs = stmt.executeQuery(reportsSql);
                
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String reportName = rs.getString("report_name");
                    String period = rs.getString("period");
                    String reportType = rs.getString("report_type");
                    String fileSize = rs.getString("file_size");
                    String revenue = rs.getString("revenue");
                    String fileName = rs.getString("file_name");
                    java.sql.Date generatedDate = rs.getDate("generated_date");
                    SimpleDateFormat sdf = new SimpleDateFormat("MMM dd, yyyy");
                %>
                
                <div class="report-card">
                    <div class="report-icon">📄</div>
                    <div class="report-title"><%= reportName %></div>
                    <div class="report-meta">
                        <div>📅 Period: <%= period %></div>
                        <div>📊 Type: <%= reportType %></div>
                        <div>📦 Size: <%= fileSize %></div>
                        <% if (fileName != null && !fileName.isEmpty()) { %>
                            <div>📎 File: <%= fileName %></div>
                        <% } %>
                        <div>🕒 Generated: <%= sdf.format(generatedDate) %></div>
                    </div>
                    <div class="report-footer">
                        <% if (revenue != null && !revenue.isEmpty()) { %>
                            <span style="color: #10b981; font-weight: 600;"><%= revenue %></span>
                        <% } else { %>
                            <span></span>
                        <% } %>
                        <div style="display: flex; gap: 8px; flex-wrap: wrap;">
                            <% if (fileName != null && !fileName.isEmpty()) { %>
                                <a href="reports.jsp?download=true&id=<%= id %>" class="btn-action btn-download">Download</a>
                            <% } %>
                            <button class="btn-action btn-edit" onclick='openEditModal(<%= id %>, "<%= reportName.replace("\"", "&quot;") %>", "<%= period %>", "<%= reportType %>", "<%= fileSize %>", "<%= revenue != null ? revenue : "" %>")'>Edit</button>
                            <form method="post" style="display: inline;" onsubmit="return confirm('Are you sure you want to delete: <%= reportName.replace("'", "\\'") %>?')">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="<%= id %>">
                                <button type="submit" class="btn-action btn-delete">Delete</button>
                            </form>
                        </div>
                    </div>
                </div>
                
                <%
                }
                } catch(Exception e) {
                    out.println("<p style='color: red;'>Error loading reports: " + e.getMessage() + "</p>");
                } finally {
                    if (rs != null) try { rs.close(); } catch(Exception e) {}
                    if (conn != null) try { conn.close(); } catch(Exception e) {}
                }
                %>
            </div>
        </div>
    </div>

    <div id="addModal" class="modal">
        <div class="modal-content">
            <div class="modal-header" id="modalTitle">Add New Report</div>
            <form id="reportForm" method="post" action="reports.jsp" enctype="multipart/form-data">
                <input type="hidden" name="action" id="formAction" value="add">
                <input type="hidden" name="reportId" id="reportId" value="">
                
                <div class="form-group">
                    <label>Report Name *</label>
                    <input type="text" name="reportName" id="reportName" required>
                </div>
                
                <div class="form-group">
                    <label>Period *</label>
                    <input type="text" name="period" id="period" placeholder="e.g., September 2024" required>
                </div>
                
                <div class="form-group">
                    <label>Report Type *</label>
                    <select name="reportType" id="reportType" required>
                        <option value="">Select Type</option>
                        <option value="Financial">Financial</option>
                        <option value="Analytics">Analytics</option>
                        <option value="Custom">Custom</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Upload File</label>
                    <input type="file" name="reportFile" id="reportFile" accept=".pdf,.xlsx,.xls,.doc,.docx,.csv">
                    <small>Supported formats: PDF, Excel, Word, CSV (Max 50MB)</small>
                </div>
                
                <div class="form-group" id="fileSizeGroup" style="display: none;">
                    <label>File Size (Manual Entry)</label>
                    <input type="text" name="fileSize" id="fileSize" placeholder="e.g., 2.4 MB">
                    <small>Leave blank if uploading a file - size will be calculated automatically</small>
                </div>
                
                <div class="form-group">
                    <label>Revenue (Optional)</label>
                    <input type="text" name="revenue" id="revenue" placeholder="e.g., ₹8.9 Cr">
                </div>
                
                <div class="form-actions">
                    <button type="button" class="btn-cancel" onclick="closeAddModal()">Cancel</button>
                    <button type="submit" class="btn-submit" id="submitBtn">Add Report</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        function toggleSidebar() {
            document.getElementById('sidebar').classList.toggle('active');
        }

        function openAddModal() {
            document.getElementById('modalTitle').textContent = 'Add New Report';
            document.getElementById('formAction').value = 'add';
            document.getElementById('submitBtn').textContent = 'Add Report';
            document.getElementById('reportForm').reset();
            document.getElementById('reportId').value = '';
            document.getElementById('fileSizeGroup').style.display = 'none';
            document.getElementById('reportFile').required = false;
            document.getElementById('addModal').classList.add('active');
        }

        function openEditModal(id, reportName, period, reportType, fileSize, revenue) {
            document.getElementById('modalTitle').textContent = 'Edit Report';
            document.getElementById('formAction').value = 'edit';
            document.getElementById('submitBtn').textContent = 'Update Report';
            document.getElementById('reportId').value = id;
            document.getElementById('reportName').value = reportName;
            document.getElementById('period').value = period;
            document.getElementById('reportType').value = reportType;
            document.getElementById('fileSize').value = fileSize;
            document.getElementById('revenue').value = revenue;
            document.getElementById('fileSizeGroup').style.display = 'block';
            document.getElementById('reportFile').required = false;
            document.getElementById('addModal').classList.add('active');
        }

        function closeAddModal() {
            document.getElementById('addModal').classList.remove('active');
        }

        // Show/hide manual file size input based on file upload
        document.getElementById('reportFile').addEventListener('change', function(e) {
            if (e.target.files.length > 0) {
                document.getElementById('fileSizeGroup').style.display = 'none';
                document.getElementById('fileSize').required = false;
            } else {
                document.getElementById('fileSizeGroup').style.display = 'block';
            }
        });

        window.onclick = function(event) {
            var modal = document.getElementById('addModal');
            if (event.target == modal) {
                closeAddModal();
            }
        }

        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape') {
                closeAddModal();
            }
        });
    </script>
</body>
</html>