<%-- 
    Document   : update
    Created on : 13 Jan, 2024, 9:37:33 PM
    Author     : HP
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
    Cookie c[] = request.getCookies();
    String email = null;
    if(c!=null){
        for(int i=0 ; i<c.length ; i++){
            if(c[i].getName().equals("admin")){
                email = c[i].getValue();
                break;
            }
        }
        if(email!=null){
            if(request.getParameter("code").trim().length()>0 && request.getParameter("category").trim().length()>0){
                String code = request.getParameter("code").trim();
                String category  = request.getParameter("category").trim();
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog","root","");
                    PreparedStatement ps = cn.prepareStatement("update category set category='"+category+"' where code='"+code+"'");
                    if(ps.executeUpdate()>0){
                        out.println("success");
                    }
                    cn.close();
                }
                catch(Exception er){
                    out.println(er.getMessage());
                }
            }
        }
    }
%>