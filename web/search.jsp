<%-- 
    Document   : search
    Created on : Feb 29, 2024, 5:52:11 PM
    Author     : USER
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/style.css">
<%
     if(request.getParameter("sch").trim()!=null && request.getParameter("sch").trim().length()>0){
          String sch = request.getParameter("sch").trim();
          int start=0;
          try{
                if(request.getParameter("lm")!=null && request.getParameter("lm").length()>0){
                    int lm = Integer.parseInt(request.getParameter("lm").trim());
                    start = lm*2;
                }
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog","root","");
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery("select * from blog where title LIKE '%"+sch+"%' OR description LIKE '%"+sch+"%' OR short_desc LIKE '%"+sch+"%' limit "+start+",2");
                while(rs.next()){
                    %>
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
                    <%
                }
                  %>
                    <!--<button class="btn btn-danger" id="load">Load More</button>-->
                <% 
                cn.close();
          }
           catch(Exception er){
                    out.println(er.getMessage());
           }
     }
%>