/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.recruit.recruitmentapp.servlet;

import com.recruit.recruitmentapp.common.UserDetails;
import com.recruit.recruitmentapp.ejb.UserBean;
import com.recruit.recruitmentapp.util.PasswordUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.HttpConstraint;
import javax.servlet.annotation.ServletSecurity;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Alex
 */
@ServletSecurity(value = @HttpConstraint(rolesAllowed = {"UserEditor"}))
@WebServlet(name = "AddUser", urlPatterns = {"/AddUser"})
public class AddUser extends HttpServlet {

    @Inject
    UserBean userBean;
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddUser</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddUser at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/addUser.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nume = request.getParameter("nume");
        String prenume = request.getParameter("prenume");
        String telefon = request.getParameter("telefon");
        String email = request.getParameter("email");
        String position = request.getParameter("position");
        //String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        
        String passwordSha256 = PasswordUtil.convertToSha256(password);
        
        List<UserDetails> users = userBean.getAllUsers();
        String newUsername;
        
        if(nume.length() > 5){
            
            newUsername = nume.substring(0, 6) + prenume.substring(0, 1);
        }else
        {
            newUsername = nume + prenume.substring(0, 1);
        }
        
        int i = 1;
        for(UserDetails user : users){
            
            if(newUsername.equals(user.getUsername())){
                
                newUsername = newUsername + prenume.substring(i, i+1);
                i++;
            }
        }

        userBean.createUser(nume, prenume, telefon, email, position, newUsername, passwordSha256);
        
        response.sendRedirect(request.getContextPath() + "/Users");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
