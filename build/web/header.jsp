<%-- 
    Document   : header
    Created on : Feb 27, 2024, 6:22:27 PM
    Author     : USER
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<header class="navigation">
	<nav class="navbar navbar-expand-lg  py-4" id="navbar">
		<div class="container">
		  <a class="navbar-brand" href="index.html">
		  	Mega<span>Blog</span>
		  </a>

		  <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarsExample09" aria-controls="navbarsExample09" aria-expanded="false" aria-label="Toggle navigation">
			<span class="fa fa-bars"></span>
		  </button>
	  
		  <div class="collapse navbar-collapse text-center" id="navbarsExample09">
			<ul class="navbar-nav ml-auto">
			  <li class="nav-item active">
				<a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
			  </li>
                          <%
                              try{
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection cn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog","root","");
                                    Statement st1 = cn1.createStatement();
                                    ResultSet rs1 = st1.executeQuery("select * from category");
                                    int i=0;
                                    while(rs1.next()){
                                            i++;
                                            %>
                                            <li class="nav-item"><a class="nav-link" href="index.jsp?cat=<%=rs1.getString("code")%>"><%=rs1.getString("category")%></a></li>
                                            <%
                                            if(i==3){
                                                break;
                                            }
                                    }
                                    %>
                                    <li class="nav-item dropdown">
                                           <a class="nav-link dropdown-toggle" href="#" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Other</a>
                                           <ul class="dropdown-menu" aria-labelledby="dropdown03">
                                    <%
                                    while(rs1.next()){
                                                %>
                                                            <li><a class="dropdown-item" href="index.jsp?cat=<%=rs1.getString("code")%>"><%=rs1.getString("category")%></a></li>
                                                 <%
                                    }
                                    %>
                                     </ul>
                                                </li>
                                    <%
                                    cn1.close();
                                }
                                catch(Exception er){
                                        out.println(er.getMessage());
                                }
                            %>
			</ul>
		  </div>
		</div>
	</nav>
</header>