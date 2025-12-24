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

        /* Header */
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

        .nav a.active {
            color: #00d4aa;
        }

        .login-btn {
            background-color: #00d4aa;
            color: white;
            padding: 10px 25px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 600;
            transition: background-color 0.3s;
        }

        .login-btn:hover {
            background-color: #00a885;
        }

        /* Main Content */
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

        /* Image Gallery */
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
            cursor: pointer;
            transition: transform 0.3s;
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
        }

        /* Content Grid */
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

        .property-header {
            margin-bottom: 20px;
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

        /* Property Features */
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

        /* Description */
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

        /* Amenities */
        .amenities-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
        }

        .amenity-item {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 10px;
            background-color: #f9f9f9;
            border-radius: 5px;
        }

        .amenity-check {
            color: #00d4aa;
            font-size: 20px;
        }

        /* Agent Card */
        .agent-card {
            text-align: center;
        }

        .agent-avatar {
            width: 100px;
            height: 100px;
            background: linear-gradient(135deg, #00d4aa, #00a885);
            border-radius: 50%;
            margin: 0 auto 15px;
            background-size: cover;
            background-position: center;
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

        .agent-contact {
            display: flex;
            flex-direction: column;
            gap: 8px;
            margin-bottom: 20px;
            font-size: 14px;
        }

        .agent-contact-item {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            color: #666;
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

        /* Map */
        .map {
            width: 100%;
            height: 400px;
            background-color: #e0e0e0;
            border-radius: 10px;
            overflow: hidden;
        }

        /* Image Details Info */
        .image-info {
            background: linear-gradient(to top, rgba(0,0,0,0.7), transparent);
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            padding: 20px;
            color: white;
            transform: translateY(100%);
            transition: transform 0.3s;
        }

        .main-image:hover .image-info {
            transform: translateY(0);
        }

        .image-info h3 {
            font-size: 18px;
            margin-bottom: 5px;
        }

        .image-info p {
            font-size: 14px;
            opacity: 0.9;
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

            .amenities-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
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
                    <a href="#" class="btn btn-primary px-3 d-none d-lg-flex">Login</a>
                </div>
            </nav>
        </div>
    <!-- Main Content -->
    <div class="container">
        <a href="#" class="back-link"><i class="fas fa-arrow-left"></i> Back to listings</a>

        <!-- Image Gallery -->
        <div class="gallery">
            <div class="main-image" id="mainImage" style="background-image: url('https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=800')">
                <div class="for-sell-badge">For Sell</div>
                <div class="image-counter"><i class="fas fa-images"></i> 1 / 6</div>
                <div class="image-info">
                    <h3 id="imageTitle">Exterior Front View</h3>
                    <p id="imageDesc">Beautiful modern architecture with clean lines</p>
                </div>
            </div>
            <div class="gallery-item selected" data-index="0" data-title="Exterior Front View" data-desc="Beautiful modern architecture with clean lines" style="background-image: url('https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=400')"></div>
            <div class="gallery-item" data-index="1" data-title="Living Room" data-desc="Spacious living area with natural lighting" style="background-image: url('https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?w=400')"></div>
            <div class="gallery-item" data-index="2" data-title="Modern Kitchen" data-desc="State-of-the-art appliances and island counter" style="background-image: url('https://images.unsplash.com/photo-1556912173-3bb406ef7e77?w=400')"></div>
            <div class="gallery-item" data-index="3" data-title="Master Bedroom" data-desc="Elegant bedroom with large windows" style="background-image: url('https://images.unsplash.com/photo-1616594039964-ae9021a400a0?w=400')"></div>
            <div class="gallery-item" data-index="4" data-title="Bathroom" data-desc="Luxurious bathroom with modern fixtures" style="background-image: url('https://images.unsplash.com/photo-1552321554-5fefe8c9ef14?w=400')"></div>
            <div class="gallery-item" data-index="5" data-title="Backyard & Pool" data-desc="Private pool area perfect for relaxation" style="background-image: url('https://images.unsplash.com/photo-1600047509807-ba8f99d2cdde?w=400')"></div>
        </div>

        <!-- Content Grid -->
        <div class="content-grid">
            <!-- Main Content -->
            <div class="main-content">
                <div class="property-header">
                    <div class="price">$12,345</div>
                    <h1 class="property-title">Golden Urban House For Sell</h1>
                    <div class="property-location">
                        <i class="fas fa-map-marker-alt"></i> 123 Golden Street, Los Angeles, California
                    </div>
                </div>

                <!-- Features -->
                <div class="features">
                    <div class="feature-item">
                        <div class="feature-icon">
                            <i class="fas fa-ruler-combined"></i>
                        </div>
                        <div class="feature-value">1000</div>
                        <div class="feature-label">Sqft</div>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon">
                            <i class="fas fa-bed"></i>
                        </div>
                        <div class="feature-value">3</div>
                        <div class="feature-label">Bedrooms</div>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon">
                            <i class="fas fa-bath"></i>
                        </div>
                        <div class="feature-value">2</div>
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
                        <p>Welcome to this stunning Golden Urban House, a perfect blend of modern luxury and comfortable living. This beautiful property features spacious living areas, high-end finishes, and an abundance of natural light throughout.</p>
                        <br>
                        <p>The home boasts an open-concept floor plan that seamlessly connects the living, dining, and kitchen areas, making it ideal for both everyday living and entertaining guests. The gourmet kitchen is equipped with premium appliances, custom cabinetry, and elegant countertops.</p>
                        <br>
                        <p>Step outside to discover a beautifully landscaped backyard with a large patio area, perfect for outdoor dining and relaxation. The property is located in a highly sought-after neighborhood with easy access to schools, shopping centers, and major highways.</p>
                    </div>
                </div>

                <!-- Amenities -->
                <div class="section">
                    <h2 class="section-title">Property Amenities</h2>
                    <div class="amenities-grid">
                        <div class="amenity-item">
                            <span class="amenity-check"><i class="fas fa-check-circle"></i></span>
                            <span>Central Air Conditioning</span>
                        </div>
                        <div class="amenity-item">
                            <span class="amenity-check"><i class="fas fa-check-circle"></i></span>
                            <span>Modern Kitchen</span>
                        </div>
                        <div class="amenity-item">
                            <span class="amenity-check"><i class="fas fa-check-circle"></i></span>
                            <span>Swimming Pool</span>
                        </div>
                        <div class="amenity-item">
                            <span class="amenity-check"><i class="fas fa-check-circle"></i></span>
                            <span>Garden</span>
                        </div>
                        <div class="amenity-item">
                            <span class="amenity-check"><i class="fas fa-check-circle"></i></span>
                            <span>Home Security System</span>
                        </div>
                        <div class="amenity-item">
                            <span class="amenity-check"><i class="fas fa-check-circle"></i></span>
                            <span>Hardwood Flooring</span>
                        </div>
                        <div class="amenity-item">
                            <span class="amenity-check"><i class="fas fa-check-circle"></i></span>
                            <span>Walk-in Closets</span>
                        </div>
                        <div class="amenity-item">
                            <span class="amenity-check"><i class="fas fa-check-circle"></i></span>
                            <span>Laundry Room</span>
                        </div>
                        <div class="amenity-item">
                            <span class="amenity-check"><i class="fas fa-check-circle"></i></span>
                            <span>Smart Home Technology</span>
                        </div>
                        <div class="amenity-item">
                            <span class="amenity-check"><i class="fas fa-check-circle"></i></span>
                            <span>Energy Efficient Windows</span>
                        </div>
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
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3305.733778763284!2d-118.24531492346706!3d34.05223731827009!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c2c75ddc27da13%3A0xe22fdf6f254608f4!2sLos%20Angeles%2C%20CA!5e0!3m2!1sen!2sus!4v1696000000000!5m2!1sen!2sus"
                            allowfullscreen>
                        </iframe>
                    </div>
                </div>
            </div>

            <!-- Sidebar -->
            <div class="sidebar">
                <div class="agent-card">
                    <div class="agent-avatar" style="background-image: url('https://randomuser.me/api/portraits/men/32.jpg')"></div>
                    <div class="agent-name">John Anderson</div>
                    <div class="agent-title">Senior Real Estate Agent</div>
                    <div class="agent-contact">
                        <div class="agent-contact-item">
                            <i class="fas fa-phone"></i>
                            <span>+1 (555) 123-4567</span>
                        </div>
                        <div class="agent-contact-item">
                            <i class="fas fa-envelope"></i>
                            <span>john.anderson@realty.com</span>
                        </div>
                    </div>
                    <button class="contact-btn"><i class="fas fa-calendar-check"></i> Schedule Tour</button>
                    <button class="contact-btn secondary"><i class="fas fa-comment-dots"></i> Contact Agent</button>
                </div>

                <div class="section" style="margin-top: 30px;">
                    <h3 style="font-size: 18px; margin-bottom: 15px;">Property Details</h3>
                    <div style="display: flex; flex-direction: column; gap: 12px; font-size: 14px;">
                        <div style="display: flex; justify-content: space-between; padding: 8px 0; border-bottom: 1px solid #eee;">
                            <span style="color: #666;"><i class="fas fa-hashtag"></i> Property ID:</span>
                            <span style="font-weight: 600;">#12345</span>
                        </div>
                        <div style="display: flex; justify-content: space-between; padding: 8px 0; border-bottom: 1px solid #eee;">
                            <span style="color: #666;"><i class="fas fa-building"></i> Property Type:</span>
                            <span style="font-weight: 600;">Villa</span>
                        </div>
                        <div style="display: flex; justify-content: space-between; padding: 8px 0; border-bottom: 1px solid #eee;">
                            <span style="color: #666;"><i class="fas fa-calendar"></i> Year Built:</span>
                            <span style="font-weight: 600;">2020</span>
                        </div>
                        <div style="display: flex; justify-content: space-between; padding: 8px 0; border-bottom: 1px solid #eee;">
                            <span style="color: #666;"><i class="fas fa-info-circle"></i> Status:</span>
                            <span style="font-weight: 600; color: #00d4aa;">For Sale</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Gallery image click handler with selection indicator
        const galleryItems = document.querySelectorAll('.gallery-item');
        const mainImage = document.getElementById('mainImage');
        const imageTitle = document.getElementById('imageTitle');
        const imageDesc = document.getElementById('imageDesc');
        const imageCounter = document.querySelector('.image-counter');

        galleryItems.forEach(item => {
            item.addEventListener('click', function() {
                // Remove selected class from all items
                galleryItems.forEach(i => i.classList.remove('selected'));
                
                // Add selected class to clicked item
                this.classList.add('selected');
                
                // Get the background image and details
                const clickedBg = this.style.backgroundImage;
                const title = this.dataset.title;
                const desc = this.dataset.desc;
                const index = parseInt(this.dataset.index) + 1;
                
                // Update main image and details
                mainImage.style.backgroundImage = clickedBg;
                imageTitle.textContent = title;
                imageDesc.textContent = desc;
                imageCounter.innerHTML = `<i class="fas fa-images"></i> ${index} / 6`;
                
                // Add a slight animation effect
                mainImage.style.opacity = '0.7';
                setTimeout(() => {
                    mainImage.style.opacity = '1';
                }, 100);
            });
        });

        // Optional: Add keyboard navigation
        let currentIndex = 0;
        document.addEventListener('keydown', function(e) {
            if (e.key === 'ArrowRight') {
                currentIndex = (currentIndex + 1) % galleryItems.length;
                galleryItems[currentIndex].click();
            } else if (e.key === 'ArrowLeft') {
                currentIndex = (currentIndex - 1 + galleryItems.length) % galleryItems.length;
                galleryItems[currentIndex].click();
            }
        });
    </script>
</body>
</html>