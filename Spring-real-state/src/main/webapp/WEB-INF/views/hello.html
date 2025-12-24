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
            background: linear-gradient(135deg, #f5f7fa 0%, #e8ecf1 100%);
            min-height: 100vh;
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 20px;
        }

        .header {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            margin-bottom: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            color: #2c3e50;
            font-size: 32px;
        }

        .header p {
            color: #7f8c8d;
            margin-top: 5px;
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
            background: #10b981;
            color: white;
            box-shadow: 0 4px 15px rgba(16, 185, 129, 0.3);
        }

        .btn-primary:hover {
            background: #059669;
            transform: translateY(-2px);
        }

        .btn-view {
            background: #f1f5f9;
            color: #475569;
        }

        .btn-view:hover {
            background: #e2e8f0;
        }

        .btn-edit {
            background: #dbeafe;
            color: #2563eb;
        }

        .btn-edit:hover {
            background: #bfdbfe;
        }

        .btn-delete {
            background: #fee2e2;
            color: #dc2626;
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

        .status-available {
            background: #10b981;
        }

        .status-pending {
            background: #f59e0b;
        }

        .status-sold {
            background: #ef4444;
        }

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

        .feature {
            display: flex;
            align-items: center;
            gap: 5px;
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
            gap: 8px;
        }

        .property-actions .btn {
            flex: 1;
            justify-content: center;
            padding: 10px;
            font-size: 13px;
        }

        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.6);
            z-index: 1000;
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
            width: 35px;
            height: 35px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 8px;
        }

        .close-btn:hover {
            background: #f1f5f9;
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
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            font-size: 14px;
            outline: none;
        }

        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {
            border-color: #10b981;
            box-shadow: 0 0 0 3px rgba(16, 185, 129, 0.1);
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }

        .image-upload {
            border: 2px dashed #cbd5e1;
            border-radius: 12px;
            padding: 30px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s;
            background: #f8fafc;
        }

        .image-upload:hover {
            border-color: #10b981;
            background: #f0fdf4;
        }

        .image-upload.has-image {
            padding: 0;
            border: none;
        }

        .image-preview {
            width: 100%;
            max-height: 300px;
            object-fit: cover;
            border-radius: 8px;
        }

        .upload-placeholder {
            color: #64748b;
        }

        .upload-icon {
            width: 50px;
            height: 50px;
            margin: 0 auto 15px;
            color: #cbd5e1;
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

        .btn-cancel:hover {
            background: #f8fafc;
        }

        .btn-submit {
            background: #10b981;
            color: white;
        }

        .btn-submit:hover {
            background: #059669;
        }

        input[type="file"] {
            display: none;
        }

        @media (max-width: 768px) {
            .properties-grid {
                grid-template-columns: 1fr;
            }
            
            .form-row {
                grid-template-columns: 1fr;
            }

            .header {
                flex-direction: column;
                gap: 15px;
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Header -->
        <div class="header">
            <div>
                <h1>Properties Management</h1>
                <p>Manage your property listings</p>
            </div>
            <button class="btn btn-primary" onclick="openAddModal()">
                <span>+</span> Add Property
            </button>
        </div>

        <!-- Filters -->
        <div class="filters">
            <div class="filter-group">
                <label>Status</label>
                <select id="filterStatus" onchange="filterProperties()">
                    <option value="All">All Status</option>
                    <option value="Available">Available</option>
                    <option value="Pending">Pending</option>
                    <option value="Sold">Sold</option>
                </select>
            </div>
            <div class="filter-group">
                <label>Location</label>
                <select id="filterLocation" onchange="filterProperties()">
                    <option value="All">All Locations</option>
                    <option value="Bhopal">Bhopal</option>
                    <option value="Indore">Indore</option>
                    <option value="Jabalpur">Jabalpur</option>
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
                </select>
            </div>
            <div class="filter-group">
                <label>Search</label>
                <input type="text" id="searchInput" placeholder="Search properties..." oninput="filterProperties()">
            </div>
        </div>

        <!-- Properties Grid -->
        <div class="properties-grid" id="propertiesGrid"></div>
    </div>

    <!-- Modal -->
    <div class="modal" id="propertyModal">
        <div class="modal-content">
            <div class="modal-header">
                <h2 id="modalTitle">Add New Property</h2>
                <button class="close-btn" onclick="closeModal()">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>Property Image</label>
                    <div class="image-upload" id="imageUploadArea" onclick="document.getElementById('imageInput').click()">
                        <input type="file" id="imageInput" accept="image/*" onchange="handleImageUpload(event)">
                        <div id="uploadPlaceholder">
                            <svg class="upload-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12"></path>
                            </svg>
                            <p class="upload-placeholder">Click to upload image</p>
                        </div>
                        <img id="imagePreview" class="image-preview" style="display: none;">
                    </div>
                </div>

                <div class="form-group">
                    <label>Title *</label>
                    <input type="text" id="title" placeholder="Enter property title" required>
                </div>

                <div class="form-group">
                    <label>Location *</label>
                    <input type="text" id="location" placeholder="e.g., Arera Colony, Bhopal, MP" required>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label>Price *</label>
                        <input type="number" id="price" placeholder="Enter price" required>
                    </div>
                    <div class="form-group">
                        <label>Price Unit</label>
                        <select id="priceUnit">
                            <option value="Lakh">Lakh</option>
                            <option value="Cr">Crore</option>
                        </select>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label>Status</label>
                        <select id="status">
                            <option value="Available">Available</option>
                            <option value="Pending">Pending</option>
                            <option value="Sold">Sold</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Type</label>
                        <select id="type">
                            <option value="Villa">Villa</option>
                            <option value="Apartment">Apartment</option>
                            <option value="Commercial">Commercial</option>
                            <option value="House">House</option>
                        </select>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label>Bedrooms</label>
                        <input type="number" id="beds" placeholder="0" min="0">
                    </div>
                    <div class="form-group">
                        <label>Bathrooms</label>
                        <input type="number" id="baths" placeholder="0" min="0">
                    </div>
                </div>

                <div class="form-group">
                    <label>Square Feet *</label>
                    <input type="number" id="sqft" placeholder="Enter area in sq ft" required>
                </div>

                <div class="form-group">
                    <label>Agent Name *</label>
                    <input type="text" id="agent" placeholder="Enter agent name" required>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-cancel" onclick="closeModal()">Cancel</button>
                <button class="btn btn-submit" onclick="saveProperty()">Save Property</button>
            </div>
        </div>
    </div>

    <script>
        // Temporary data storage
        let properties = [
            {
                id: 1,
                title: "Luxury Villa in Arera Colony",
                location: "Arera Colony, Bhopal, MP",
                price: "85",
                priceUnit: "Lakh",
                status: "Available",
                beds: 4,
                baths: 3,
                sqft: 2500,
                type: "Villa",
                agent: "Rajesh Sharma",
                agentInitials: "RS",
                image: "img/maxresdefault.jpg"
            },
            {
                id: 2,
                title: "Modern Apartment Complex",
                location: "Vijay Nagar, Indore, MP",
                price: "45",
                priceUnit: "Lakh",
                status: "Pending",
                beds: 2,
                baths: 2,
                sqft: 1200,
                type: "Apartment",
                agent: "Priya Gupta",
                agentInitials: "PG",
                image: "https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?w=600&h=400&fit=crop"
            },
            {
                id: 3,
                title: "Prime Commercial Space",
                location: "Civil Lines, Jabalpur, MP",
                price: "1.2",
                priceUnit: "Cr",
                status: "Sold",
                beds: 0,
                baths: 2,
                sqft: 3000,
                type: "Commercial",
                agent: "Amit Singh",
                agentInitials: "AS",
                image: "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=600&h=400&fit=crop"
            }
        ];

        let editingId = null;
        let currentImageData = null;

        // Initialize
        function init() {
            renderProperties();
        }

        // Render properties
        function renderProperties() {
            const grid = document.getElementById('propertiesGrid');
            const filteredProps = getFilteredProperties();
            
            grid.innerHTML = filteredProps.map(prop => `
                <div class="property-card">
                    <div class="property-image">
                        <img src="${prop.image}" alt="${prop.title}">
                        <span class="status-badge status-${prop.status.toLowerCase()}">${prop.status}</span>
                    </div>
                    <div class="property-content">
                        <h3 class="property-title">${prop.title}</h3>
                        <div class="property-location">
                            <svg width="16" height="16" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
                            </svg>
                            ${prop.location}
                        </div>
                        <div class="property-price">₹${prop.price} ${prop.priceUnit}</div>
                        <div class="property-features">
                            ${prop.beds > 0 ? `
                            <div class="feature">
                                <svg width="16" height="16" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"></path>
                                </svg>
                                ${prop.beds} Beds
                            </div>` : ''}
                            <div class="feature">
                                <svg width="16" height="16" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"></path>
                                </svg>
                                ${prop.baths} Bath
                            </div>
                            <div class="feature">
                                <svg width="16" height="16" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 5a1 1 0 011-1h14a1 1 0 011 1v2a1 1 0 01-1 1H5a1 1 0 01-1-1V5zM4 13a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H5a1 1 0 01-1-1v-6zM16 13a1 1 0 011-1h2a1 1 0 011 1v6a1 1 0 01-1 1h-2a1 1 0 01-1-1v-6z"></path>
                                </svg>
                                ${prop.sqft} sqft
                            </div>
                        </div>
                        <div class="property-agent">
                            <div class="agent-info">
                                <div class="agent-avatar">${prop.agentInitials}</div>
                                <span>${prop.agent}</span>
                            </div>
                            <span class="type-badge">${prop.type}</span>
                        </div>
                        <div class="property-actions">
                            <button class="btn btn-view" onclick="viewProperty(${prop.id})">
                                <svg width="16" height="16" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path>
                                </svg>
                                View
                            </button>
                            <button class="btn btn-edit" onclick="editProperty(${prop.id})">
                                <svg width="16" height="16" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"></path>
                                </svg>
                                Edit
                            </button>
                            <button class="btn btn-delete" onclick="deleteProperty(${prop.id})">
                                <svg width="16" height="16" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>
            `).join('');
        }

        // Filter properties
        function getFilteredProperties() {
            const status = document.getElementById('filterStatus').value;
            const location = document.getElementById('filterLocation').value;
            const type = document.getElementById('filterType').value;
            const search = document.getElementById('searchInput').value.toLowerCase();

            return properties.filter(prop => {
                const matchStatus = status === 'All' || prop.status === status;
                const matchLocation = location === 'All' || prop.location.includes(location);
                const matchType = type === 'All' || prop.type === type;
                const matchSearch = prop.title.toLowerCase().includes(search) || 
                                  prop.location.toLowerCase().includes(search);
                
                return matchStatus && matchLocation && matchType && matchSearch;
            });
        }

        function filterProperties() {
            renderProperties();
        }

        // Open add modal
        function openAddModal() {
            editingId = null;
            document.getElementById('modalTitle').textContent = 'Add New Property';
            resetForm();
            document.getElementById('propertyModal').classList.add('active');
        }

        // View property
        function viewProperty(id) {
            const prop = properties.find(p => p.id === id);
            if (!prop) return;

            alert(`Property Details:\n\nTitle: ${prop.title}\nLocation: ${prop.location}\nPrice: ₹${prop.price} ${prop.priceUnit}\nStatus: ${prop.status}\nType: ${prop.type}\nBeds: ${prop.beds}\nBaths: ${prop.baths}\nArea: ${prop.sqft} sqft\nAgent: ${prop.agent}`);
        }

        // Edit property
        function editProperty(id) {
            const prop = properties.find(p => p.id === id);
            if (!prop) return;

            editingId = id;
            document.getElementById('modalTitle').textContent = 'Edit Property';
            
            document.getElementById('title').value = prop.title;
            document.getElementById('location').value = prop.location;
            document.getElementById('price').value = prop.price;
            document.getElementById('priceUnit').value = prop.priceUnit;
            document.getElementById('status').value = prop.status;
            document.getElementById('type').value = prop.type;
            document.getElementById('beds').value = prop.beds;
            document.getElementById('baths').value = prop.baths;
            document.getElementById('sqft').value = prop.sqft;
            document.getElementById('agent').value = prop.agent;
            
            currentImageData = prop.image;
            if (prop.image) {
                showImagePreview(prop.image);
            }
            
            document.getElementById('propertyModal').classList.add('active');
        }

        // Delete property
        function deleteProperty(id) {
            if (confirm('Are you sure you want to delete this property?')) {
                properties = properties.filter(p => p.id !== id);
                renderProperties();
            }
        }

        // Handle image upload
        function handleImageUpload(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    currentImageData = e.target.result;
                    showImagePreview(e.target.result);
                };
                reader.readAsDataURL(file);
            }
        }

        // Show image preview
        function showImagePreview(imageSrc) {
            const uploadArea = document.getElementById('imageUploadArea');
            const placeholder = document.getElementById('uploadPlaceholder');
            const preview = document.getElementById('imagePreview');
            
            placeholder.style.display = 'none';
            preview.src = imageSrc;
            preview.style.display = 'block';
            uploadArea.classList.add('has-image');
        }

        // Reset form
        function resetForm() {
            document.getElementById('title').value = '';
            document.getElementById('location').value = '';
            document.getElementById('price').value = '';
            document.getElementById('priceUnit').value = 'Lakh';
            document.getElementById('status').value = 'Available';
            document.getElementById('type').value = 'Villa';
            document.getElementById('beds').value = '';
            document.getElementById('baths').value = '';
            document.getElementById('sqft').value = '';
            document.getElementById('agent').value = '';
            
            const uploadArea = document.getElementById('imageUploadArea');
            const placeholder = document.getElementById('uploadPlaceholder');
            const preview = document.getElementById('imagePreview');
            
            placeholder.style.display = 'block';
            preview.style.display = 'none';
            preview.src = '';
            uploadArea.classList.remove('has-image');
            currentImageData = null;
        }

        // Close modal
        function closeModal() {
            document.getElementById('propertyModal').classList.remove('active');
            resetForm();
        }

        // Save property
        function saveProperty() {
            const title = document.getElementById('title').value;
            const location = document.getElementById('location').value;
            const price = document.getElementById('price').value;
            const priceUnit = document.getElementById('priceUnit').value;
            const status = document.getElementById('status').value;
            const type = document.getElementById('type').value;
            const beds = parseInt(document.getElementById('beds').value) || 0;
            const baths = parseInt(document.getElementById('baths').value) || 0;
            const sqft = document.getElementById('sqft').value;
            const agent = document.getElementById('agent').value;

            // Validation
            if (!title || !location || !price || !sqft || !agent) {
                alert('Please fill in all required fields!');
                return;
            }

            if (!currentImageData) {
                alert('Please upload a property image!');
                return;
            }

            // Generate agent initials
            const agentInitials = agent.split(' ').map(n => n[0]).join('').toUpperCase();

            const propertyData = {
                title,
                location,
                price,
                priceUnit,
                status,
                type,
                beds,
                baths,
                sqft: parseInt(sqft),
                agent,
                agentInitials,
                image: currentImageData
            };

            if (editingId) {
                // Update existing property
                const index = properties.findIndex(p => p.id === editingId);
                properties[index] = { ...properties[index], ...propertyData };
            } else {
                // Add new property
                const newId = properties.length > 0 ? Math.max(...properties.map(p => p.id)) + 1 : 1;
                properties.push({ id: newId, ...propertyData });
            }

            closeModal();
            renderProperties();
        }

        // Close modal on outside click
        document.getElementById('propertyModal').addEventListener('click', function(e) {
            if (e.target === this) {
                closeModal();
            }
        });

        // Initialize on page load
        window.onload = init;
    </script>
</body>
</html>