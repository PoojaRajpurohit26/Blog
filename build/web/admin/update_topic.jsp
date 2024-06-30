<%-- 
    Document   : update_topic
    Created on : Feb 25, 2024, 3:23:36 AM
    Author     : USER
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
            if(request.getParameter("code").trim().length()>0 && request.getParameter("code").trim()!=null && request.getParameter("title").trim().length()>0 && request.getParameter("title").trim()!=null && request.getParameter("sdes").trim().length()>0 && request.getParameter("sdes").trim()!=null && request.getParameter("des").trim().length()>0 && request.getParameter("des").trim()!=null){
                String code = request.getParameter("code").trim();
                String title = request.getParameter("title").trim();
                String sdesc = request.getParameter("sdes").trim();
                String desc = request.getParameter("des").trim();
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog","root","");
                    PreparedStatement ps = cn.prepareStatement("update blog set title=?,short_desc=?,description=? where code=?");
                    ps.setString(1,title);
                    ps.setString(2,sdesc);
                    ps.setString(3,desc);
                    ps.setString(4,code);
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