<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cloudinary Image Upload - Web Application</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .header {
            text-align: center;
            color: white;
            margin-bottom: 40px;
        }

        .header h1 {
            font-size: 2.5rem;
            margin-bottom: 10px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
        }

        .header p {
            font-size: 1.1rem;
            opacity: 0.9;
        }

        .badge {
            display: inline-block;
            background: rgba(255,255,255,0.2);
            padding: 5px 15px;
            border-radius: 20px;
            margin-top: 10px;
            font-weight: 600;
        }

        .upload-card {
            background: white;
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.2);
            margin-bottom: 40px;
        }

        .alert {
            padding: 15px 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
            animation: slideIn 0.3s ease;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .alert-success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .alert-error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        .upload-form {
            text-align: center;
        }

        .upload-area {
            border: 3px dashed #667eea;
            border-radius: 10px;
            padding: 60px 20px;
            text-align: center;
            transition: all 0.3s ease;
            cursor: pointer;
            background: #f8f9ff;
            margin-bottom: 20px;
        }

        .upload-area:hover {
            border-color: #764ba2;
            background: #f0f2ff;
            transform: scale(1.01);
        }

        .upload-icon {
            font-size: 4rem;
            margin-bottom: 20px;
        }

        .upload-area h3 {
            color: #333;
            margin-bottom: 10px;
            font-size: 1.5rem;
        }

        .upload-area p {
            color: #666;
            margin-bottom: 20px;
        }

        .file-input {
            display: none;
        }

        .btn {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            padding: 12px 30px;
            border-radius: 25px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.6);
        }

        .btn:disabled {
            opacity: 0.6;
            cursor: not-allowed;
        }

        #fileName {
            margin-top: 15px;
            color: #667eea;
            font-weight: 600;
            min-height: 24px;
        }

        .section-title {
            color: white;
            margin-bottom: 25px;
            text-align: center;
            font-size: 2rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
        }

        .gallery {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 25px;
            margin-bottom: 40px;
        }

        .image-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            animation: fadeIn 0.5s ease;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: scale(0.9);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        .image-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 30px rgba(0,0,0,0.15);
        }

        .image-card img {
            width: 100%;
            height: 250px;
            object-fit: cover;
            display: block;
        }

        .image-info {
            padding: 20px;
        }

        .image-info h4 {
            color: #333;
            margin-bottom: 10px;
            font-size: 1rem;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .image-meta {
            display: flex;
            justify-content: space-between;
            color: #666;
            font-size: 0.85rem;
            margin-bottom: 15px;
        }

        .image-actions {
            display: flex;
            gap: 10px;
        }

        .btn-small {
            padding: 8px 16px;
            font-size: 0.875rem;
            flex: 1;
        }

        .btn-delete {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
        }

        .btn-view {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
        }

        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: white;
        }

        .empty-state h3 {
            font-size: 1.5rem;
            margin-bottom: 10px;
        }

        .empty-state p {
            opacity: 0.9;
        }

        .loading {
            display: none;
            text-align: center;
            padding: 20px;
        }

        .loading.active {
            display: block;
        }

        .spinner {
            border: 4px solid #f3f3f3;
            border-top: 4px solid #667eea;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            animation: spin 1s linear infinite;
            margin: 0 auto;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        @media (max-width: 768px) {
            .header h1 {
                font-size: 2rem;
            }

            .upload-card {
                padding: 25px;
            }

            .gallery {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>☁️ Cloudinary Image Upload</h1>
            <p>Spring Boot Web Application</p>
            <div class="badge">WAR Deployment Ready</div>
            <c:if test="${not empty imageCount}">
                <div class="badge">${imageCount} Images Uploaded</div>
            </c:if>
        </div>

        <div class="upload-card">
            <!-- Success Message -->
            <c:if test="${not empty success}">
                <div class="alert alert-success">
                    <span>✅</span>
                    <span>${success}</span>
                </div>
            </c:if>

            <!-- Error Message -->
            <c:if test="${not empty error}">
                <div class="alert alert-error">
                    <span>❌</span>
                    <span>${error}</span>
                </div>
            </c:if>

            <!-- Upload Form -->
            <form action="${pageContext.request.contextPath}/upload" 
                  method="post" 
                  enctype="multipart/form-data" 
                  id="uploadForm" 
                  class="upload-form">
                
                <div class="upload-area" id="uploadArea">
                    <div class="upload-icon">📸</div>
                    <h3>Drop your image here</h3>
                    <p>or click to browse</p>
                    <input type="file" 
                           name="file" 
                           id="fileInput" 
                           class="file-input" 
                           accept="image/*" 
                           required>
                    <button type="button" class="btn" onclick="document.getElementById('fileInput').click()">
                        Choose Image
                    </button>
                    <p id="fileName"></p>
                </div>

                <button type="submit" class="btn" id="uploadBtn">
                    📤 Upload to Cloudinary
                </button>
            </form>

            <div class="loading" id="loading">
                <div class="spinner"></div>
                <p style="margin-top: 15px; color: #667eea;">Uploading...</p>
            </div>
        </div>

        <!-- Image Gallery -->
        <c:choose>
            <c:when test="${not empty images}">
                <h2 class="section-title">📁 Uploaded Images (${imageCount})</h2>
                <div class="gallery">
                    <c:forEach var="image" items="${images}">
                        <div class="image-card">
                            <img src="${image.secureUrl}" alt="${image.originalFilename}">
                            <div class="image-info">
                                <h4 title="${image.originalFilename}">${image.originalFilename}</h4>
                                <div class="image-meta">
                                    <span>${image.width}x${image.height}</span>
                                    <span><fmt:formatNumber value="${image.size / 1024}" maxFractionDigits="2"/> KB</span>
                                </div>
                                <div class="image-actions">
                                    <button class="btn btn-small btn-view" 
                                            onclick="window.open('${image.secureUrl}', '_blank')">
                                        👁️ View
                                    </button>
                                    <form action="${pageContext.request.contextPath}/delete" 
                                          method="post" 
                                          style="flex: 1; margin: 0;"
                                          onsubmit="return confirm('Are you sure you want to delete this image?');">
                                        <input type="hidden" name="publicId" value="${image.publicId}">
                                        <button type="submit" class="btn btn-small btn-delete">
                                            🗑️ Delete
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div class="empty-state">
                    <h3>📭 No images uploaded yet</h3>
                    <p>Start by uploading your first image!</p>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <script>
        // File input change handler
        document.getElementById('fileInput').addEventListener('change', function(e) {
            const fileName = e.target.files[0]?.name;
            if (fileName) {
                document.getElementById('fileName').textContent = '✓ ' + fileName;
            }
        });

        // Drag and drop handlers
        const uploadArea = document.getElementById('uploadArea');
        const fileInput = document.getElementById('fileInput');

        ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
            uploadArea.addEventListener(eventName, preventDefaults, false);
            document.body.addEventListener(eventName, preventDefaults, false);
        });

        function preventDefaults(e) {
            e.preventDefault();
            e.stopPropagation();
        }

        ['dragenter', 'dragover'].forEach(eventName => {
            uploadArea.addEventListener(eventName, () => {
                uploadArea.style.borderColor = '#764ba2';
                uploadArea.style.background = '#e8eaff';
            });
        });

        ['dragleave', 'drop'].forEach(eventName => {
            uploadArea.addEventListener(eventName, () => {
                uploadArea.style.borderColor = '#667eea';
                uploadArea.style.background = '#f8f9ff';
            });
        });

        uploadArea.addEventListener('drop', function(e) {
            const files = e.dataTransfer.files;
            if (files.length > 0) {
                fileInput.files = files;
                document.getElementById('fileName').textContent = '✓ ' + files[0].name;
            }
        });

        // Form submission loading state
        document.getElementById('uploadForm').addEventListener('submit', function() {
            document.getElementById('loading').classList.add('active');
            document.getElementById('uploadBtn').disabled = true;
            uploadArea.style.display = 'none';
        });

        // Auto-hide alerts after 5 seconds
        setTimeout(function() {
            const alerts = document.querySelectorAll('.alert');
            alerts.forEach(alert => {
                alert.style.transition = 'opacity 0.5s ease';
                alert.style.opacity = '0';
                setTimeout(() => alert.remove(), 500);
            });
        }, 5000);
    </script>
</body>
</html>