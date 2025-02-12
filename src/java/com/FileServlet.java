/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author CMS1-ITDPT
 */
public class FileServlet extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String fileName = request.getParameter("file");
        if (fileName == null || fileName.equals("")) {
            response.getWriter().println("Invalid file request.");
            return;
        }

        // Get the absolute path of the PDFs folder
        String pdfFolder = getServletContext().getRealPath("/pdfs/");
        File file = new File(pdfFolder + File.separator + fileName);

        // Check if the file exists
        if (!file.exists()) {
            response.getWriter().println("File not found!");
            return;
        }
        // Set response headers to display PDF in browser
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "inline; filename=\"" + fileName + "\"");
        
        // Stream the file to the browser
        try (FileInputStream fis = new FileInputStream(file);
             OutputStream os = response.getOutputStream()) {
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = fis.read(buffer)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
        }
    }
}
        