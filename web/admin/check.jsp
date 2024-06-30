<%-- 
    Document   : check
    Created on : 12 Jan, 2024, 8:28:22 PM
    Author     : HP
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
    if(request.getParameter("email")==null || request.getParameter("email").trim().length()==0 || request.getParameter("pass")==null || request.getParameter("pass").trim().length()==0){
        response.sendRedirect("index.jsp?empty=1");
    }
    else{
        String email = request.getParameter("email").trim();
        String pass = request.getParameter("pass").trim();
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/blog","root","");
            PreparedStatement ps=cn.prepareStatement("select * from admin where email=?");
            ps.setString(1,email);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                if(rs.getString("password").equals(pass)){
                    Cookie c = new Cookie("admin",email);
                    c.setMaxAge(3600*24*7);
                    response.addCookie(c);
                    response.sendRedirect("dashboard.jsp");
                }
                else{
                    response.sendRedirect("index.jsp?invalid_pass=1");
                }
            }
            else{
                response.sendRedirect("index.jsp?invalid_email=1");
            }
            cn.close();
        }
        catch(Exception er){
            out.println(er.getMessage());
        }
    }
%>
