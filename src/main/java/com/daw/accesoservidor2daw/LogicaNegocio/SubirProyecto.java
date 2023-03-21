/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.daw.accesoservidor2daw.LogicaNegocio;

import com.daw.accesoservidor2daw.DAO.ProyectosJpaController;
import com.daw.accesoservidor2daw.DTO.Proyectos;
import java.io.IOException;
import java.util.Date;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Usuario
 */
public class SubirProyecto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("proyectos");
        ProyectosJpaController ctrProyectos = new ProyectosJpaController(emf);

        String rutaD ="/" + (String) request.getSession().getAttribute("ruta");

        Part logo = request.getPart("logo");
        String log= "MartinRivero.gif";
        if (logo != null) {
            String ruta = "C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps\\ROOT\\img";

            logo.write(ruta + "\\" + logo.getSubmittedFileName());
            log= logo.getSubmittedFileName();
        }

        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        String participantes = request.getParameter("participantes");

        Proyectos pro = new Proyectos(null, nombre, descripcion, new Date(), rutaD, participantes, log);

        ctrProyectos.create(pro);

        response.sendRedirect("altaProyecto.jsp?msg=ok");

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
        processRequest(request, response);
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
        processRequest(request, response);
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
