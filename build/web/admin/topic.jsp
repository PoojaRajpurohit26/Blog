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
                <div class="col-lg-3"></div>
                <div class="col-lg-6" id="form">
                    <h3>Add Topic</h3>
                    <label>Topic Title</label> 
                    <input type="text" id="title" class="form-control" required><br>
                    <label>Short Description</label> 
                    <textarea rows="3" id="sdesc" style="resize:none" class="form-control" required></textarea><br>
                    <label>Description</label> 
                    <textarea rows="6" id="desc" style="resize:none" class="form-control" required></textarea><br>
                    <label>Category</label>
                    <select id="category" class="form-control">
                        <option value=""></option>
                        <%
                            try{
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog","root","");
                                    Statement st = cn.createStatement();
                                    ResultSet rs = st.executeQuery("select * from category order by sn desc");
                                    while(rs.next()){
                                            %>
                                            <option value="<%=rs.getString("code")%>"><%=rs.getString("category")%></option>
                                            <%
                                    }
                                    cn.close();
                            }
                            catch(Exception er){
                                    out.println(er.getMessage());
                            }
                        %>
                    </select><br><br>
                    <button class="btn btn-primary" style="background-color:#0080ff">Submit</button><br><br>
                </div>
            </div>
            <div class="row">
                <!-- The Modal -->
                <div class="modal" id="blogedit">
                  <div class="modal-dialog">
                    <div class="modal-content">

                      <!-- Modal Header -->
                      <div class="modal-header" style="background-color:#36B9CC;color:white">
                        <h4 class="modal-title">Edit Blog</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                      </div>

                      <!-- Modal body -->
                      <div class="modal-body">
                          
                      </div>

                      <!-- Modal footer -->
                      <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                      </div>

                    </div>
                  </div>
                </div>
                    <div class="col-lg-12">
                            <div class="" id="msgbox"></div>
                            <table class="table table-striped">
                                    <%
                                            try{
                                                    Class.forName("com.mysql.jdbc.Driver");
                                                    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog","root","");
                                                    Statement st1 = cn.createStatement();
                                                    ResultSet rs1 = st1.executeQuery("select * from blog");
                                                    while(rs1.next()){
                                                            %>
                                                            <tr id="<%=rs1.getString("code")%>">
                                                                    <td id="t-<%=rs1.getString("code")%>"><%=rs1.getString("title")%></td><td><i rel="<%=rs1.getString("code")%>" class="fa fa-edit"></i></td><td><i rel="<%=rs1.getString("code")%>" class="fa fa-trash"></i></td>
                                                            </tr>
                                                            <%
                                                    }
                                                    cn.close();
                                            }
                                            catch(Exception er){
                                                    out.println(er.getMessage());
                                            }
                                    %>
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
            <span aria-hidden="true">Ã</span>
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
  <script>
      $(document).on("click",".btn-primary",function(){
          var title = $("#title").val();
          var sdesc = $("#sdesc").val();
          var desc = $("#desc").val();
          var code = $("#category").val();
          $.post(
              "add_topic.jsp",{title:title,sdesc:sdesc,desc:desc,code:code},function(data){
                    data=data.trim();
                    if(data.length>0){
                        $("#form").load("image_upload.jsp",{code:data});
                    }
              }
          );
      });
      $(document).on("click",".fa-edit",function(){
          var code=$(this).attr("rel");
          $("#msgbox").attr("class","");
          $("#msgbox").text("");
          $.post(
              "edit_blog.jsp",{code:code},function(data){
                    $(".modal-body").html(data);
                    $("#blogedit").modal();
              }
          );
      });
      $(document).on("click",".btn-info",function(){
          var code = $(this).attr("id");
          var title = $("#titles").val();
          var sdes = $("#sde").val();
          var des = $("#de").val();
          $.post(
             "update_topic.jsp",{code:code,title:title,sdes:sdes,des:des},function(data){
                 data=data.trim();
                 if(data=="success"){
                     $("#t-"+code).text(title);
                     $("#msgbox").attr("class","alert alert-info");
                     $("#msgbox").text("Record Updated");
                 }
                 else{
                     $("#msgbox").attr("class","alert alert-danger");
                     $("#msgbox").text("Try Again");
                 }
             } 
          );
      });
      $(document).on("click",".fa-trash",function(){
          var code = $(this).attr("rel");
          $.post(
              "delete_blog.jsp",{code:code},function(data){
                    data=data.trim();
                    if(data=="success"){
                        $("#"+code).fadeOut(1000);
                        $("#msgbox").attr("class","alert alert-warning");
                        $("#msgbox").text("Record Deleted");
                    }
                    else{
                        $("#msgbox").attr("class","alert alert-danger");
                        $("#msgbox").text("Try Again");
                    }
              }
          );
      });
  </script>
</body>

</html>
<%
        }
    }
%>
