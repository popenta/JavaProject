/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.recruit.recruitmentapp.servlet;

import com.recruit.recruitmentapp.common.CandidateDetails;
import com.recruit.recruitmentapp.common.PositionDetails;
import com.recruit.recruitmentapp.ejb.PositionBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.annotation.security.DeclareRoles;
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
@DeclareRoles({"DirectorDepRol", "DirectorGeneralRol", "DirectorHrRol", "RecruiterRol"})
@ServletSecurity(value = @HttpConstraint(rolesAllowed = {"DirectorDepRol", "DirectorGeneralRol", "DirectorHrRol", "RecruiterRol"}))
@WebServlet(name = "EditPosition", urlPatterns = {"/EditPosition"})
public class EditPosition extends HttpServlet {

    @Inject
    PositionBean positionBean;

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
            out.println("<title>Servlet EditPosition</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditPosition at " + request.getContextPath() + "</h1>");
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
        List<PositionDetails> positions = positionBean.getAllPositions();
        request.setAttribute("loggedUser", request.getRemoteUser());
         //pageContext.request.getRemoteUser(); 
        request.setAttribute("positions", positions);
        int positionId = Integer.parseInt(request.getParameter("id"));
        PositionDetails position = positionBean.findById(positionId);
        request.setAttribute("position", position);
        request.getRequestDispatcher("/WEB-INF/pages/editPosition.jsp").forward(request, response);
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
        Integer nrPersoane = Integer.parseInt(request.getParameter("nrPersoane"));
        String posOpener = request.getParameter("posOpener");
        String departament = request.getParameter("departament");
        String cerinte = request.getParameter("cerinte");
        String responsabilitati = request.getParameter("responsabilitati");
        int positionId = Integer.parseInt(request.getParameter("position_id"));

        positionBean.updatePosition(positionId, nume, nrPersoane, posOpener, departament, cerinte, responsabilitati);
        response.sendRedirect(request.getContextPath() + "/Positions");
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
