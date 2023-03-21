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
        String msg = "";
        switch (request.getParameter("ruta")) {

            case "apache":
                ruta = "C:\\Apache24\\htdocs\\2daw\\";
                
                if (usu.getTipoUsuario()) {

                    switch (usu.getNombreUsuario()) {

                        case "juanma":
                            ruta += "Diseño\\Juanma";
                            msg = "apache=apache&asig=Diseño&espacio=Juanma";
                            break;
                        case "pedro":
                            ruta += "Clientes\\Pedro";
                            msg = "apache=apache&asig=Clientes&espacio=Pedro";
                            break;
                        case "lola":
                            ruta += request.getParameter("asigLola") + "\\Lola";
                            msg = "apache=apache&asig=" + request.getParameter("asigLola") + "&espacio=Lola";
                            break;
                    }

                } else {
                    ruta += asignatura + "\\Alumnos";
                    msg = "envio.jsp?apache=apache&asig=" + asignatura + "&espacio=Alumnos";
                }
                break;

            case "tomcat":
                ruta = "C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps";
                String archN = request.getPart("archivo").getSubmittedFileName();
                //msg = "tomcat=Apache Tomcat&msgTomcat=" + archN.substring(0, archN.length()-4);
                //Creación usuario y sql
                
                request.getSession().setAttribute("ruta", archN.substring(0, archN.length()-4));
                msg="altaProyecto.jsp";
                break;
        }

        Part parte = request.getPart("archivo");
        parte.write(ruta + "\\" + parte.getSubmittedFileName());
        
        response.sendRedirect(msg);

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
