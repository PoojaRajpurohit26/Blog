<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
    Cookie c[] = request.getCookies();
    String email = null;
    if(c==null){
        response.sendRedirect("index.jsp");
    }
    else{
        for(int i=0 ; i<c.length ; i++){
            if(c[i].getName().equals("admin")){
                email = c[i].getValue();
                break;
            }
        }
        if(email==null){
            response.sendRedirect("index.jsp");
        }
        else{
%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Blog Admin - Dashboard</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">
  <style>
      .fa-edit{
            color:DodgerBlue;
      }
      .fa-save{
            color:green;
      }
      .fa-trash{
            color:red;
      }
  </style>
  <script src="jquery-3.6.4.min.js"></script>
  <script>
	$(document).on("click",".btn-primary",function(){
		var category = $("#category").val();
		$.post(
			"add_category.jsp",{category:category},function(data){
                                data=data.trim();
				$(".table-borderless").prepend("<tr id='"+data+"'><td id='category-"+data+"'>"+category+"</td><td><i rel='"+data+"' class='fa fa-edit'></i></td><td><i rel='"+data+"' class='fa fa-trash'></i></td></tr>");
                                $("#msg").attr("class","alert alert-success");
                                $("#msg").text("Record Inserted");
			}
		);
	});
	$(document).on("click",".fa-trash",function(){
		var id = $(this).attr("rel");
		$.post(
			"delete.jsp",{id:id},function(data){
                                data=data.trim();
                                if(data=="success"){
                                    $("#"+id).fadeOut(1000);
                                    $("#msg").attr("class","alert alert-primary");
                                    $("#msg").text("Record Deleted");
                                }
                                else{
                                    $("#msg").attr("class","alert alert-danger");
                                    $("#msg").text("Record not deleted....Try again");
                                }
			}
		);
	});
	$(document).on("click",".fa-edit",function(){
                $("#msg").removeAttr("class");
                $("#msg").text("");
		var id = $(this).attr("rel");
		var category = $("#category-"+id).text();
		$("#category-"+id).html("<input type='text' id='cat-"+id+"' value='"+category+"' class='form-control'>");
		$(this).attr("class","fa fa-save");
	});
	$(document).on("click",".fa-save",function(){
		var id = $(this).attr("rel");
		var category = $("#cat-"+id).val();
		$(this).attr("class","fa fa-edit");
		$.post(
			"update.jsp",{code:id,category:category},function(data){
				data=data.trim();
                                if(data=="success"){
                                    $("#category-"+id).html("<h5>"+category+"</h5>");
                                    $("#msg").attr("class","alert alert-info");
                                    $("#msg").text("Record Updated");
                                }
                                else{
                                    $("#msg").attr("class","alert alert-danger");
                                    $("#msg").text("Try again");
                                }
			}
		);
	});
  </script>

</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <div class="blog-heading">
              <span style="font-size: 30px;cursor: pointer;margin-left: 15px;color: #0080ff;">MegaBlog</span>
          </div>
 
          <ul class="navbar-nav ml-auto">

            <li class="nav-item dropdown no-arrow">
              <a class="nav-link" href="dashboard.jsp">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Category</span>
              </a>
            </li>
            
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link" href="topic.jsp">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Blog</span>
              </a>
            </li>
            
            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=email%></span>
                <!--<img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">-->
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">
			<div class="row">
				<div class="col-lg-6">
					<label><h4>Category</h4></label>
					<input type="text" id="category" class="form-control" required><br>
                                        <button class="btn btn-primary" style="background-color:#0080ff">Add Category</button>
				</div>
			</div>
			<br><br>
			<div class="row">
				<div class="col-lg-12">
                                        <div class="" id="msg"></div>
					<table class="table table-borderless">
                                            <thead class="w3-blue">
                                                <tr><td>Category</td><td></td><td></td></tr>
                                            </thead>
                                            <tbody>
						<%
							try{
								Class.forName("com.mysql.jdbc.Driver");
								Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog","root","");
								Statement st = cn.createStatement();
								ResultSet rs = st.executeQuery("select * from category order by sn desc");
								while(rs.next()){
									%>
									<tr id="<%=rs.getString("code")%>">
										<td id="category-<%=rs.getString("code")%>"><%=rs.getString("category")%></td><td><i rel="<%=rs.getString("code")%>" class="fa fa-edit"></i></td><td><i rel="<%=rs.getString("code")%>" class="fa fa-trash"></i></td>
									</tr>
									<%
								}
								cn.close();
							}
							catch(Exception er){
								out.println(er.getMessage());
							}
						%>
                                            </tbody>
					</table>
				</div>
			</div>
        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2019</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">X</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="js/demo/chart-area-demo.js"></script>
  <script src="js/demo/chart-pie-demo.js"></script>

</body>

</html>
<%
        }
    }
%>
