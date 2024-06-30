<%-- 
    Document   : add_topic
    Created on : 2 Feb, 2024, 5:25:15 PM
    Author     : HP
--%>

<%@page contentType="text/html" import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>
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
            if(request.getParameter("title").trim().length()>0 && request.getParameter("sdesc").trim().length()>0 && request.getParameter("desc").trim().length()>0 && request.getParameter("code").trim().length()>0){
                String title = request.getParameter("title").trim();
                String sdesc = request.getParameter("sdesc").trim();
                String desc = request.getParameter("desc").trim();
                String catcode = request.getParameter("code").trim();
                LinkedList l = new LinkedList();
                for(char ch='A' ; ch<='Z' ; ch++){
                    l.add(""+ch);
                }
                for(char ch='a' ; ch<='z' ; ch++){
                    l.add(""+ch);
                }
                for(int ch='0' ; ch<='9' ; ch++){
                    l.add(""+ch);
                }
                Collections.shuffle(l);
                String code = "";
                for(int i=0 ; i<6 ; i++){
                    code = code+l.get(i);
                }
                int sn = 0;
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog","root","");
                    Statement st = cn.createStatement();
                    ResultSet rs = st.executeQuery("select MAX(sn) from blog");
                    if(rs.next()){
                        sn = rs.getInt(1);
                    }
                    sn++;
                    code = code+"_"+sn;
                    String dt = ""+new java.util.Date();
                    PreparedStatement ps = cn.prepareStatement("insert into blog values(?,?,?,?,?,?,?)");
                    ps.setInt(1,sn);
                    ps.setString(2,code);
                    ps.setString(3,title);
                    ps.setString(4,sdesc);
                    ps.setString(5,desc);
                    ps.setString(6,catcode);
                    ps.setString(7,dt);
                    if(ps.executeUpdate()>0){
                        out.println(code);
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