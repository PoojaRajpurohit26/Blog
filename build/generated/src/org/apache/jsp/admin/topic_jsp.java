package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class topic_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');

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

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("\n");
      out.write("  <meta charset=\"utf-8\">\n");
      out.write("  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("  <meta name=\"description\" content=\"\">\n");
      out.write("  <meta name=\"author\" content=\"\">\n");
      out.write("\n");
      out.write("  <title>SB Admin 2 - Dashboard</title>\n");
      out.write("\n");
      out.write("  <!-- Custom fonts for this template-->\n");
      out.write("  <link href=\"vendor/fontawesome-free/css/all.min.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("  <link href=\"https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i\" rel=\"stylesheet\">\n");
      out.write("  <link rel=\"stylesheet\" href=\"https://www.w3schools.com/w3css/4/w3.css\">\n");
      out.write("\n");
      out.write("  <!-- Custom styles for this template-->\n");
      out.write("  <link href=\"css/sb-admin-2.min.css\" rel=\"stylesheet\">\n");
      out.write("  <style>\n");
      out.write("      .fa-edit{\n");
      out.write("            color:DodgerBlue;\n");
      out.write("      }\n");
      out.write("      .fa-save{\n");
      out.write("            color:green;\n");
      out.write("      }\n");
      out.write("      .fa-trash{\n");
      out.write("            color:red;\n");
      out.write("      }\n");
      out.write("  </style>\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body id=\"page-top\">\n");
      out.write("\n");
      out.write("  <!-- Page Wrapper -->\n");
      out.write("  <div id=\"wrapper\">\n");
      out.write("\n");
      out.write("    <!-- Sidebar -->\n");
      out.write("    <ul class=\"navbar-nav bg-gradient-primary sidebar sidebar-dark accordion\" id=\"accordionSidebar\">\n");
      out.write("\n");
      out.write("      <!-- Sidebar - Brand -->\n");
      out.write("      <a class=\"sidebar-brand d-flex align-items-center justify-content-center\" href=\"index.html\">\n");
      out.write("        <div class=\"sidebar-brand-icon rotate-n-15\">\n");
      out.write("          <i class=\"fas fa-laugh-wink\"></i>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"sidebar-brand-text mx-3\">SB Admin <sup>2</sup></div>\n");
      out.write("      </a>\n");
      out.write("\n");
      out.write("      <!-- Divider -->\n");
      out.write("      <hr class=\"sidebar-divider my-0\">\n");
      out.write("\n");
      out.write("      <!-- Nav Item - Dashboard -->\n");
      out.write("      <li class=\"nav-item active\">\n");
      out.write("        <a class=\"nav-link\" href=\"index.html\">\n");
      out.write("          <i class=\"fas fa-fw fa-tachometer-alt\"></i>\n");
      out.write("          <span>Dashboard</span></a>\n");
      out.write("      </li>\n");
      out.write("\n");
      out.write("      <!-- Divider -->\n");
      out.write("      <hr class=\"sidebar-divider\">\n");
      out.write("\n");
      out.write("      <!-- Heading -->\n");
      out.write("      <div class=\"sidebar-heading\">\n");
      out.write("        Interface\n");
      out.write("      </div>\n");
      out.write("\n");
      out.write("      <!-- Nav Item - Pages Collapse Menu -->\n");
      out.write("      <li class=\"nav-item\">\n");
      out.write("        <a class=\"nav-link collapsed\" href=\"#\" data-toggle=\"collapse\" data-target=\"#collapseTwo\" aria-expanded=\"true\" aria-controls=\"collapseTwo\">\n");
      out.write("          <i class=\"fas fa-fw fa-cog\"></i>\n");
      out.write("          <span>Components</span>\n");
      out.write("        </a>\n");
      out.write("        <div id=\"collapseTwo\" class=\"collapse\" aria-labelledby=\"headingTwo\" data-parent=\"#accordionSidebar\">\n");
      out.write("          <div class=\"bg-white py-2 collapse-inner rounded\">\n");
      out.write("            <h6 class=\"collapse-header\">Custom Components:</h6>\n");
      out.write("            <a class=\"collapse-item\" href=\"buttons.html\">Buttons</a>\n");
      out.write("            <a class=\"collapse-item\" href=\"cards.html\">Cards</a>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </li>\n");
      out.write("\n");
      out.write("      <!-- Nav Item - Utilities Collapse Menu -->\n");
      out.write("      <li class=\"nav-item\">\n");
      out.write("        <a class=\"nav-link collapsed\" href=\"#\" data-toggle=\"collapse\" data-target=\"#collapseUtilities\" aria-expanded=\"true\" aria-controls=\"collapseUtilities\">\n");
      out.write("          <i class=\"fas fa-fw fa-wrench\"></i>\n");
      out.write("          <span>Utilities</span>\n");
      out.write("        </a>\n");
      out.write("        <div id=\"collapseUtilities\" class=\"collapse\" aria-labelledby=\"headingUtilities\" data-parent=\"#accordionSidebar\">\n");
      out.write("          <div class=\"bg-white py-2 collapse-inner rounded\">\n");
      out.write("            <h6 class=\"collapse-header\">Custom Utilities:</h6>\n");
      out.write("            <a class=\"collapse-item\" href=\"utilities-color.html\">Colors</a>\n");
      out.write("            <a class=\"collapse-item\" href=\"utilities-border.html\">Borders</a>\n");
      out.write("            <a class=\"collapse-item\" href=\"utilities-animation.html\">Animations</a>\n");
      out.write("            <a class=\"collapse-item\" href=\"utilities-other.html\">Other</a>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </li>\n");
      out.write("\n");
      out.write("      <!-- Divider -->\n");
      out.write("      <hr class=\"sidebar-divider\">\n");
      out.write("\n");
      out.write("      <!-- Heading -->\n");
      out.write("      <div class=\"sidebar-heading\">\n");
      out.write("        Addons\n");
      out.write("      </div>\n");
      out.write("\n");
      out.write("      <!-- Nav Item - Pages Collapse Menu -->\n");
      out.write("      <li class=\"nav-item\">\n");
      out.write("        <a class=\"nav-link collapsed\" href=\"#\" data-toggle=\"collapse\" data-target=\"#collapsePages\" aria-expanded=\"true\" aria-controls=\"collapsePages\">\n");
      out.write("          <i class=\"fas fa-fw fa-folder\"></i>\n");
      out.write("          <span>Pages</span>\n");
      out.write("        </a>\n");
      out.write("        <div id=\"collapsePages\" class=\"collapse\" aria-labelledby=\"headingPages\" data-parent=\"#accordionSidebar\">\n");
      out.write("          <div class=\"bg-white py-2 collapse-inner rounded\">\n");
      out.write("            <h6 class=\"collapse-header\">Login Screens:</h6>\n");
      out.write("            <a class=\"collapse-item\" href=\"login.html\">Login</a>\n");
      out.write("            <a class=\"collapse-item\" href=\"register.html\">Register</a>\n");
      out.write("            <a class=\"collapse-item\" href=\"forgot-password.html\">Forgot Password</a>\n");
      out.write("            <div class=\"collapse-divider\"></div>\n");
      out.write("            <h6 class=\"collapse-header\">Other Pages:</h6>\n");
      out.write("            <a class=\"collapse-item\" href=\"404.html\">404 Page</a>\n");
      out.write("            <a class=\"collapse-item\" href=\"blank.html\">Blank Page</a>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </li>\n");
      out.write("\n");
      out.write("      <!-- Nav Item - Charts -->\n");
      out.write("      <li class=\"nav-item\">\n");
      out.write("        <a class=\"nav-link\" href=\"charts.html\">\n");
      out.write("          <i class=\"fas fa-fw fa-chart-area\"></i>\n");
      out.write("          <span>Charts</span></a>\n");
      out.write("      </li>\n");
      out.write("\n");
      out.write("      <!-- Nav Item - Tables -->\n");
      out.write("      <li class=\"nav-item\">\n");
      out.write("        <a class=\"nav-link\" href=\"tables.html\">\n");
      out.write("          <i class=\"fas fa-fw fa-table\"></i>\n");
      out.write("          <span>Tables</span></a>\n");
      out.write("      </li>\n");
      out.write("\n");
      out.write("      <!-- Divider -->\n");
      out.write("      <hr class=\"sidebar-divider d-none d-md-block\">\n");
      out.write("\n");
      out.write("      <!-- Sidebar Toggler (Sidebar) -->\n");
      out.write("      <div class=\"text-center d-none d-md-inline\">\n");
      out.write("        <button class=\"rounded-circle border-0\" id=\"sidebarToggle\"></button>\n");
      out.write("      </div>\n");
      out.write("\n");
      out.write("    </ul>\n");
      out.write("    <!-- End of Sidebar -->\n");
      out.write("\n");
      out.write("    <!-- Content Wrapper -->\n");
      out.write("    <div id=\"content-wrapper\" class=\"d-flex flex-column\">\n");
      out.write("\n");
      out.write("      <!-- Main Content -->\n");
      out.write("      <div id=\"content\">\n");
      out.write("\n");
      out.write("        <!-- Topbar -->\n");
      out.write("        <nav class=\"navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow\">\n");
      out.write("\n");
      out.write("          <!-- Sidebar Toggle (Topbar) -->\n");
      out.write("          <button id=\"sidebarToggleTop\" class=\"btn btn-link d-md-none rounded-circle mr-3\">\n");
      out.write("            <i class=\"fa fa-bars\"></i>\n");
      out.write("          </button>\n");
      out.write("\n");
      out.write("          <!-- Topbar Search -->\n");
      out.write("          <form class=\"d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search\">\n");
      out.write("            <div class=\"input-group\">\n");
      out.write("              <input type=\"text\" class=\"form-control bg-light border-0 small\" placeholder=\"Search for...\" aria-label=\"Search\" aria-describedby=\"basic-addon2\">\n");
      out.write("              <div class=\"input-group-append\">\n");
      out.write("                <button class=\"btn btn-primary\" type=\"button\">\n");
      out.write("                  <i class=\"fas fa-search fa-sm\"></i>\n");
      out.write("                </button>\n");
      out.write("              </div>\n");
      out.write("            </div>\n");
      out.write("          </form>\n");
      out.write("\n");
      out.write("          <!-- Topbar Navbar -->\n");
      out.write("          <ul class=\"navbar-nav ml-auto\">\n");
      out.write("\n");
      out.write("            <!-- Nav Item - Search Dropdown (Visible Only XS) -->\n");
      out.write("            <li class=\"nav-item dropdown no-arrow d-sm-none\">\n");
      out.write("              <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"searchDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n");
      out.write("                <i class=\"fas fa-search fa-fw\"></i>\n");
      out.write("              </a>\n");
      out.write("              <!-- Dropdown - Messages -->\n");
      out.write("              <div class=\"dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in\" aria-labelledby=\"searchDropdown\">\n");
      out.write("                <form class=\"form-inline mr-auto w-100 navbar-search\">\n");
      out.write("                  <div class=\"input-group\">\n");
      out.write("                    <input type=\"text\" class=\"form-control bg-light border-0 small\" placeholder=\"Search for...\" aria-label=\"Search\" aria-describedby=\"basic-addon2\">\n");
      out.write("                    <div class=\"input-group-append\">\n");
      out.write("                      <button class=\"btn btn-primary\" type=\"button\">\n");
      out.write("                        <i class=\"fas fa-search fa-sm\"></i>\n");
      out.write("                      </button>\n");
      out.write("                    </div>\n");
      out.write("                  </div>\n");
      out.write("                </form>\n");
      out.write("              </div>\n");
      out.write("            </li>\n");
      out.write("\n");
      out.write("            <!-- Nav Item - Alerts -->\n");
      out.write("            <li class=\"nav-item dropdown no-arrow mx-1\">\n");
      out.write("              <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"alertsDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n");
      out.write("                <i class=\"fas fa-bell fa-fw\"></i>\n");
      out.write("                <!-- Counter - Alerts -->\n");
      out.write("                <span class=\"badge badge-danger badge-counter\">3+</span>\n");
      out.write("              </a>\n");
      out.write("              <!-- Dropdown - Alerts -->\n");
      out.write("              <div class=\"dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in\" aria-labelledby=\"alertsDropdown\">\n");
      out.write("                <h6 class=\"dropdown-header\">\n");
      out.write("                  Alerts Center\n");
      out.write("                </h6>\n");
      out.write("                <a class=\"dropdown-item d-flex align-items-center\" href=\"#\">\n");
      out.write("                  <div class=\"mr-3\">\n");
      out.write("                    <div class=\"icon-circle bg-primary\">\n");
      out.write("                      <i class=\"fas fa-file-alt text-white\"></i>\n");
      out.write("                    </div>\n");
      out.write("                  </div>\n");
      out.write("                  <div>\n");
      out.write("                    <div class=\"small text-gray-500\">December 12, 2019</div>\n");
      out.write("                    <span class=\"font-weight-bold\">A new monthly report is ready to download!</span>\n");
      out.write("                  </div>\n");
      out.write("                </a>\n");
      out.write("                <a class=\"dropdown-item d-flex align-items-center\" href=\"#\">\n");
      out.write("                  <div class=\"mr-3\">\n");
      out.write("                    <div class=\"icon-circle bg-success\">\n");
      out.write("                      <i class=\"fas fa-donate text-white\"></i>\n");
      out.write("                    </div>\n");
      out.write("                  </div>\n");
      out.write("                  <div>\n");
      out.write("                    <div class=\"small text-gray-500\">December 7, 2019</div>\n");
      out.write("                    $290.29 has been deposited into your account!\n");
      out.write("                  </div>\n");
      out.write("                </a>\n");
      out.write("                <a class=\"dropdown-item d-flex align-items-center\" href=\"#\">\n");
      out.write("                  <div class=\"mr-3\">\n");
      out.write("                    <div class=\"icon-circle bg-warning\">\n");
      out.write("                      <i class=\"fas fa-exclamation-triangle text-white\"></i>\n");
      out.write("                    </div>\n");
      out.write("                  </div>\n");
      out.write("                  <div>\n");
      out.write("                    <div class=\"small text-gray-500\">December 2, 2019</div>\n");
      out.write("                    Spending Alert: We've noticed unusually high spending for your account.\n");
      out.write("                  </div>\n");
      out.write("                </a>\n");
      out.write("                <a class=\"dropdown-item text-center small text-gray-500\" href=\"#\">Show All Alerts</a>\n");
      out.write("              </div>\n");
      out.write("            </li>\n");
      out.write("\n");
      out.write("            <!-- Nav Item - Messages -->\n");
      out.write("            <li class=\"nav-item dropdown no-arrow mx-1\">\n");
      out.write("              <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"messagesDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n");
      out.write("                <i class=\"fas fa-envelope fa-fw\"></i>\n");
      out.write("                <!-- Counter - Messages -->\n");
      out.write("                <span class=\"badge badge-danger badge-counter\">7</span>\n");
      out.write("              </a>\n");
      out.write("              <!-- Dropdown - Messages -->\n");
      out.write("              <div class=\"dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in\" aria-labelledby=\"messagesDropdown\">\n");
      out.write("                <h6 class=\"dropdown-header\">\n");
      out.write("                  Message Center\n");
      out.write("                </h6>\n");
      out.write("                <a class=\"dropdown-item d-flex align-items-center\" href=\"#\">\n");
      out.write("                  <div class=\"dropdown-list-image mr-3\">\n");
      out.write("                    <img class=\"rounded-circle\" src=\"https://source.unsplash.com/fn_BT9fwg_E/60x60\" alt=\"\">\n");
      out.write("                    <div class=\"status-indicator bg-success\"></div>\n");
      out.write("                  </div>\n");
      out.write("                  <div class=\"font-weight-bold\">\n");
      out.write("                    <div class=\"text-truncate\">Hi there! I am wondering if you can help me with a problem I've been having.</div>\n");
      out.write("                    <div class=\"small text-gray-500\">Emily Fowler Â· 58m</div>\n");
      out.write("                  </div>\n");
      out.write("                </a>\n");
      out.write("                <a class=\"dropdown-item d-flex align-items-center\" href=\"#\">\n");
      out.write("                  <div class=\"dropdown-list-image mr-3\">\n");
      out.write("                    <img class=\"rounded-circle\" src=\"https://source.unsplash.com/AU4VPcFN4LE/60x60\" alt=\"\">\n");
      out.write("                    <div class=\"status-indicator\"></div>\n");
      out.write("                  </div>\n");
      out.write("                  <div>\n");
      out.write("                    <div class=\"text-truncate\">I have the photos that you ordered last month, how would you like them sent to you?</div>\n");
      out.write("                    <div class=\"small text-gray-500\">Jae Chun Â· 1d</div>\n");
      out.write("                  </div>\n");
      out.write("                </a>\n");
      out.write("                <a class=\"dropdown-item d-flex align-items-center\" href=\"#\">\n");
      out.write("                  <div class=\"dropdown-list-image mr-3\">\n");
      out.write("                    <img class=\"rounded-circle\" src=\"https://source.unsplash.com/CS2uCrpNzJY/60x60\" alt=\"\">\n");
      out.write("                    <div class=\"status-indicator bg-warning\"></div>\n");
      out.write("                  </div>\n");
      out.write("                  <div>\n");
      out.write("                    <div class=\"text-truncate\">Last month's report looks great, I am very happy with the progress so far, keep up the good work!</div>\n");
      out.write("                    <div class=\"small text-gray-500\">Morgan Alvarez Â· 2d</div>\n");
      out.write("                  </div>\n");
      out.write("                </a>\n");
      out.write("                <a class=\"dropdown-item d-flex align-items-center\" href=\"#\">\n");
      out.write("                  <div class=\"dropdown-list-image mr-3\">\n");
      out.write("                    <img class=\"rounded-circle\" src=\"https://source.unsplash.com/Mv9hjnEUHR4/60x60\" alt=\"\">\n");
      out.write("                    <div class=\"status-indicator bg-success\"></div>\n");
      out.write("                  </div>\n");
      out.write("                  <div>\n");
      out.write("                    <div class=\"text-truncate\">Am I a good boy? The reason I ask is because someone told me that people say this to all dogs, even if they aren't good...</div>\n");
      out.write("                    <div class=\"small text-gray-500\">Chicken the Dog Â· 2w</div>\n");
      out.write("                  </div>\n");
      out.write("                </a>\n");
      out.write("                <a class=\"dropdown-item text-center small text-gray-500\" href=\"#\">Read More Messages</a>\n");
      out.write("              </div>\n");
      out.write("            </li>\n");
      out.write("\n");
      out.write("            <div class=\"topbar-divider d-none d-sm-block\"></div>\n");
      out.write("\n");
      out.write("            <!-- Nav Item - User Information -->\n");
      out.write("            <li class=\"nav-item dropdown no-arrow\">\n");
      out.write("              <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"userDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n");
      out.write("                <span class=\"mr-2 d-none d-lg-inline text-gray-600 small\">");
      out.print(email);
      out.write("</span>\n");
      out.write("                <img class=\"img-profile rounded-circle\" src=\"https://source.unsplash.com/QAB-WJcbgJk/60x60\">\n");
      out.write("              </a>\n");
      out.write("              <!-- Dropdown - User Information -->\n");
      out.write("              <div class=\"dropdown-menu dropdown-menu-right shadow animated--grow-in\" aria-labelledby=\"userDropdown\">\n");
      out.write("                <a class=\"dropdown-item\" href=\"#\">\n");
      out.write("                  <i class=\"fas fa-user fa-sm fa-fw mr-2 text-gray-400\"></i>\n");
      out.write("                  Profile\n");
      out.write("                </a>\n");
      out.write("                <a class=\"dropdown-item\" href=\"#\">\n");
      out.write("                  <i class=\"fas fa-cogs fa-sm fa-fw mr-2 text-gray-400\"></i>\n");
      out.write("                  Settings\n");
      out.write("                </a>\n");
      out.write("                <a class=\"dropdown-item\" href=\"#\">\n");
      out.write("                  <i class=\"fas fa-list fa-sm fa-fw mr-2 text-gray-400\"></i>\n");
      out.write("                  Activity Log\n");
      out.write("                </a>\n");
      out.write("                <div class=\"dropdown-divider\"></div>\n");
      out.write("                <a class=\"dropdown-item\" href=\"#\" data-toggle=\"modal\" data-target=\"#logoutModal\">\n");
      out.write("                  <i class=\"fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400\"></i>\n");
      out.write("                  Logout\n");
      out.write("                </a>\n");
      out.write("              </div>\n");
      out.write("            </li>\n");
      out.write("\n");
      out.write("          </ul>\n");
      out.write("\n");
      out.write("        </nav>\n");
      out.write("        <!-- End of Topbar -->\n");
      out.write("\n");
      out.write("        <!-- Begin Page Content -->\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-lg-3\"></div>\n");
      out.write("                <div class=\"col-lg-6\" id=\"form\">\n");
      out.write("                    <h3>Add Topic</h3>\n");
      out.write("                    <label>Topic Title</label> \n");
      out.write("                    <input type=\"text\" id=\"title\" class=\"form-control\" required><br>\n");
      out.write("                    <label>Short Description</label> \n");
      out.write("                    <textarea rows=\"3\" id=\"sdesc\" style=\"resize:none\" class=\"form-control\" required></textarea><br>\n");
      out.write("                    <label>Description</label> \n");
      out.write("                    <textarea rows=\"6\" id=\"desc\" style=\"resize:none\" class=\"form-control\" required></textarea><br>\n");
      out.write("                    <label>Category</label>\n");
      out.write("                    <select id=\"category\" class=\"form-control\">\n");
      out.write("                        <option value=\"\"></option>\n");
      out.write("                        ");

                            try{
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog","root","");
                                    Statement st = cn.createStatement();
                                    ResultSet rs = st.executeQuery("select * from category order by sn desc");
                                    while(rs.next()){
                                            
      out.write("\n");
      out.write("                                            <option value=\"");
      out.print(rs.getString("code"));
      out.write('"');
      out.write('>');
      out.print(rs.getString("category"));
      out.write("</option>\n");
      out.write("                                            ");

                                    }
                                    cn.close();
                            }
                            catch(Exception er){
                                    out.println(er.getMessage());
                            }
                        
      out.write("\n");
      out.write("                    </select><br><br>\n");
      out.write("                    <button class=\"btn btn-primary\">Submit</button><br><br>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <!-- The Modal -->\n");
      out.write("                <div class=\"modal\" id=\"blogedit\">\n");
      out.write("                  <div class=\"modal-dialog\">\n");
      out.write("                    <div class=\"modal-content\">\n");
      out.write("\n");
      out.write("                      <!-- Modal Header -->\n");
      out.write("                      <div class=\"modal-header\" style=\"background-color:#36B9CC;color:white\">\n");
      out.write("                        <h4 class=\"modal-title\">Edit Blog</h4>\n");
      out.write("                        <button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\n");
      out.write("                      </div>\n");
      out.write("\n");
      out.write("                      <!-- Modal body -->\n");
      out.write("                      <div class=\"modal-body\">\n");
      out.write("                          \n");
      out.write("                      </div>\n");
      out.write("\n");
      out.write("                      <!-- Modal footer -->\n");
      out.write("                      <div class=\"modal-footer\">\n");
      out.write("                        <button type=\"button\" class=\"btn btn-danger\" data-dismiss=\"modal\">Close</button>\n");
      out.write("                      </div>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                  </div>\n");
      out.write("                </div>\n");
      out.write("                    <div class=\"col-lg-12\">\n");
      out.write("                            <div class=\"\" id=\"msgbox\"></div>\n");
      out.write("                            <table class=\"table table-striped\">\n");
      out.write("                                    ");

                                            try{
                                                    Class.forName("com.mysql.jdbc.Driver");
                                                    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog","root","");
                                                    Statement st1 = cn.createStatement();
                                                    ResultSet rs1 = st1.executeQuery("select * from blog");
                                                    while(rs1.next()){
                                                            
      out.write("\n");
      out.write("                                                            <tr id=\"");
      out.print(rs1.getString("code"));
      out.write("\">\n");
      out.write("                                                                    <td id=\"t-");
      out.print(rs1.getString("code"));
      out.write('"');
      out.write('>');
      out.print(rs1.getString("title"));
      out.write("</td><td><i rel=\"");
      out.print(rs1.getString("code"));
      out.write("\" class=\"fa fa-edit\"></i></td><td><i rel=\"");
      out.print(rs1.getString("code"));
      out.write("\" class=\"fa fa-trash\"></i></td>\n");
      out.write("                                                            </tr>\n");
      out.write("                                                            ");

                                                    }
                                                    cn.close();
                                            }
                                            catch(Exception er){
                                                    out.println(er.getMessage());
                                            }
                                    
      out.write("\n");
      out.write("                            </table>\n");
      out.write("                    </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <!-- /.container-fluid -->\n");
      out.write("\n");
      out.write("      </div>\n");
      out.write("      <!-- End of Main Content -->\n");
      out.write("\n");
      out.write("      <!-- Footer -->\n");
      out.write("      <footer class=\"sticky-footer bg-white\">\n");
      out.write("        <div class=\"container my-auto\">\n");
      out.write("          <div class=\"copyright text-center my-auto\">\n");
      out.write("            <span>Copyright &copy; Your Website 2019</span>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </footer>\n");
      out.write("      <!-- End of Footer -->\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("    <!-- End of Content Wrapper -->\n");
      out.write("\n");
      out.write("  </div>\n");
      out.write("  <!-- End of Page Wrapper -->\n");
      out.write("\n");
      out.write("  <!-- Scroll to Top Button-->\n");
      out.write("  <a class=\"scroll-to-top rounded\" href=\"#page-top\">\n");
      out.write("    <i class=\"fas fa-angle-up\"></i>\n");
      out.write("  </a>\n");
      out.write("\n");
      out.write("  <!-- Logout Modal-->\n");
      out.write("  <div class=\"modal fade\" id=\"logoutModal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\n");
      out.write("    <div class=\"modal-dialog\" role=\"document\">\n");
      out.write("      <div class=\"modal-content\">\n");
      out.write("        <div class=\"modal-header\">\n");
      out.write("          <h5 class=\"modal-title\" id=\"exampleModalLabel\">Ready to Leave?</h5>\n");
      out.write("          <button class=\"close\" type=\"button\" data-dismiss=\"modal\" aria-label=\"Close\">\n");
      out.write("            <span aria-hidden=\"true\">Ã</span>\n");
      out.write("          </button>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"modal-body\">Select \"Logout\" below if you are ready to end your current session.</div>\n");
      out.write("        <div class=\"modal-footer\">\n");
      out.write("          <button class=\"btn btn-secondary\" type=\"button\" data-dismiss=\"modal\">Cancel</button>\n");
      out.write("          <a class=\"btn btn-primary\" href=\"login.html\">Logout</a>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("\n");
      out.write("  <!-- Bootstrap core JavaScript-->\n");
      out.write("  <script src=\"vendor/jquery/jquery.min.js\"></script>\n");
      out.write("  <script src=\"vendor/bootstrap/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("\n");
      out.write("  <!-- Core plugin JavaScript-->\n");
      out.write("  <script src=\"vendor/jquery-easing/jquery.easing.min.js\"></script>\n");
      out.write("\n");
      out.write("  <!-- Custom scripts for all pages-->\n");
      out.write("  <script src=\"js/sb-admin-2.min.js\"></script>\n");
      out.write("\n");
      out.write("  <!-- Page level plugins -->\n");
      out.write("  <script src=\"vendor/chart.js/Chart.min.js\"></script>\n");
      out.write("\n");
      out.write("  <!-- Page level custom scripts -->\n");
      out.write("  <script src=\"js/demo/chart-area-demo.js\"></script>\n");
      out.write("  <script src=\"js/demo/chart-pie-demo.js\"></script>\n");
      out.write("  <script>\n");
      out.write("      $(document).on(\"click\",\".btn-primary\",function(){\n");
      out.write("          var title = $(\"#title\").val();\n");
      out.write("          var sdesc = $(\"#sdesc\").val();\n");
      out.write("          var desc = $(\"#desc\").val();\n");
      out.write("          var code = $(\"#category\").val();\n");
      out.write("          $.post(\n");
      out.write("              \"add_topic.jsp\",{title:title,sdesc:sdesc,desc:desc,code:code},function(data){\n");
      out.write("                    data=data.trim();\n");
      out.write("                    if(data.length>0){\n");
      out.write("                        $(\"#form\").load(\"image_upload.jsp\",{code:data});\n");
      out.write("                    }\n");
      out.write("              }\n");
      out.write("          );\n");
      out.write("      });\n");
      out.write("      $(document).on(\"click\",\".fa-edit\",function(){\n");
      out.write("          var code=$(this).attr(\"rel\");\n");
      out.write("          $(\"#msgbox\").attr(\"class\",\"\");\n");
      out.write("          $(\"#msgbox\").text(\"\");\n");
      out.write("          $.post(\n");
      out.write("              \"edit_blog.jsp\",{code:code},function(data){\n");
      out.write("                    $(\".modal-body\").html(data);\n");
      out.write("                    $(\"#blogedit\").modal();\n");
      out.write("              }\n");
      out.write("          );\n");
      out.write("      });\n");
      out.write("      $(document).on(\"click\",\".btn-info\",function(){\n");
      out.write("          var code = $(this).attr(\"id\");\n");
      out.write("          var title = $(\"#titles\").val();\n");
      out.write("          var sdes = $(\"#sde\").val();\n");
      out.write("          var des = $(\"#de\").val();\n");
      out.write("          $.post(\n");
      out.write("             \"update_topic.jsp\",{code:code,title:title,sdes:sdes,des:des},function(data){\n");
      out.write("                 data=data.trim();\n");
      out.write("                 if(data==\"success\"){\n");
      out.write("                     $(\"#t-\"+code).text(title);\n");
      out.write("                     $(\"#msgbox\").attr(\"class\",\"alert alert-info\");\n");
      out.write("                     $(\"#msgbox\").text(\"Record Updated\");\n");
      out.write("                 }\n");
      out.write("                 else{\n");
      out.write("                     $(\"#msgbox\").attr(\"class\",\"alert alert-danger\");\n");
      out.write("                     $(\"#msgbox\").text(\"Try Again\");\n");
      out.write("                 }\n");
      out.write("             } \n");
      out.write("          );\n");
      out.write("      });\n");
      out.write("      $(document).on(\"click\",\".fa-trash\",function(){\n");
      out.write("          var code = $(this).attr(\"rel\");\n");
      out.write("          $.post(\n");
      out.write("              \"delete_blog.jsp\",{code:code},function(data){\n");
      out.write("                    data=data.trim();\n");
      out.write("//                    if(data==\"success\"){\n");
      out.write("//                        $(\"#\"+code).fadeOut(1000);\n");
      out.write("//                        $(\"#msgbox\").attr(\"class\",\"alert alert-warning\");\n");
      out.write("//                        $(\"#msgbox\").text(\"Record Deleted\");\n");
      out.write("//                    }\n");
      out.write("//                    else{\n");
      out.write("//                        $(\"#msgbox\").attr(\"class\",\"alert alert-danger\");\n");
      out.write("//                        $(\"#msgbox\").text(\"Try Again\");\n");
      out.write("//                    }\n");
      out.write("                        alert(data);\n");
      out.write("              }\n");
      out.write("          );\n");
      out.write("      });\n");
      out.write("  </script>\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("</html>\n");

        }
    }

      out.write('\n');
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
