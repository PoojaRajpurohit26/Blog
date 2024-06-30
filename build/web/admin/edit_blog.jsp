<%-- 
    Document   : edit_blog
    Created on : Feb 25, 2024, 2:35:45 AM
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
            if(request.getParameter("code").trim().length()>0 && request.getParameter("code").trim()!=null){
                String code = request.getParameter("code").trim();
                try{
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog","root","");
                        Statement st = cn.createStatement();
                        ResultSet rs = st.executeQuery("select * from blog where code='"+code+"'");
                        if(rs.next()){
                                %>
                                    <label>Topic Title</label>
                                    <input type="text" value="<%=rs.getString("title")%>" id="titles" class="form-control"><br>
                                    <label>Short Description</label>
                                    <textarea row="4" id="sde" class="form-control" style="resize:none"><%=rs.getString("short_desc")%></textarea><br>
                                    <label>Description</label>
                                    <textarea row="4" id="de" class="form-control" style="resize:none"><%=rs.getString("description")%></textarea><br>
                                    <button class="btn btn-info" id="<%=code%>" data-dismiss="modal">Submit</button>
                                <%
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