
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="megakit,business,company,agency,multipurpose,modern,bootstrap4">
  
  <meta name="author" content="themefisher.com">

  <title>Blog</title>

  <!-- bootstrap.min css -->
  <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
  <!-- Icon Font Css -->
  <link rel="stylesheet" href="plugins/themify/css/themify-icons.css">
  <link rel="stylesheet" href="plugins/fontawesome/css/all.css">
  <link rel="stylesheet" href="plugins/magnific-popup/dist/magnific-popup.css">
  <!-- Owl Carousel CSS -->
  <link rel="stylesheet" href="plugins/slick-carousel/slick/slick.css">
  <link rel="stylesheet" href="plugins/slick-carousel/slick/slick-theme.css">

  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="css/style.css">
  <style>
      @import url(http://fonts.googleapis.com/css?family=Montserrat:400,700|Poppins:300,400,600,700);
      pre{
          overflow-x: auto;
            white-space: pre-wrap;
            word-wrap: break-word;
            font-size: 15px;
            font-family: "Poppins", sans-serif;
      }
  </style>

</head>

<body>

<!-- Header Start --> 
<%@include file="header.jsp" %>
<!-- Header Close --> 

<div class="main-wrapper ">
<section class="page-title bg-1">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="block text-center">
          <span class="text-white">Our blog</span>
          <h1 class="text-capitalize mb-4 text-lg">Blog articles</h1>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="section blog-wrap bg-gray">
    <div class="container">
        <div class="row">
            <%
                  int start = 0;
                  int pg = 0;
                  int count=0;
                  String nextpath="";
                  String prepath="";
                  try{
                        if(request.getParameter("pg")!=null && request.getParameter("pg").length()>0){
                            pg = Integer.parseInt(request.getParameter("pg").trim());
                            if(pg<0){
                                response.sendRedirect("index.jsp");
                            }
                        }
                        start = pg*2;
                        nextpath = "index.jsp?pg="+(pg+1);
                        prepath = "index.jsp?pg="+(pg-1);
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog","root","");
                        Statement st = cn.createStatement();
                        String query = "select * from blog order by sn desc limit "+start+",2";
                        if(request.getParameter("cat")!=null && request.getParameter("cat").trim().length()>0  ){
                            String cat = request.getParameter("cat").trim();
                            nextpath = nextpath + "&cat="+cat;
                            prepath = prepath + "&cat="+cat;
                            query = "select * from blog where category_code='"+cat+"' order by sn desc limit "+start+",2";
                        }
                        ResultSet rs = st.executeQuery(query);
                        
                        while(rs.next()){
                            count++;
            %>
	<div class="col-lg-6 col-md-6 mb-5">
		<div class="blog-item">
			<img src="upload/<%=rs.getString("code")%>.jpg" style="height:250px;width:540px;" alt="" class="img-fluid rounded">

			<div class="blog-item-content bg-white p-5">
				<div class="blog-item-meta bg-gray py-1 px-2">
					<span class="text-black text-capitalize mr-3"><i class="ti-time mr-1"></i><%=rs.getString("dt")%></span>
				</div> 

				<h3 class="mt-3 mb-3"><a href="blog.jsp?id=<%=rs.getString("code")%>"><%=rs.getString("title")%></a></h3>
                                <p class="mb-4"><pre><%=rs.getString("short_desc")%></pre></p>

				<a href="blog.jsp?id=<%=rs.getString("code")%>" class="btn btn-small btn-main btn-round-full">Learn More</a>
			</div>
		</div>
	</div>
                <%
                        }      
                        if(count==0){
                            out.println("<h5>Record not found</h5>");
                        }
                        cn.close();
                    }
                    catch(Exception er){
                            out.println(er.getMessage());
                    }
                %>
</div>

        <div class="row justify-content-center mt-5">
            <div class="col-lg-6 text-center">
            	<nav class="navigation pagination d-inline-block">
	                <div class="nav-links">
                            <%
                            if(pg>0){
                            %>
                                <a class="prev page-numbers" href="<%=prepath%>">Prev</a>
                            <%
                            }
                            if(count>0){
                            %>
	                    <a class="next page-numbers" href="<%=nextpath%>">Next</a>
                            <%
                            }  
                            %>
	                </div>
	            </nav>
            </div>
        </div>
    </div>
</section>

<!-- footer Start -->
<footer class="footer section">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="widget">
					<h4 class="text-capitalize mb-4">Company</h4>

					<ul class="list-unstyled footer-menu lh-35">
						<li><a href="#">Terms & Conditions</a></li>
						<li><a href="#">Privacy Policy</a></li>
						<li><a href="#">Support</a></li>
						<li><a href="#">FAQ</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-2 col-md-6 col-sm-6">
				<div class="widget">
					<h4 class="text-capitalize mb-4">Quick Links</h4>

					<ul class="list-unstyled footer-menu lh-35">
						<li><a href="#">About</a></li>
						<li><a href="#">Services</a></li>
						<li><a href="#">Team</a></li>
						<li><a href="#">Contact</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="widget">
					<h4 class="text-capitalize mb-4">Subscribe Us</h4>
					<p>Subscribe to get latest news article and resources  </p>
				</div>
			</div>

			<div class="col-lg-3 ml-auto col-sm-6">
				<div class="widget">
					<div class="logo mb-4">
						<h3>Mega<span>kit.</span></h3>
					</div>
					<h6><a href="tel:+23-345-67890" >Support@megakit.com</a></h6>
					<a href="mailto:support@gmail.com"><span class="text-color h4">+23-456-6588</span></a>
				</div>
			</div>
		</div>
		
		<div class="footer-btm pt-4">
			<div class="row">
				<div class="col-lg-6">
					<div class="copyright">
						&copy; Copyright Reserved to <span class="text-color">Megakit.</span> by <a href="https://themefisher.com/" target="_blank">Themefisher</a>
					</div>
				</div>
				<div class="col-lg-6 text-left text-lg-right">
					<ul class="list-inline footer-socials">
						<li class="list-i	<div class="footer-btm pt-4">
							<div class="row">
								<div class="col-lg-4 col-md-12 col-sm-12">
									<div class="copyright">
										&copy; Copyright Reserved to <span class="text-color">Megakit.</span> by <a href="https://themefisher.com/" target="_blank">Themefisher</a>
									</div>
								</div>
				
								<div class="col-lg-4 col-md-12 col-sm-12">
									<div class="copyright">
									Distributed by  <a href="https://themewagon.com/" target="_blank">Themewagon</a>
									</div>
								</div>
								<div class="col-lg-4 col-md-12 col-sm-12 text-left text-lg-left">
									<ul class="list-inline footer-socials">
										<li class="list-inline-item"><a href="https://www.facebook.com/themefisher"><i class="ti-facebook mr-2"></i>Facebook</a></li>
										<li class="list-inline-item"><a href="https://twitter.com/themefisher"><i class="ti-twitter mr-2"></i>Twitter</a></li>
										<li class="list-inline-item"><a href="https://www.pinterest.com/themefisher/"><i class="ti-linkedin mr-2 "></i>Linkedin</a></li>
									</ul>
								</div>
							</div>
						</div>
				</div>
			</div>
		</div>
	</div>
</footer>
   
    </div>

    <!-- 
    Essential Scripts
    =====================================-->

    
    <!-- Main jQuery -->
    <script src="plugins/jquery/jquery.js"></script>
    <script src="js/contact.js"></script>
    <!-- Bootstrap 4.3.1 -->
    <script src="plugins/bootstrap/js/popper.js"></script>
    <script src="plugins/bootstrap/js/bootstrap.min.js"></script>
   <!--  Magnific Popup-->
    <script src="plugins/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
    <!-- Slick Slider -->
    <script src="plugins/slick-carousel/slick/slick.min.js"></script>
    <!-- Counterup -->
    <script src="plugins/counterup/jquery.waypoints.min.js"></script>
    <script src="plugins/counterup/jquery.counterup.min.js"></script>

    <!-- Google Map -->
    <script src="plugins/google-map/map.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAkeLMlsiwzp6b3Gnaxd86lvakimwGA6UA&callback=initMap"></script>    
    
    <script src="js/script.js"></script>

  </body>
  </html>