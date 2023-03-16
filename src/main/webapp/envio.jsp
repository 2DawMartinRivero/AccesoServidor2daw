<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>




<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Favicons -->
        <link rel="icon" href="img/iessinfondo.png">
        <title>Subir archivos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <style>
            .colorBtn{
                background-color: #6666ff;
            }
            .colorBtn:hover{
                background-color: #6633ff;
            }
            body {
                background-color: #f5f5f5;
            }
            #war{
                max-width: 170px;
            }

            @media only screen and (min-width:600px){
                .row-cols-md-1{
                    width: 40%;
                }
                form.bd{
                    width: 80% !important;
                }
                #gbd{
                    justify-content: center;
                }
            }
        </style>
    </head>
    <body>

        <c:choose>
            <c:when test="${not empty param.tomcat}">
                <nav class="m-3" style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp">Principal</a></li>
                        <li class="breadcrumb-item"><a href="espacios.jsp">Servidores</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Subida Tomcat</li>
                    </ol>
                </nav>
                <div class="mt-5 p-3 me-0 row row-cols-md-4 flex-md-column align-items-md-center">
                    <h1 class="text-center h4 my-3">Despliegue de Aplicacion Java en Tomcat</h1>
                    <form action="SubidaArchivos" method="POST" enctype="multipart/form-data">
                        <div class="input-group mb-3 mt-3">
                            <label class="input-group-text visually-hidden" for="inputGroupFile01" >Subida de Archivos al Servidor Apache</label>
                            <input type="file" class="form-control" id="inputGroupFile01" name="archivo">
                        </div>
                        <input type="hidden" name="ruta" value="tomcat"/>
                        <input class="w-100 btn btn-lg colorBtn" type="submit" value="Subir archivo"/>
                    </form>
                    <img class="m-auto" src="img/war.png" id="war" alt="Icono de tipo de archivo">
                    <c:if test="${not empty param.msgTomcat}">
                        <a class="btn btn-lg colorBtn" href="http://aplicaciones-martinrivero.ddns.net:8081/${param.msgTomcat}">Ver mi Aplicacion Desplegada</a>
                    </c:if>
                </div>
            </c:when>
            <c:when test="${not empty param.apache}">
                <nav class="m-3" style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp">Principal</a></li>
                        <li class="breadcrumb-item"><a href="espacios.jsp">Servidores</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Subida archivos Apache</li>
                    </ol>
                </nav>
                <div class="mt-5 p-3 me-0 row row-cols-md-4 flex-md-column align-items-md-center">
                    <h1 class="text-center h4 my-3">Subida de Archivos al Servidor Apache</h1>
                    <form action="SubidaArchivos" method="POST" enctype="multipart/form-data">
                        <c:if test="${usuario.tipoUsuario eq false}">
                            <select name="asignatura" class="form-select" aria-label="Seleccion de Asigantura">
                                <option value="-1">Selecciona una Opcion</option>
                                <option value="Servidores">Servidores</option>
                                <option value="Clientes">Cliente</option>
                                <option value="Diseño">Diseño</option>
                                <option value="Despliegues">Despliegue</option>
                            </select>
                        </c:if>
                        <c:if test="${usuario.nombreUsuario eq 'lola'}">
                            <select name="asigLola" class="form-select" aria-label="Seleccion de Asigantura">
                                <option value="-1">Selecciona una Opcion</option>
                                <option value="Servidores">Servidores</option>
                                <option value="Despliegues">Despliegues</option>
                            </select>
                        </c:if>
                        <div class="input-group mb-3 mt-3">
                            <label class="input-group-text visually-hidden" for="inputGroupFile01" >Subida de Archivos al Servidor Apache</label>
                            <input type="file" class="form-control" id="inputGroupFile01" name="archivo">
                        </div>
                        <input type="hidden" name="ruta" value="apache"/>
                        <input class="w-100 btn btn-lg colorBtn" type="submit" value="Subir archivo"/>
                    </form>
                    <img src="img/tiposArchivos.png" alt="Tipos de Archivos Posibles">
                    <c:if test="${not empty param.asig}">
                        <a class="btn btn-lg colorBtn" href="http://martinrivero.ddns.net:8088/${param.asig}/${param.espacio}">Ver mi Recurso Subido</a>
                    </c:if>
                </div>
            </c:when>
            <c:when test="${not empty param.bd}">
                <nav class="m-3" style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp">Principal</a></li>
                        <li class="breadcrumb-item"><a href="espacios.jsp">Servidores</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Gestion de Base de Datos</li>
                    </ol>
                </nav>
                <div id="gbd" class="row row-cols-md-2 align-items-md-center me-0">
                    <div class="bd mt-5 p-3 me-0 row row-cols-md-1 flex-md-column align-items-md-center">
                        <h1 class="text-center my-3">Crear usuario</h1>
                        <form method="POST" action="crearUsuario">
                            <fieldset>
                                <div class="form-floating">
                                    <input class="form-control" id="usuario" type="text" placeholder="Usuario" name="usu"/>
                                    <label for="usuario">Usuario</label>
                                </div>
                                <div class="form-floating mt-3">
                                    <input class="form-control" id="pass" placeholder="Contraseña" type="password" name="pwd"/>
                                    <label for="pass">Contraseña</label>
                                </div>
                                <div class="d-grid mt-3">
                                    <input class="btn btn-primary" type="submit" value="Enviar"/>
                                </div>

                            </fieldset>
                        </form>
                        <c:if test="${not empty param.msgUsuario}">
                            <p class="text-center text-success mt-3 fw-bold">Se ha creado correctamente el usuario ${param.msgUsuario}</p>
                        </c:if>
                        <c:if test="${not empty param.errorUbd}">
                            <p class="text-center text-danger fw-bold mt-3 fw-bold">Error al crear el Usuario</p>
                        </c:if>
                    </div>

                    <div class="mt-5 p-3 me-0 row row-cols-md-1 flex-md-column align-items-md-center">
                        <h1 class="text-center my-3">Crear Base de datos especifica</h1>
                        <p class="text-center text-danger fw-bold">Recuerde estar dado de alta en la base de datos para crear una!!!</p>
                        <p class="text-center text-danger fw-bold">Recuerde subir los scripts sin comentarios!!!</p>
                        <form class="bd" method="POST" action="crearBD" enctype="multipart/form-data">
                            <fieldset>
                                <div class="form-floating">
                                    <input class="form-control" id="usuario" type="text" placeholder="Usuario" name="usu"/>
                                    <label for="usuario">Usuario</label>
                                </div>
                                <div class="form-floating mt-3">
                                    <input class="form-control" id="pass" placeholder="Contraseña" type="password" name="pwd"/>
                                    <label for="pass">Contraseña</label>
                                </div>
                                <div class="form-floating mt-3">
                                    <input class="form-control" id="bbdd" placeholder="Nombre de la Base de Datos" type="text" name="bbdd"/>
                                    <label for="bbdd">Nombre de la Base de Datos</label>
                                </div>
                                <div class="input-group mb-3 mt-3">
                                    <label class="input-group-text visually-hidden" for="inputGroupFile02" >Scriptlet de la Base de Datos</label>
                                    <input type="file" class="form-control" id="inputGroupFile02" name="sql">
                                </div>
                                <div class="d-grid mt-3">
                                    <input class="btn btn-primary" type="submit" value="Enviar"/>
                                </div>

                            </fieldset>
                            <c:if test="${not empty param.cBD}">
                                <p class="text-center text-success mt-3 fw-bold">Se ha creado correctamente la base de datos ${param.cBD} para el usuario ${param.uBD}</p>
                            </c:if>
                            <c:if test="${not empty param.errorBD}">
                                <p class="text-center text-danger mt-3 fw-bold">Error al crear la base de datos</p>
                            </c:if>
                        </form>
                    </div>
                </div>
            </c:when>
        </c:choose>
        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    </body>
</html>
