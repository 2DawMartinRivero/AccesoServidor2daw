/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.daw.accesoservidor2daw.LogicaNegocio;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Lola
 */
@WebServlet(name = "crearBD", urlPatterns = {"/crearBD"})
@MultipartConfig()

public class crearBD extends HttpServlet {

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
        String conector = "com.mysql.jdbc.Driver";

        String url = "jdbc:mysql://localhost/";
        PrintWriter out = response.getWriter();

        try {
            String user = request.getParameter("usu");
            String pwd = request.getParameter("pwd");
            String bbdd = request.getParameter("bbdd");

            String usuario = user;

            String pass = pwd;

            Class.forName(conector).newInstance();
            Connection conexion = DriverManager.getConnection(url, usuario, pass);

            /*String sentencia;
            sentencia = "CREATE USER ?@'localhost' IDENTIFIED BY ?";
            PreparedStatement sent=conexion.prepareStatement(sentencia);
            sent.setString(1,user);
            sent.setString(2,pwd);
            
            String sentencia02 = "GRANT USAGE ON *.* TO ?@'localhost' IDENTIFIED BY ? WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0";
            PreparedStatement sent02=conexion.prepareStatement(sentencia02);
            sent02.setString(1, user);
            sent02.setString(1, pwd);
            sent.execute();     */
            String sentencia2 = "CREATE DATABASE IF NOT EXISTS " + user + "_" + bbdd + "";
            Statement sent2 = conexion.createStatement();
            sent2.execute(sentencia2);

            /*String sentencia3 = "GRANT ALL PRIVILEGES ON " + user + ".* TO '" + user + "'@'localhost' IDENTIFIED BY '" + pwd + "'";
            Statement sent3 = conexion.createStatement();
            sent3.execute(sentencia3);

            String sentencia4 = "GRANT ALL PRIVILEGES ON `" + user + "_%`.* TO '" + user + "'@'localhost' IDENTIFIED BY '" + pwd + "'";
            Statement sent4 = conexion.createStatement();
            sent4.execute(sentencia4);*/

            Part parteSql = request.getPart("sql");
            String ruta = getServletContext().getRealPath("datos");
            parteSql.write(ruta + "\\" + parteSql.getSubmittedFileName());
            File archivo = new File(ruta + "\\" + parteSql.getSubmittedFileName());
            creaTabla(conexion, archivo, out);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(crearUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(crearUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(crearUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(crearUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private boolean creaTabla(Connection conn, File file, PrintWriter out) {

        Scanner sc;
        String tabla = "";

        try {
            sc = new Scanner(file);
            sc.useDelimiter(";");
            tabla += sc.next() + ";";

            Statement stm = conn.createStatement();
            stm.execute(tabla);

            sc.close();
            stm.close();

            out.println("[+] La tabla ha sido creada con éxito");

        } catch (FileNotFoundException ex) {
            out.println("\n[!] Error, fichero no encontrado...\n");
            return false;
        } catch (SQLException ex) {
            out.println("\n[!] Error creando la tabla...\n");
            return false;
        }

        return true;
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
