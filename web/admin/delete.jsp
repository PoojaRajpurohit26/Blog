<%-- 
    Document   : delete
    Created on : 13 Jan, 2024, 7:42:08 PM
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
            if(request.getParameter("id").trim().length()>0){
                String code = request.getParameter("id").trim();
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog","root","");
                    Statement st = cn.createStatement();
                    if(st.executeUpdate("delete from category where code='"+code+"'")>0){
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