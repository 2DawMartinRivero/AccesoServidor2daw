<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>




<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subir archivos</title>
    </head>
    <body>
        <c:choose>
            <c:when test="${not empty param.tomcat}">
                <form action="SubidaArchivos" method="POST" enctype="multipart/form-data">
                    <input type="file" name="archivo"/>
                    <input type="hidden" name="ruta" value="tomcat"/>
                    <input type="submit" value="Subir archivo"/>
                </form>
            </c:when>
            <c:when test="${not empty param.apache}">
                <form action="SubidaArchivos" method="POST" enctype="multipart/form-data">
                    <c:if test="${usuario.tipoUsuario eq false}">
                        <select name="asignatura">
                            <option value="Servidores">Servidores</option>
                            <option value="Cliente">Cliente</option>
                            <option value="Diseño">Diseño</option>
                            <option value="Despliegue">Despliegue</option>
                        </select>
                    </c:if>
                    <c:if test="${usuario.nombreUsuario eq 'lola'}">
                        <select name="asigLola">
                            <option value="Servidores">Servidores</option>
                            <option value="Despliegue">Despliegues</option>
                        </select>
                    </c:if>
                    <input type="file" name="archivo"/>
                    <input type="hidden" name="ruta" value="apache"/>
                    <input type="submit" value="Subir archivo"/>
                </form>
            </c:when>
            <c:when test="${not empty param.bd}">
                <h1>Crear usuario</h1>

                <form method="POST" action="crearUsuario" enctype="multipart/form-data">
                    <fieldset>
                        <label>Usuario : <input type="text" name="usu"/></label><br/>
                        <label>Contraseña : <input type="password" name="pwd"/></label>
                        <input type="submit" value="Enviar"/>
                    </fieldset>
                </form>
                
                <h1>Crear Base de datos especifica</h1>
                <p>Recuerde estar dado de alta en la base de datos para crear una!!!</p>
                
                <form method="POST" action="crearBD" enctype="multipart/form-data">
                    <fieldset>
                        <label>Usuario : <input type="text" name="usu"/></label><br/>
                        <label>Contraseña : <input type="password" name="pwd"/></label><br/>
                        <label>Nombre de la bbdd:<input type="text" name="bbdd"/></label>
                        <br>
                        <label>Scriptlet: </label><input type="file" name="sql"><br>

                        <input type="submit" value="Enviar"/>
                    </fieldset>
                </form>
            </c:when>
        </c:choose>
    </body>
</html>
