<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>About Us - Premium Realty</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Learn about Premium Realty - your trusted real estate partner" name="description">
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
        .counter-item { background: #fff; padding: 30px; border-radius: 10px; box-shadow: 0 0 30px rgba(0,0,0,0.08); transition: transform 0.3s; }
        .counter-item:hover { transform: translateY(-5px); }
        .counter-item i { font-size: 50px; color: #00B98E; margin-bottom: 15px; }
        .counter-item h2 { font-size: 48px; font-weight: 700; color: #0E2E50; margin-bottom: 10px; }
        .feature-box { transition: all 0.3s ease; }
        .feature-box:hover { box-shadow: 0 10px 30px rgba(0,0,0,0.1); transform: translateY(-5px); }
    </style>
</head>
<body>
    <div class="container-xxl bg-white p-0">
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>

        <!-- Navbar -->
        <div class="container-fluid nav-bar bg-transparent">
            <nav class="navbar navbar-expand-lg bg-white navbar-light py-0 px-4">
                <a href="index.jsp" class="navbar-brand d-flex align-items-center text-center">
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
                        <a href="index" class="nav-item nav-link">Home</a>
                        <a href="about" class="nav-item nav-link active">About</a>
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
                                <a href="testimonial" class="dropdown-item">Testimonial</a>
                                <a href="404" class="dropdown-item">404 Error</a>
                            </div>
                        </div>
                        <a href="contact" class="nav-item nav-link">Contact</a>
                    </div>
                    <a href="#" class="btn btn-primary px-3 d-none d-lg-flex">Login</a>
                </div>
            </nav>
        </div>

        <!-- Header -->
        <div class="container-fluid header bg-white p-0">
            <div class="row g-0 align-items-center flex-column-reverse flex-md-row">
                <div class="col-md-6 p-5 mt-lg-5">
                    <h1 class="display-5 animated fadeIn mb-4">About Us</h1> 
                    <nav aria-label="breadcrumb animated fadeIn">
                        <ol class="breadcrumb text-uppercase">
                            <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Pages</a></li>
                            <li class="breadcrumb-item text-body active" aria-current="page">About</li>
                        </ol>
                    </nav>
                </div>
                <div class="col-md-6 animated fadeIn">
                    <img class="img-fluid" src="img/header.jpg" alt="">
                </div>
            </div>
        </div>

        <!-- About Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-5 align-items-center">
                    <div class="col-lg-6 wow fadeIn" data-wow-delay="0.1s">
                        <div class="about-img position-relative overflow-hidden p-5 pe-0">
                            <img class="img-fluid w-100" src="img/about.jpg" alt="About Premium Realty">
                        </div>
                    </div>
                    <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
                        <h1 class="mb-4">Your Trusted Real Estate Partner Since 2010</h1>
                        <p class="mb-4">Premium Realty has been serving the real estate industry for over a decade, helping thousands of families find their dream homes. We are committed to providing exceptional service, transparent transactions, and expert guidance throughout your property journey.</p>
                        <p class="mb-4">Our team of experienced professionals understands the local market dynamics and is dedicated to matching you with properties that perfectly suit your lifestyle and budget. Whether you're buying, selling, or renting, we're here to make the process seamless and stress-free.</p>
                        <p class="mb-4">With a portfolio of over 2,500 properties and a proven track record of 1,200+ successful transactions, we have established ourselves as a leader in the real estate sector. Our commitment to excellence has earned us numerous industry awards and, more importantly, the trust of our clients.</p>
                        <div class="row g-3">
                            <div class="col-sm-6">
                                <h6 class="mb-3"><i class="fa fa-check text-primary me-2"></i>Award Winning Agency</h6>
                                <h6 class="mb-0"><i class="fa fa-check text-primary me-2"></i>Professional Team</h6>
                            </div>
                            <div class="col-sm-6">
                                <h6 class="mb-3"><i class="fa fa-check text-primary me-2"></i>24/7 Customer Support</h6>
                                <h6 class="mb-0"><i class="fa fa-check text-primary me-2"></i>Fair & Transparent Pricing</h6>
                            </div>
                        </div>
                        <div class="d-flex align-items-center mt-4">
                            <a class="btn btn-primary rounded-pill px-4 me-3" href="property-list">View Properties</a>
                            <a class="btn btn-outline-primary btn-square me-3" href="#"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-primary btn-square me-3" href="#"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-primary btn-square me-3" href="#"><i class="fab fa-instagram"></i></a>
                            <a class="btn btn-outline-primary btn-square" href="#"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Stats Counter -->
        <div class="container-xxl py-5" style="background-color: #f8f9fa;">
            <div class="container">
                <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                    <h1 class="mb-3">Our Achievements</h1>
                    <p>Numbers that speak for themselves - our commitment to excellence in real estate services</p>
                </div>
                <div class="row g-4">
                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="counter-item text-center">
                            <i class="fa fa-home"></i>
                            <h2 class="mb-0">2500+</h2>
                            <p class="mb-0">Properties Listed</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="counter-item text-center">
                            <i class="fa fa-users"></i>
                            <h2 class="mb-0">1800+</h2>
                            <p class="mb-0">Happy Clients</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                        <div class="counter-item text-center">
                            <i class="fa fa-building"></i>
                            <h2 class="mb-0">1200+</h2>
                            <p class="mb-0">Sold Properties</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.7s">
                        <div class="counter-item text-center">
                            <i class="fa fa-award"></i>
                            <h2 class="mb-0">25+</h2>
                            <p class="mb-0">Awards Won</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Our Story -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 800px;">
                    <h1 class="mb-3">Our Story</h1>
                    <p class="lead">From humble beginnings to becoming a trusted name in real estate</p>
                </div>
                <div class="row g-4">
                    <div class="col-12 wow fadeInUp" data-wow-delay="0.1s">
                        <p class="fs-5">Premium Realty was founded in 2010 by a group of passionate real estate professionals who shared a common vision: to transform the property buying and selling experience in India. What started as a small office with just five team members has now grown into a full-service real estate company with over 50 dedicated professionals.</p>
                        <p class="fs-5">Our journey has been marked by continuous growth, innovation, and an unwavering commitment to client satisfaction. We embraced technology early on, becoming one of the first agencies in the region to offer virtual property tours and online documentation services.</p>
                        <p class="fs-5">Today, we operate across multiple cities, managing a diverse portfolio that includes residential apartments, luxury villas, commercial spaces, and plots. Despite our growth, we've maintained the personalized service and attention to detail that defined us from day one.</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Our Mission & Vision -->
        <div class="container-xxl py-5" style="background-color: #f8f9fa;">
            <div class="container">
                <div class="row g-5">
                    <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="border rounded p-5 h-100 bg-white">
                            <div class="d-flex align-items-center mb-4">
                                <div class="bg-primary rounded-circle d-flex align-items-center justify-content-center" style="width: 60px; height: 60px;">
                                    <i class="fa fa-bullseye text-white fs-3"></i>
                                </div>
                                <h4 class="ms-3 mb-0">Our Mission</h4>
                            </div>
                            <p>To provide exceptional real estate services by combining market expertise with personalized attention. We strive to make property transactions transparent, efficient, and stress-free for all our clients.</p>
                            <p>We are committed to building lasting relationships based on trust, integrity, and outstanding results. Every property transaction is an opportunity to exceed expectations and create value for our clients.</p>
                            <p class="mb-0">Through continuous innovation and professional development, we aim to set new standards in the real estate industry while maintaining the highest ethical practices.</p>
                        </div>
                    </div>
                    <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="border rounded p-5 h-100 bg-white">
                            <div class="d-flex align-items-center mb-4">
                                <div class="bg-primary rounded-circle d-flex align-items-center justify-content-center" style="width: 60px; height: 60px;">
                                    <i class="fa fa-eye text-white fs-3"></i>
                                </div>
                                <h4 class="ms-3 mb-0">Our Vision</h4>
                            </div>
                            <p>To be the most trusted and innovative real estate company in India, recognized for our exceptional service, market knowledge, and commitment to our clients' success.</p>
                            <p>We envision a future where finding your dream property is an enjoyable and rewarding experience, supported by cutting-edge technology and human expertise working in perfect harmony.</p>
                            <p class="mb-0">Our goal is to expand our services nationally while maintaining the personal touch and local market expertise that our clients value most.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Core Values -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                    <h1 class="mb-3">Our Core Values</h1>
                    <p>The principles that guide everything we do</p>
                </div>
                <div class="row g-4">
                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="feature-box bg-light text-center h-100 p-4 rounded">
                            <div class="bg-primary rounded-circle d-inline-flex align-items-center justify-content-center mb-3" style="width: 70px; height: 70px;">
                                <i class="fa fa-shield-alt text-white fs-2"></i>
                            </div>
                            <h5 class="mb-3">Integrity</h5>
                            <p class="mb-0">We maintain the highest ethical standards in all our dealings, ensuring transparency and honesty.</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="feature-box bg-light text-center h-100 p-4 rounded">
                            <div class="bg-primary rounded-circle d-inline-flex align-items-center justify-content-center mb-3" style="width: 70px; height: 70px;">
                                <i class="fa fa-user-check text-white fs-2"></i>
                            </div>
                            <h5 class="mb-3">Client Focus</h5>
                            <p class="mb-0">Our clients' needs and satisfaction are at the center of everything we do.</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                        <div class="feature-box bg-light text-center h-100 p-4 rounded">
                            <div class="bg-primary rounded-circle d-inline-flex align-items-center justify-content-center mb-3" style="width: 70px; height: 70px;">
                                <i class="fa fa-lightbulb text-white fs-2"></i>
                            </div>
                            <h5 class="mb-3">Innovation</h5>
                            <p class="mb-0">We embrace technology and innovative solutions to enhance the real estate experience.</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.7s">
                        <div class="feature-box bg-light text-center h-100 p-4 rounded">
                            <div class="bg-primary rounded-circle d-inline-flex align-items-center justify-content-center mb-3" style="width: 70px; height: 70px;">
                                <i class="fa fa-star text-white fs-2"></i>
                            </div>
                            <h5 class="mb-3">Excellence</h5>
                            <p class="mb-0">We strive for excellence in every aspect of our service delivery.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Why Choose Us -->
        <div class="container-xxl py-5" style="background-color: #f8f9fa;">
            <div class="container">
                <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                    <h1 class="mb-3">Why Choose Premium Realty?</h1>
                    <p>We stand out in the real estate industry with our commitment to excellence and client satisfaction</p>
                </div>
                <div class="row g-4">
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="bg-white text-center h-100 p-4 p-xl-5 rounded shadow-sm">
                            <i class="fa fa-certificate fa-3x text-primary mb-4"></i>
                            <h4 class="mb-3">Certified Agents</h4>
                            <p class="mb-4">Our team consists of licensed and certified real estate professionals with years of industry experience and deep market knowledge.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="bg-white text-center h-100 p-4 p-xl-5 rounded shadow-sm">
                            <i class="fa fa-handshake fa-3x text-primary mb-4"></i>
                            <h4 class="mb-3">Trusted Service</h4>
                            <p class="mb-4">We prioritize transparency and honesty in all our dealings, building trust with every transaction and maintaining long-term relationships.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                        <div class="bg-white text-center h-100 p-4 p-xl-5 rounded shadow-sm">
                            <i class="fa fa-chart-line fa-3x text-primary mb-4"></i>
                            <h4 class="mb-3">Market Expertise</h4>
                            <p class="mb-4">Deep understanding of local market trends helps us provide accurate property valuations and strategic insights for better decisions.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="bg-white text-center h-100 p-4 p-xl-5 rounded shadow-sm">
                            <i class="fa fa-headset fa-3x text-primary mb-4"></i>
                            <h4 class="mb-3">24/7 Support</h4>
                            <p class="mb-4">Our dedicated support team is available round the clock to assist you with any queries, ensuring a smooth experience at every step.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="bg-white text-center h-100 p-4 p-xl-5 rounded shadow-sm">
                            <i class="fa fa-search-location fa-3x text-primary mb-4"></i>
                            <h4 class="mb-3">Wide Coverage</h4>
                            <p class="mb-4">Access to properties across multiple locations with diverse options to suit every need, from budget-friendly to luxury properties.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                        <div class="bg-white text-center h-100 p-4 p-xl-5 rounded shadow-sm">
                            <i class="fa fa-dollar-sign fa-3x text-primary mb-4"></i>
                            <h4 class="mb-3">Best Deals</h4>
                            <p class="mb-4">We negotiate the best prices and terms to ensure you get maximum value for your investment with no hidden charges.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Call to Action -->
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
                                    <h1 class="mb-3">Ready to Find Your Dream Property?</h1>
                                    <p>Contact our certified real estate agents today and let us help you find the perfect property that matches your needs and budget. We're here to make your real estate journey smooth and successful.</p>
                                </div>
                                <a href="contact" class="btn btn-primary py-3 px-4 me-2"><i class="fa fa-phone-alt me-2"></i>Contact Us</a>
                                <a href="property-list" class="btn btn-dark py-3 px-4"><i class="fa fa-search me-2"></i>View Properties</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
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
                        <a class="btn btn-link text-white-50" href="about">About Us</a>
                        <a class="btn btn-link text-white-50" href="contact">Contact Us</a>
                        <a class="btn btn-link text-white-50" href="property-list">Our Services</a>
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
                        <p>Subscribe to our newsletter for the latest property updates.</p>
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
                                <a href="index">Home</a>
                                <a href="#">Cookies</a>
                                <a href="contact">Help</a>
                                <a href="#">FAQs</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

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