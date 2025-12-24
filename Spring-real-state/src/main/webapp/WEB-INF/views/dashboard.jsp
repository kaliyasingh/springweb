<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Premium Realty - Admin Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f6fa;
            display: flex;
            min-height: 100vh;
        } 
        
        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            background-color: #2c3e50;
            color: white;
            padding: 20px 0;
            position: fixed;
            height: 100vh;
            overflow-y: auto;
        }
        
        .sidebar .logo {
            text-align: center;
            margin-bottom: 30px;
            padding: 0 20px;
        }
        
        .sidebar .logo .initials {
            width: 50px;
            height: 50px;
            background-color: #27ae60;
            border-radius: 50%;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            font-size: 18px;
        }
        
        .sidebar .company-name {
            margin-top: 10px;
            font-size: 18px;
            font-weight: bold;
        }
        
        .sidebar .role {
            font-size: 14px;
            color: #bdc3c7;
        }
        
        .sidebar .nav-menu {
            list-style: none;
            padding: 0 20px;
        }
        
        .sidebar .nav-menu li {
            margin: 15px 0;
        }
        
        .sidebar .nav-menu a {
            color: #bdc3c7;
            text-decoration: none;
            display: flex;
            align-items: center;
            padding: 10px;
            border-radius: 5px;
            transition: all 0.3s ease;
        }
        
        .sidebar .nav-menu a:hover,
        .sidebar .nav-menu a.active {
            background-color: #34495e;
            color: white;
        }
        
        .sidebar .nav-menu .icon {
            margin-right: 15px;
            width: 20px;
        }
        
        /* Main Content */
        .main-content {
            margin-left: 250px;
            flex: 1;
            padding: 20px;
        }
        
        .header {
            display: flex;
            justify-content: between;
            align-items: center;
            margin-bottom: 30px;
        }
        
        .header h1 {
            color: #2c3e50;
            font-size: 28px;
        }
        
        .breadcrumb {
            color: #7f8c8d;
            font-size: 14px;
        }
        
        .add-btn {
            background-color: #27ae60;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            margin-left: auto;
        }
        
        .add-btn:hover {
            background-color: #229954;
        }
        
        /* Stats Cards */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .stat-card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            border-left: 5px solid;
        }
        
        .stat-card.blue { border-left-color: #3498db; }
        .stat-card.orange { border-left-color: #f39c12; }
        .stat-card.red { border-left-color: #e74c3c; }
        
        .stat-number {
            font-size: 36px;
            font-weight: bold;
            color: #2c3e50;
        }
        
        .stat-label {
            color: #7f8c8d;
            font-size: 14px;
            margin-top: 5px;
        }
        
        .stat-change {
            font-size: 12px;
            margin-top: 10px;
            padding: 3px 8px;
            border-radius: 15px;
        }
        
        .stat-change.positive {
            background-color: #d5f4e6;
            color: #27ae60;
        }
        
        .stat-change.negative {
            background-color: #fadbd8;
            color: #e74c3c;
        }
        
        /* Properties Table */
        .section {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        
        .section-header {
            padding: 20px;
            border-bottom: 1px solid #ecf0f1;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .section-title {
            font-size: 18px;
            font-weight: bold;
            color: #2c3e50;
        }
        
        .view-all-btn {
            background-color: #27ae60;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 12px;
        }
        
        .table-container {
            overflow-x: auto;
        }
        
        .properties-table {
            width: 100%;
            border-collapse: collapse;
        }
        
        .properties-table th,
        .properties-table td {
            text-align: left;
            padding: 15px;
            border-bottom: 1px solid #ecf0f1;
        }
        
        .properties-table th {
            background-color: #f8f9fa;
            font-weight: bold;
            color: #2c3e50;
        }
        
        .status-badge {
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 12px;
            font-weight: bold;
        }
        
        .status-available {
            background-color: #d5f4e6;
            color: #27ae60;
        }
        
        .status-pending {
            background-color: #fef9e7;
            color: #f39c12;
        }
        
        .status-sold {
            background-color: #fadbd8;
            color: #e74c3c;
        }
        
        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
        }
        
        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 0;
            border-radius: 10px;
            width: 80%;
            max-width: 600px;
            max-height: 80vh;
            overflow-y: auto;
        }
        
        .modal-header {
            padding: 20px;
            background-color: #f8f9fa;
            border-bottom: 1px solid #ecf0f1;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-radius: 10px 10px 0 0;
        }
        
        .modal-title {
            font-size: 18px;
            font-weight: bold;
            color: #2c3e50;
        }
        
        .close {
            color: #aaa;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }
        
        .close:hover {
            color: #000;
        }
        
        .modal-body {
            padding: 20px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #2c3e50;
        }
        
        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }
        
        .form-group textarea {
            height: 100px;
            resize: vertical;
        }
        
        .form-row {
            display: flex;
            gap: 15px;
        }
        
        .form-row .form-group {
            flex: 1;
        }
        
        .modal-footer {
            padding: 20px;
            background-color: #f8f9fa;
            border-top: 1px solid #ecf0f1;
            text-align: right;
            border-radius: 0 0 10px 10px;
        }
        
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            margin-left: 10px;
        }
        
        .btn-primary {
            background-color: #27ae60;
            color: white;
        }
        
        .btn-primary:hover {
            background-color: #229954;
        }
        
        .btn-secondary {
            background-color: #95a5a6;
            color: white;
        }
        
        .btn-secondary:hover {
            background-color: #7f8c8d;
        }
        
        .file-upload {
            border: 2px dashed #ddd;
            padding: 20px;
            text-align: center;
            border-radius: 5px;
            cursor: pointer;
            transition: border-color 0.3s;
        }
        
        .file-upload:hover {
            border-color: #27ae60;
        }
        
        .file-upload.dragover {
            border-color: #27ae60;
            background-color: #f0fff4;
        }
        
        /* Quick Actions */
        .quick-actions {
            display: grid;
            gap: 15px;
        }
        
        .quick-action {
            background: white;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            cursor: pointer;
            transition: transform 0.2s;
        }
        
        .quick-action:hover {
            transform: translateY(-2px);
        }
        
        .quick-action.add-property {
            background-color: #27ae60;
            color: white;
        }
        
        .quick-action.add-agent {
            background-color: #3498db;
            color: white;
        }
        
        .quick-action.view-inquiries {
            background-color: #f39c12;
            color: white;
        }
        
        .notification {
            position: fixed;
            top: 20px;
            right: 20px;
            padding: 15px 20px;
            border-radius: 5px;
            color: white;
            font-weight: bold;
            z-index: 1001;
            display: none;
        }
        
        .notification.success {
            background-color: #27ae60;
        }
        
        .notification.error {
            background-color: #e74c3c;
        }
        
        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-100%);
                transition: transform 0.3s ease;
            }
            
            .sidebar.active {
                transform: translateX(0);
            }
            
            .main-content {
                margin-left: 0;
            }
            
            .stats-grid {
                grid-template-columns: 1fr;
            }
            
            .form-row {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
        <div class="logo">
            <div class="initials">PR</div>
            <div class="company-name">Premium Realty</div>
            <div class="role">Admin Dashboard</div>
        </div>
        
        <div style="text-align: center; margin: 20px 0;">
            <div style="width: 40px; height: 40px; background-color: #e74c3c; border-radius: 50%; display: inline-flex; align-items: center; justify-content: center; color: white; font-weight: bold; margin-bottom: 10px;">RR</div>
            <div style="font-size: 14px; font-weight: bold;">Ritik Rathore</div>
            <div style="font-size: 12px; color: #bdc3c7;">Administrator</div>
        </div>
        
        <ul class="nav-menu">
            <li><a href="dashboard" class="active" onclick="showSection('dashboard')"><span class="icon">📊</span>Dashboard</a></li>
            <li><a href="property" onclick="showSection('properties')"><span class="icon">🏠</span>Properties</a></li>
            <li><a href="agent" onclick="showSection('agents')"><span class="icon">👥</span>Agents</a></li>
            <li><a href="hell0" onclick="showSection('clients')"><span class="icon">👤</span>Clients</a></li>
            <li><a href="#" onclick="showSection('inquiries')"><span class="icon">💬</span>Inquiries</a></li>
            <li><a href="#" onclick="showSection('transactions')"><span class="icon">💰</span>Transactions</a></li>
            <li><a href="reports" onclick="showSection('reports')"><span class="icon">📈</span>Reports</a></li>
            <li><a href="#" onclick="showSection('settings')"><span class="icon">⚙️</span>Settings</a></li>
            <li><a href="#" onclick="logout()"><span class="icon">🚪</span>Logout</a></li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Header -->
        <div class="header">
            <div>
                <h1>Dashboard</h1>
                <div class="breadcrumb">Home / Dashboard</div>
            </div>
        </div>

        <!-- Stats Cards -->
        <div class="stats-grid">
            <div class="stat-card blue">
                <div class="stat-number" id="totalProperties">245</div>
                <div class="stat-label">Total Properties</div>
                <div class="stat-change positive">+8%</div>
            </div>
            <div class="stat-card orange">
                <div class="stat-number" id="activeInquiries">156</div>
                <div class="stat-label">Active Inquiries</div>
                <div class="stat-change positive">+15%</div>
            </div>
            <div class="stat-card red">
                <div class="stat-number" id="monthlyRevenue">₹2.4M</div>
                <div class="stat-label">Monthly Revenue</div>
                <div class="stat-change positive">+22%</div>
            </div>
        </div>

        <!-- Recent Properties Section -->
        <div class="section">
            <div class="section-header">
                <div class="section-title">Recent Properties</div>
                <button class="view-all-btn" onclick="viewAllProperties()">View All</button>
            </div>
            <div class="table-container">
                <table class="properties-table" id="propertiesTable">
                    <thead>
                        <tr>
                            <th>Property</th>
                            <th>Location</th>
                            <th>Price</th>
                            <th>Status</th>
                            <th>Agent</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody id="propertiesTableBody">
                        <tr>
                            <td>Luxury Villa</td>
                            <td>Bhopal, MP</td>
                            <td>₹85 Lakh</td>
                            <td><span class="status-badge status-available">Available</span></td>
                            <td>Rajesh Sharma</td>
                            <td>
                                <button class="btn btn-primary" onclick="editProperty(1)">Edit</button>
                                <button class="btn btn-secondary" onclick="deleteProperty(1)">Delete</button>
                            </td>
                        </tr>
                        <tr>
                            <td>Modern Apartment</td>
                            <td>Indore, MP</td>
                            <td>₹45 Lakh</td>
                            <td><span class="status-badge status-pending">Pending</span></td>
                            <td>Priya Gupta</td>
                            <td>
                                <button class="btn btn-primary" onclick="editProperty(2)">Edit</button>
                                <button class="btn btn-secondary" onclick="deleteProperty(2)">Delete</button>
                            </td>
                        </tr>
                        <tr>
                            <td>Commercial Space</td>
                            <td>Indore, MP</td>
                            <td>₹1.2 Cr</td>
                            <td><span class="status-badge status-sold">Sold</span></td>
                            <td>Amit Singh</td>
                            <td>
                                <button class="btn btn-primary" onclick="editProperty(3)">Edit</button>
                                <button class="btn btn-secondary" onclick="deleteProperty(3)">Delete</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Quick Actions Panel -->
        <div class="section">
            <div class="section-header">
                <div class="section-title">Quick Actions</div>
            </div>
            <div style="padding: 20px;">
                <div class="quick-actions">
                    <div class="quick-action add-property" onclick="openAddPropertyModal()">
                        <div style="font-size: 24px; margin-bottom: 10px;">🏠</div>
                        <div style="font-weight: bold;">Add New Property</div>
                        <div style="font-size: 12px; margin-top: 5px;">List a new property</div>
                    </div>
                    <div class="quick-action add-agent" onclick="openAddAgentModal()">
                        <div style="font-size: 24px; margin-bottom: 10px;">👤</div>
                        <div style="font-weight: bold;">Add New Agent</div>
                        <div style="font-size: 12px; margin-top: 5px;">Register new agent</div>
                    </div>
                    <div class="quick-action view-inquiries" onclick="viewInquiries()">
                        <div style="font-size: 24px; margin-bottom: 10px;">📧</div>
                        <div style="font-weight: bold;">View Inquiries</div>
                        <div style="font-size: 12px; margin-top: 5px;">Check customer inquiries</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Add Property Modal -->
    <div id="addPropertyModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title">Add New Property</div>
                <span class="close" onclick="closeModal('addPropertyModal')">&times;</span>
            </div>
            <div class="modal-body">
                <form id="addPropertyForm">
                    <div class="form-row">
                        <div class="form-group">
                            <label for="propertyName">Property Name *</label>
                            <input type="text" id="propertyName" name="propertyName" required>
                        </div>
                        <div class="form-group">
                            <label for="propertyType">Property Type *</label>
                            <select id="propertyType" name="propertyType" required>
                                <option value="">Select Type</option>
                                <option value="villa">Villa</option>
                                <option value="apartment">Apartment</option>
                                <option value="commercial">Commercial</option>
                                <option value="plot">Plot</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="location">Location *</label>
                            <input type="text" id="location" name="location" required>
                        </div>
                        <div class="form-group">
                            <label for="price">Price (₹) *</label>
                            <input type="number" id="price" name="price" required>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="bedrooms">Bedrooms</label>
                            <input type="number" id="bedrooms" name="bedrooms">
                        </div>
                        <div class="form-group">
                            <label for="bathrooms">Bathrooms</label>
                            <input type="number" id="bathrooms" name="bathrooms">
                        </div>
                        <div class="form-group">
                            <label for="area">Area (sq ft)</label>
                            <input type="number" id="area" name="area">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="agent">Assign Agent *</label>
                        <select id="agent" name="agent" required>
                            <option value="">Select Agent</option>
                            <option value="rajesh">Rajesh Sharma</option>
                            <option value="priya">Priya Gupta</option>
                            <option value="amit">Amit Singh</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea id="description" name="description" placeholder="Enter property description..."></textarea>
                    </div>
                    
                    <div class="form-group">
                        <label for="images">Property Images</label>
                        <div class="file-upload" id="fileUpload">
                            <div>📁 Click to upload or drag and drop images</div>
                            <input type="file" id="images" name="images" multiple accept="image/*" style="display: none;">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" onclick="closeModal('addPropertyModal')">Cancel</button>
                <button type="button" class="btn btn-primary" onclick="submitProperty()">Add Property</button>
            </div>
        </div>
    </div>

    <!-- Add Agent Modal -->
    <div id="addAgentModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title">Add New Agent</div>
                <span class="close" onclick="closeModal('addAgentModal')">&times;</span>
            </div>
            <div class="modal-body">
                <form id="addAgentForm">
                    <div class="form-row">
                        <div class="form-group">
                            <label for="agentName">Full Name *</label>
                            <input type="text" id="agentName" name="agentName" required>
                        </div>
                        <div class="form-group">
                            <label for="agentEmail">Email *</label>
                            <input type="email" id="agentEmail" name="agentEmail" required>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="agentPhone">Phone *</label>
                            <input type="tel" id="agentPhone" name="agentPhone" required>
                        </div>
                        <div class="form-group">
                            <label for="agentExperience">Experience (years)</label>
                            <input type="number" id="agentExperience" name="agentExperience">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="agentSpecialization">Specialization</label>
                        <select id="agentSpecialization" name="agentSpecialization">
                            <option value="">Select Specialization</option>
                            <option value="residential">Residential</option>
                            <option value="commercial">Commercial</option>
                            <option value="luxury">Luxury Properties</option>
                            <option value="investment">Investment Properties</option>
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" onclick="closeModal('addAgentModal')">Cancel</button>
                <button type="button" class="btn btn-primary" onclick="submitAgent()">Add Agent</button>
            </div>
        </div>
    </div>

    <!-- Notification -->
    <div id="notification" class="notification"></div>

    <script>
        // Global variables
        let properties = [
            {id: 1, name: 'Luxury Villa', location: 'Bhopal, MP', price: 8500000, status: 'available', agent: 'Rajesh Sharma'},
            {id: 2, name: 'Modern Apartment', location: 'Indore, MP', price: 4500000, status: 'pending', agent: 'Priya Gupta'},
            {id: 3, name: 'Commercial Space', location: 'Indore, MP', price: 12000000, status: 'sold', agent: 'Amit Singh'}
        ];
        
        let agents = [
            {id: 1, name: 'Rajesh Sharma', email: 'rajesh@premiumrealty.com', phone: '9876543210'},
            {id: 2, name: 'Priya Gupta', email: 'priya@premiumrealty.com', phone: '9876543211'},
            {id: 3, name: 'Amit Singh', email: 'amit@premiumrealty.com', phone: '9876543212'}
        ];
        
        // Initialize dashboard
        document.addEventListener('DOMContentLoaded', function() {
            initializeFileUpload();
            updateStats();
            renderPropertiesTable();
            
            // Add modal click outside to close
            window.onclick = function(event) {
                if (event.target.classList.contains('modal')) {
                    event.target.style.display = 'none';
                }
            }
        });
        
        // Navigation functions
        function showSection(section) {
            // Update active menu item
            document.querySelectorAll('.nav-menu a').forEach(a => a.classList.remove('active'));
            event.target.classList.add('active');
            
            // Here you would typically load different content based on section
            console.log('Switching to section:', section);
            showNotification('Switched to ' + section.charAt(0).toUpperCase() + section.slice(1), 'success');
        }
        
        // Modal functions
        function openAddPropertyModal() {
            document.getElementById('addPropertyModal').style.display = 'block';
        }
        
        function openAddAgentModal() {
            document.getElementById('addAgentModal').style.display = 'block';
        }
        
        function closeModal(modalId) {
            document.getElementById(modalId).style.display = 'none';
            // Reset form
            const form = document.querySelector(`#${modalId} form`);
            if (form) form.reset();
        }
        
        // File upload functionality
        function initializeFileUpload() {
            const fileUpload = document.getElementById('fileUpload');
            const fileInput = document.getElementById('images');
            
            fileUpload.addEventListener('click', () => fileInput.click());
            
            fileUpload.addEventListener('dragover', (e) => {
                e.preventDefault();
                fileUpload.classList.add('dragover');
            });
            
            fileUpload.addEventListener('dragleave', () => {
                fileUpload.classList.remove('dragover');
            });
            
            fileUpload.addEventListener('drop', (e) => {
                e.preventDefault();
                fileUpload.classList.remove('dragover');
                
                const files = e.dataTransfer.files;
                handleFiles(files);
            });
            
            fileInput.addEventListener('change', (e) => {
                handleFiles(e.target.files);
            });
        }
        
        function handleFiles(files) {
            const fileList = Array.from(files);
            if (fileList.length > 0) {
                const fileNames = fileList.map(file => file.name).join(', ');
                document.getElementById('fileUpload').innerHTML = `
                    <div style="color: #27ae60;">✓ ${fileList.length} file(s) selected</div>
                    <div style="font-size: 12px; color: #7f8c8d; margin-top: 5px;">${fileNames}</div>
                `;
            }
        }
        
        // Property management functions
        function submitProperty() {
            const form = document.getElementById('addPropertyForm');
            const formData = new FormData(form);
            
            // Basic validation
            const requiredFields = ['propertyName', 'propertyType', 'location', 'price', 'agent'];
            const missingFields = requiredFields.filter(field => !formData.get(field));
            
            if (missingFields.length > 0) {
                showNotification('Please fill in all required fields', 'error');
                return;
            }
            
            // Create new property object
            const newProperty = {
                id: properties.length + 1,
                name: formData.get('propertyName'),
                type: formData.get('propertyType'),
                location: formData.get('location'),
                price: parseInt(formData.get('price')),
                bedrooms: formData.get('bedrooms') || 0,
                bathrooms: formData.get('bathrooms') || 0,
                area: formData.get('area') || 0,
                status: 'available',
                agent: getAgentNameById(formData.get('agent')),
                description: formData.get('description') || '',
                dateAdded: new Date().toLocaleDateString()
            };
            
            // Add to properties array
            properties.push(newProperty);
            
            // Update UI
            renderPropertiesTable();
            updateStats();
            closeModal('addPropertyModal');
            
            showNotification('Property added successfully!', 'success');
        }
        
        function submitAgent() {
            const form = document.getElementById('addAgentForm');
            const formData = new FormData(form);
            
            // Basic validation
            const requiredFields = ['agentName', 'agentEmail', 'agentPhone'];
            const missingFields = requiredFields.filter(field => !formData.get(field));
            
            if (missingFields.length > 0) {
                showNotification('Please fill in all required fields', 'error');
                return;
            }
            
            // Create new agent object
            const newAgent = {
                id: agents.length + 1,
                name: formData.get('agentName'),
                email: formData.get('agentEmail'),
                phone: formData.get('agentPhone'),
                experience: formData.get('agentExperience') || 0,
                specialization: formData.get('agentSpecialization') || 'General',
                dateAdded: new Date().toLocaleDateString()
            };
            
            // Add to agents array
            agents.push(newAgent);
            
            // Update agent dropdown in property form
            updateAgentDropdown();
            
            closeModal('addAgentModal');
            showNotification('Agent added successfully!', 'success');
        }
        
        function editProperty(id) {
            const property = properties.find(p => p.id === id);
            if (property) {
                // Populate form with existing data
                document.getElementById('propertyName').value = property.name;
                document.getElementById('location').value = property.location;
                document.getElementById('price').value = property.price;
                
                openAddPropertyModal();
                
                // Change modal title and button text
                document.querySelector('#addPropertyModal .modal-title').textContent = 'Edit Property';
                document.querySelector('#addPropertyModal .btn-primary').textContent = 'Update Property';
                document.querySelector('#addPropertyModal .btn-primary').onclick = () => updateProperty(id);
            }
        }
        
        function updateProperty(id) {
            const form = document.getElementById('addPropertyForm');
            const formData = new FormData(form);
            
            const propertyIndex = properties.findIndex(p => p.id === id);
            if (propertyIndex !== -1) {
                properties[propertyIndex] = {
                    ...properties[propertyIndex],
                    name: formData.get('propertyName'),
                    location: formData.get('location'),
                    price: parseInt(formData.get('price')),
                    // ... other fields
                };
                
                renderPropertiesTable();
                closeModal('addPropertyModal');
                showNotification('Property updated successfully!', 'success');
                
                // Reset modal
                document.querySelector('#addPropertyModal .modal-title').textContent = 'Add New Property';
                document.querySelector('#addPropertyModal .btn-primary').textContent = 'Add Property';
                document.querySelector('#addPropertyModal .btn-primary').onclick = submitProperty;
            }
        }
        
        function deleteProperty(id) {
            if (confirm('Are you sure you want to delete this property?')) {
                properties = properties.filter(p => p.id !== id);
                renderPropertiesTable();
                updateStats();
                showNotification('Property deleted successfully!', 'success');
            }
        }
        
        // Utility functions
        function getAgentNameById(agentId) {
            const agentMap = {
                'rajesh': 'Rajesh Sharma',
                'priya': 'Priya Gupta',
                'amit': 'Amit Singh'
            };
            return agentMap[agentId] || 'Unknown Agent';
        }
        
        function updateAgentDropdown() {
            const select = document.getElementById('agent');
            select.innerHTML = '<option value="">Select Agent</option>';
            
            agents.forEach(agent => {
                const option = document.createElement('option');
                option.value = agent.name.toLowerCase().split(' ')[0];
                option.textContent = agent.name;
                select.appendChild(option);
            });
        }
        
        function renderPropertiesTable() {
            const tbody = document.getElementById('propertiesTableBody');
            tbody.innerHTML = '';
            
            properties.slice(0, 5).forEach(property => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${property.name}</td>
                    <td>${property.location}</td>
                    <td>₹${formatPrice(property.price)}</td>
                    <td><span class="status-badge status-${property.status}">${property.status.charAt(0).toUpperCase() + property.status.slice(1)}</span></td>
                    <td>${property.agent}</td>
                    <td>
                        <button class="btn btn-primary" onclick="editProperty(${property.id})" style="font-size: 12px; padding: 5px 10px;">Edit</button>
                        <button class="btn btn-secondary" onclick="deleteProperty(${property.id})" style="font-size: 12px; padding: 5px 10px; margin-left: 5px;">Delete</button>
                    </td>
                `;
                tbody.appendChild(row);
            });
        }
        
        function formatPrice(price) {
            if (price >= 10000000) {
                return (price / 10000000).toFixed(1) + ' Cr';
            } else if (price >= 100000) {
                return (price / 100000).toFixed(0) + ' Lakh';
            }
            return price.toLocaleString();
        }
        
        function updateStats() {
            document.getElementById('totalProperties').textContent = properties.length;
            
            // Calculate available properties as "active inquiries"
            const availableProperties = properties.filter(p => p.status === 'available').length;
            document.getElementById('activeInquiries').textContent = availableProperties * 2 + Math.floor(Math.random() * 50);
            
            // Calculate total value of sold properties as "monthly revenue"
            const soldProperties = properties.filter(p => p.status === 'sold');
            const totalRevenue = soldProperties.reduce((sum, p) => sum + p.price, 0);
            document.getElementById('monthlyRevenue').textContent = '₹' + formatPrice(totalRevenue);
        }
        
        function viewAllProperties() {
            showNotification('Viewing all properties...', 'success');
            console.log('All properties:', properties);
        }
        
        function viewInquiries() {
            showNotification('Loading inquiries...', 'success');
            console.log('Viewing inquiries');
        }
        
        function showNotification(message, type) {
            const notification = document.getElementById('notification');
            notification.textContent = message;
            notification.className = `notification ${type}`;
            notification.style.display = 'block';
            
            setTimeout(() => {
                notification.style.display = 'none';
            }, 3000);
        }
        
        function logout() {
            if (confirm('Are you sure you want to logout?')) {
                showNotification('Logging out...', 'success');
                setTimeout(() => {
                    window.location.href = 'login.jsp';
                }, 1000);
            }
        }
        
        // Search functionality
        function searchProperties(query) {
            const filteredProperties = properties.filter(property => 
                property.name.toLowerCase().includes(query.toLowerCase()) ||
                property.location.toLowerCase().includes(query.toLowerCase()) ||
                property.agent.toLowerCase().includes(query.toLowerCase())
            );
            
            renderFilteredProperties(filteredProperties);
        }
        
        function renderFilteredProperties(filteredProperties) {
            const tbody = document.getElementById('propertiesTableBody');
            tbody.innerHTML = '';
            
            filteredProperties.forEach(property => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${property.name}</td>
                    <td>${property.location}</td>
                    <td>₹${formatPrice(property.price)}</td>
                    <td><span class="status-badge status-${property.status}">${property.status.charAt(0).toUpperCase() + property.status.slice(1)}</span></td>
                    <td>${property.agent}</td>
                    <td>
                        <button class="btn btn-primary" onclick="editProperty(${property.id})" style="font-size: 12px; padding: 5px 10px;">Edit</button>
                        <button class="btn btn-secondary" onclick="deleteProperty(${property.id})" style="font-size: 12px; padding: 5px 10px; margin-left: 5px;">Delete</button>
                    </td>
                `;
                tbody.appendChild(row);
            });
        }
        
        // Filter properties by status
        function filterByStatus(status) {
            if (status === 'all') {
                renderPropertiesTable();
            } else {
                const filteredProperties = properties.filter(p => p.status === status);
                renderFilteredProperties(filteredProperties);
            }
        }
        
        // Sort properties
        function sortProperties(field, direction = 'asc') {
            const sortedProperties = [...properties].sort((a, b) => {
                if (field === 'price') {
                    return direction === 'asc' ? a.price - b.price : b.price - a.price;
                } else {
                    const aValue = a[field].toLowerCase();
                    const bValue = b[field].toLowerCase();
                    if (direction === 'asc') {
                        return aValue < bValue ? -1 : aValue > bValue ? 1 : 0;
                    } else {
                        return aValue > bValue ? -1 : aValue < bValue ? 1 : 0;
                    }
                }
            });
            
            renderFilteredProperties(sortedProperties);
        }
        
        // Export data functions
        function exportToCSV() {
            const headers = ['Property Name', 'Location', 'Price', 'Status', 'Agent'];
            const csvContent = [
                headers.join(','),
                ...properties.map(p => [
                    `"${p.name}"`,
                    `"${p.location}"`,
                    p.price,
                    `"${p.status}"`,
                    `"${p.agent}"`
                ].join(','))
            ].join('\n');
            
            downloadCSV(csvContent, 'properties.csv');
            showNotification('Properties exported to CSV!', 'success');
        }
        
        function downloadCSV(content, filename) {
            const blob = new Blob([content], { type: 'text/csv;charset=utf-8;' });
            const link = document.createElement('a');
            if (link.download !== undefined) {
                const url = URL.createObjectURL(blob);
                link.setAttribute('href', url);
                link.setAttribute('download', filename);
                link.style.visibility = 'hidden';
                document.body.appendChild(link);
                link.click();
                document.body.removeChild(link);
            }
        }
        
        // Auto-refresh data every 30 seconds
        setInterval(() => {
            updateStats();
            console.log('Stats updated automatically');
        }, 30000);
        
        // Keyboard shortcuts
        document.addEventListener('keydown', function(e) {
            // Ctrl/Cmd + N for new property
            if ((e.ctrlKey || e.metaKey) && e.key === 'n') {
                e.preventDefault();
                openAddPropertyModal();
            }
            
            // Escape to close modals
            if (e.key === 'Escape') {
                const modals = document.querySelectorAll('.modal');
                modals.forEach(modal => {
                    if (modal.style.display === 'block') {
                        modal.style.display = 'none';
                    }
                });
            }
        });
        
        // Mobile menu toggle
        function toggleMobileMenu() {
            const sidebar = document.getElementById('sidebar');
            sidebar.classList.toggle('active');
        }
        
        // Add mobile menu button for smaller screens
        if (window.innerWidth <= 768) {
            const mobileMenuBtn = document.createElement('button');
            mobileMenuBtn.innerHTML = '☰';
            mobileMenuBtn.style.cssText = `
                position: fixed;
                top: 20px;
                left: 20px;
                z-index: 1001;
                background: #27ae60;
                color: white;
                border: none;
                padding: 10px;
                border-radius: 5px;
                font-size: 18px;
                cursor: pointer;
            `;
            mobileMenuBtn.onclick = toggleMobileMenu;
            document.body.appendChild(mobileMenuBtn);
        }
        
        // Initialize tooltips
        function initializeTooltips() {
            const elements = document.querySelectorAll('[data-tooltip]');
            elements.forEach(element => {
                element.addEventListener('mouseenter', showTooltip);
                element.addEventListener('mouseleave', hideTooltip);
            });
        }
        
        function showTooltip(e) {
            const tooltip = document.createElement('div');
            tooltip.className = 'tooltip';
            tooltip.textContent = e.target.getAttribute('data-tooltip');
            tooltip.style.cssText = `
                position: absolute;
                background: #333;
                color: white;
                padding: 5px 10px;
                border-radius: 3px;
                font-size: 12px;
                z-index: 1000;
                pointer-events: none;
                top: ${e.pageY - 30}px;
                left: ${e.pageX}px;
            `;
            document.body.appendChild(tooltip);
        }
        
        function hideTooltip() {
            const tooltip = document.querySelector('.tooltip');
            if (tooltip) {
                tooltip.remove();
            }
        }
        
        // Performance monitoring
        function logPerformance() {
            if ('performance' in window) {
                const perfData = performance.timing;
                const pageLoadTime = perfData.loadEventEnd - perfData.navigationStart;
                console.log('Page load time:', pageLoadTime + 'ms');
            }
        }
        
        window.addEventListener('load', logPerformance);
        
        console.log('🏠 Premium Realty Dashboard Initialized Successfully!');
        console.log('📊 Features loaded: Property Management, Agent Management, Statistics, File Upload');
        console.log('⚡ Ready for property operations!');
    </script>
</body>
</html>