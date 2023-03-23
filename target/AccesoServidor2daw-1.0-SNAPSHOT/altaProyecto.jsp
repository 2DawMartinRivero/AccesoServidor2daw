<%-- 
    Document   : altaProyecto
    Created on : 21 mar. 2023, 8:49:13
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta de un Proyecto</title>
        <link rel="stylesheet" href="css/proyectos.css"/>
        <!-- Favicons -->
        <link rel="icon" href="img/iessinfondo.png">
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
                height:100vh;
            }
            .btnOut{
                color: #6666ff;
                outline:1px solid #6666ff;
            }
            .btnOut:hover{
                background-color: #6666ff;
                color: white;
            }
        </style>

    </head>
    <body>
        <header>
            <nav class="navbar bg-body-tertiary">
                <div class="container-fluid text-white">
                    <a id="logo" class="navbar-brand p-0 b-0 text-white text-center d-flex align-items-center"  href="http://aplicaciones-martinrivero.ddns.net:8081/proyectos.jsp" aria-label="Ir a inicio"> 
                        <img src="img/project.png" alt="Logo" width="50" height="50" class="d-inline-block align-text-top" title="">
                        <span class="fs-3 ms-3">Proyectos</span>
                    </a>   
                </div>
            </nav>
        </header>
        <main class="d-flex flex-column justify-content-center align-items-center  ">
            <nav class="m-3 align-self-start" style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="espacios.jsp">Servidores</a></li>
                    <li class="breadcrumb-item"><a href="envio.jsp">Subida Tomcat</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Alta Proyecto</li>
                </ol>
            </nav>
            <form class="p-2 row col-md-4 m-auto mt-0 mt-md-5" method="POST" action="SubirProyecto" enctype="multipart/form-data">
                <h1 class="text-center">Alta de un Proyecto</h1>
                <div class="form-floating my-2">
                    <input type="text" class="form-control" id="nombre" placeholder="Nombre del Proyecto" name="nombre" required>
                    <label class="ms-1" for="nombre" >Nombre del Proyecto</label>
                </div>
                <div class="form-floating my-2">
                    <textarea class="form-control" placeholder="Descripcion del Proyecto" id="descripcion" name="descripcion" style="height: 100px" required></textarea>
                    <label class="ms-1" for="descripcion" >Descripcion del Proyecto</label>
                </div>
                <div class="form-floating my-2">
                    <input type="text" class="form-control" id="participantes" placeholder="Participantes" name="participantes" required>
                    <label class="ms-1" for="participantes" >Participantes</label>
                </div>
                <p class="mb-0 mt-2 fw-bold ms-1">Logo del Proyecto</p>
                <div class="input-group mb-3 mt-1">
                    <label class="input-group-text visually-hidden" for="inputGroupFile01" >Logo del Proyecto</label>
                    <input type="file" class="form-control" id="inputGroupFile01" name="logo">
                </div>
                <div class="d-grid justify-content-md-center col-md-12">
                    <input class="btn btn-lg colorBtn text-light" type="submit" value="Dar de Alta Proyecto"/>
                </div>
                <c:if test="${not empty param.msg}">
                    <div class="d-grid justify-content-md-center col-md-12">
                        <a class="btn btn-lg btnOut mt-2" href="http://aplicaciones-martinrivero.ddns.net:8081${sessionScope.ruta}">Volver al Inicio</a>
                    </div>
                </c:if>
            </form>

            <!-- Option 1: Bootstrap Bundle with Popper -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        </main>
    </body>
</html>
