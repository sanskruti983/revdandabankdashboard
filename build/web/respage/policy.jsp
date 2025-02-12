<%-- 
    Document   : policy
    Created on : 10 Feb, 2025, 3:19:27 PM
    Author     : CMS1-ITDPT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        
        <title>JSP Page</title>
    </head>
    <body>
         <ul>
        <li><a href="pdfs\1C.pdf" >File 1</a></li>
        <li><a href="pdfs\2C.pdf">File 2</a></li>
        <li><a href="pdfs\3C.pdf" >File 3</a></li>
        <li><a href="pdfs\4C.pdf" >File 4</a></li>
    </ul>
        
        
        
    <ul>
    <%
        // Get the path to the "pdfs" directory
        String pdfFolder = application.getRealPath("/pdfs/");
        File folder = new File(pdfFolder);

        // List all PDF files in the folder (without using lambda)
        File[] files = folder.listFiles(new java.io.FilenameFilter() {
            public boolean accept(File dir, String name) {
                return name.endsWith(".pdf");
            }
        });

        if (files != null) {
            for (int i = 0; i < files.length; i++) {
                String fileName = files[i].getName();
    %>
                <!-- Clickable link that opens the PDF in a new tab -->
                <li><a href="<%= request.getContextPath() %>/FileServlet?file=<%= fileName %>" target="_blank" ><%= fileName %></a></li>
    <%
            }
        } 
        else 
        {
    %>
            <li>No PDF files available.</li>
    <%
        }
    %>
</ul>

        
        
    </body>
</html>
