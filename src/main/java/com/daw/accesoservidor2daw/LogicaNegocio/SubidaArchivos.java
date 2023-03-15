package com.daw.accesoservidor2daw.LogicaNegocio;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.daw.accesoservidor2daw.DTO.Usuario;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author lola
 */
@WebServlet(name = "SubidaArchivos", urlPatterns = {"/SubidaArchivos"})
@MultipartConfig()
public class SubidaArchivos extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Usuario usu = (Usuario) request.getSession().getAttribute("usuario");
        String ruta = null;
        String asignatura = request.getParameter("asignatura");
        switch (request.getParameter("ruta")) {

            case "apache":
                ruta = "C:\\Apache24\\htdocs\\2daw\\";
                String msg = "";
                if (usu.getTipoUsuario()) {

                    switch (usu.getNombreUsuario()) {

                        case "juanma":
                            ruta += "Diseño\\Juanma";
                            msg = "Diseño\\Juanma";
                            break;
                        case "pedro":
                            ruta += "Clientes\\Pedro";
                            msg = "Clientes\\Pedro";
                            break;
                        case "lola":
                            ruta += request.getParameter("asigLola") + "\\Lola";
                            msg = request.getParameter("asigLola") + "\\Lola";
                            break;
                    }

                } else {
                    ruta += asignatura + "\\Alumnos";
                    msg = asignatura + "\\Alumnos";
                }
                request.setAttribute("msgApache", msg);
                break;

            case "tomcat":
                ruta = "C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps";
                request.setAttribute("msgTomcat", request.getPart("archivo").getSubmittedFileName());
                //Creación usuario y sql

                break;
        }

        Part parte = request.getPart("archivo");
        parte.write(ruta + "\\" + parte.getSubmittedFileName());

        /* TODO output your page here. You may use following sample code. */
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /*
    Comentario de Aitor
    
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
}
