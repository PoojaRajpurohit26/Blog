<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
    if(request.getParameter("id")==null){
        response.sendRedirect("index.jsp");
    }
    else{
        String code = request.getParameter("id").trim();
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog","root","");
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery("select * from blog where code='"+code+"'");
            if(rs.next()){
            %>
<!doctype html>
<html lang="en">
  <head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="megakit,business,company,agency,multipurpose,modern,bootstrap4">
  
  <meta name="author" content="themefisher.com">

  <title><%=rs.getString("title").trim()%></title>

  <!-- bootstrap.min css -->
  <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
  <!-- Icon Font Css -->
  <link rel="stylesheet" href="plugins/themify/css/themify-icons.css">
  <link rel="stylesheet" href="plugins/fontawesome/css/all.css">
  <link rel="stylesheet" href="plugins/magnific-popup/dist/magnific-popup.css">
  <!-- Owl Carousel CSS -->
  <link rel="stylesheet" href="plugins/slick-carousel/slick/slick.css">
  <link rel="stylesheet" href="plugins/slick-carousel/slick/slick-theme.css">
    <style>
      @import url(http://fonts.googleapis.com/css?family=Montserrat:400,700|Poppins:300,400,600,700);
      pre{
          overflow-x: auto;
            white-space: pre-wrap;
            word-wrap: break-word;
            font-size: 15px;
            font-family: "Poppins", sans-serif;
      }
      #img{
          height:90px;
          width:80px;
      }
  </style>

  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="css/style.css">

</head>

<body>

<!-- Header Start --> 
<%@include file="header.jsp"%>
<!-- Header Close --> 

<div class="main-wrapper ">
<section class="page-title bg-1">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="block text-center">
          <span class="text-white">News details</span>
          <h1 class="text-capitalize mb-4 text-lg">Blog Single</h1>
          <ul class="list-inline">
            <li class="list-inline-item"><a href="index.html" class="text-white">Home</a></li>
            <li class="list-inline-item"><span class="text-white">/</span></li>
            <li class="list-inline-item"><a href="#" class="text-white-50">News details</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</section>



<section class="section blog-wrap bg-gray">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="row" id="record">
	<div class="col-lg-12 mb-5">
		<div class="single-blog-item">
                    <img src="upload/<%=rs.getString("code")%>.jpg"  style="height:380px;width:900px;" alt="" class="img-fluid rounded">

			<div class="blog-item-content bg-white p-5">
				<div class="blog-item-meta bg-gray py-1 px-2">
                                        <%
                                            String ccode = rs.getString("category_code");
                                            try{
                                                Class.forName("com.mysql.jdbc.Driver");
                                                Connection cn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog","root","");
                                                Statement st1 = cn1.createStatement();
                                                ResultSet rs1 = st1.executeQuery("select * from category where code='"+ccode+"'");
                                                if(rs1.next()){
                                        %>
                                        <span class="text-muted text-capitalize mr-3"><i class="ti-pencil-alt mr-2"></i><%=rs1.getString("category")%></span>
					<span class="text-black text-capitalize mr-3"><i class="ti-time mr-1"></i><%=rs.getString("dt")%></span>
                                        <%
                                               }
                                                cn1.close();
                                            }
                                            catch(Exception er){
                                                out.println(er.getMessage());
                                            } 
                                        %>
				</div> 

                            <h2 class="mt-3 mb-4"><a href="blog-single.html"><%=rs.getString("title").trim()%></a></h2>
                            <p class="lead mb-4"><pre><%=rs.getString("short_desc")%></pre></p>

                                <p><pre><%=rs.getString("description")%></pre></p>
			</div>
		</div>
	</div>


	<div class="col-lg-12 mb-5">
		<div class="posts-nav bg-white p-5 d-lg-flex d-md-flex justify-content-between ">
                        <%
                            int sn = rs.getInt("sn");
                            if(request.getParameter("sn")!=null && request.getParameter("sn").length()>0){
                                sn = Integer.parseInt(request.getParameter("sn").trim());
                            }
                            try{
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection cn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog","root","");
                                Statement st2 = cn2.createStatement();
                                ResultSet rs2 = st2.executeQuery("select * from blog where category_code='"+ccode+"' AND sn < "+sn+" order by sn desc limit 0,1");
                                if(rs2.next()){
                                   %>
                                   <a class="post-prev align-items-center" href="blog.jsp?id=<%=rs2.getString("code")%>&sn=<%=rs2.getString("sn")%>">
                                            <div class="posts-prev-item mb-4 mb-lg-0">
                                                <h4><span class="nav-posts-desc text-color">- Previous Post</span></h4>
                                            </div>
                                    </a>
                                    <%  
                                }
                                Statement st3 = cn2.createStatement();
                                ResultSet rs3 = st3.executeQuery("select * from blog where category_code='"+ccode+"' AND sn > "+sn+" limit 0,1");
                                if(rs3.next()){
                                   %>
                                   <a class="posts-next" href="blog.jsp?id=<%=rs3.getString("code")%>&sn=<%=rs3.getString("sn")%>">
                                            <div class="posts-next-item pt-4 pt-lg-0">
                                                    <h4><span class="nav-posts-desc text-lg-right text-md-right text-color d-block">- Next Post</span></h4>
                                            </div>
                                    </a>
                                    <%
                                }
                        %>
			
			<div class="border"></div>
			
                        <%
                                cn2.close();
                             }
                             catch(Exception er){
                                 out.println(er.getMessage());
                             } 
                        %>
		</div>
	</div>
</div>
            </div>
            <div class="col-lg-4">
                <div class="sidebar-wrap">
	<div class="sidebar-widget search card p-4 mb-3 border-0">
		<input type="text" id="sch" class="form-control" placeholder="search"><br>
		<!--<a href="#" id="search" class="btn btn-mian btn-small d-block mt-2">search</a>-->
                <button class="btn btn-danger" id="search">search</button>
	</div>
	<div class="sidebar-widget latest-post card border-0 p-4 mb-3">
		<h5>Latest Posts</h5>

        <%
                   try{
                          Class.forName("com.mysql.jdbc.Driver");
                          Connection cn3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog","root","");
                          Statement st3 = cn3.createStatement();
                          ResultSet rs3 = st3.executeQuery("select * from blog order by sn desc limit 0,3");
                          while(rs3.next()){
                  %>
                  <div class="media border-bottom py-3">
                      <a href="blog.jsp?id=<%=rs3.getString("code")%>"><img id="img" class="mr-4" src="upload/<%=rs3.getString("code")%>.jpg" alt=""></a>
                      <div class="media-body">
                          <h6 class="my-2"><a href="blog.jsp?id=<%=rs3.getString("code")%>"><%=rs3.getString("title")%></a></h6>
                          <span class="text-sm text-muted"><%=rs3.getString("dt")%></span>
                      </div>
                  </div>
                   <%
                          }
                          cn3.close();
                     }
                     catch(Exception er){
                              out.println(er.getMessage());
                     }
                  %>
	</div>

	<div class="sidebar-widget bg-white rounded tags p-4 mb-3">
		<h5 class="mb-4">Tags</h5>
                <%
                    Statement st4 = cn.createStatement();
                    ResultSet rs4 = st4.executeQuery("select * from blog order by RAND() limit 0,8");
                    while(rs4.next()){
                %>
                <a href="blog.jsp?id=<%=rs4.getString("code")%>"><%=rs4.getString("title")%></a>
                <%
                    }
                %>
	</div>
</div>
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
</footer>
   
    </div>

    <!-- 
    Essential Scripts
    =====================================-->

    
    <!-- Main jQuery -->
    <!--<script src="plugins/jquery/jquery.js"></script>-->
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
    
    <!--<script src="js/script.js"></script>-->
    <script src="js/jquery-3.6.4.min.js"></script>
    <script>
        var sch="";
        $(document).on("click","#search",function(){
            sch = $("#sch").val();
            $.post(
              "search.jsp",{sch:sch},function(data){
                    data=data.trim();
                    if(data.length>125){
                        $("#record").html(data);
                    }
                    else{
                        $("#record").html("Record not found");
                    }
               }  
            );
        });
        var lm = 1;
        $(document).on("click","#load",function(){
           /* lm = lm+1;
            $.post(
              "search.jsp",{sch:sch,lm:lm},function(data){
                    data=data.trim();
                    alert(data.length);
                    if(data.length>125){
                        $("#record").html(data);
                    }
                    else{
                        $("#load").hide();
                    }
               }  
            );
            alert(lm+" "+sch); */
        });
        var lastScrollTop = 0;
        $(window).scroll(function(event){
            if(sch.length>0){
                var st = $(this).scrollTop();
                if(st>lastScrollTop){
                   
                        $.post(
                          "search.jsp",{sch:sch,lm:lm},function(data){
                                data=data.trim();
                                
                                if(data.length>125){
                                    $("#record").append(data);
                                    lm=lm+1;
                                }
                                
                           }  
                        );
                }

                lastScrollTop = st;
            }
        });
    </script>

  </body>
  </html>
  <%
            }
            else{
                response.sendRedirect("index.jsp");
            }
            cn.close();
        }
        catch(Exception er){
                out.println(er.getMessage());
        }
    }
%>