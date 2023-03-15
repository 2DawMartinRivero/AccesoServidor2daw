<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Espacios</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <style>
            body {
                background-color: #f5f5f5;
            }
            .card-footer{
                background-color: transparent;
                padding: 0;
                border-top: none;
            }
            img{
                max-width: 300px;
                margin: 0 auto;
            }
            .card{
                max-width: 500px;
            }
            
            form{
                margin-top: 10rem !important;
            }
        </style>
    </head>
    <body class="p-3">
        <nav class="m-3" style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.jsp">Principal</a></li>
                <li class="breadcrumb-item active" aria-current="page">Servidores</li> 
            </ol>
        </nav>
        <form action="envio.jsp" method="POST" class="row row-cols-md-4 justify-content-center">
            <div class="card p-3 my-3">
                <img src="img/logoApache.png" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title text-center">Apache</h5>
                    <p class="card-text text-center">Boton para subir archivos al servidor Apache</p>
                </div>
                <div class="d-grid card-footer">
                    <input type="submit" name="apache" class="btn btn-primary" value="Apache"/>
                </div>
            </div> 

            <div class="card p-3 my-3 mx-md-5">
                <img src="img/logoApacheTomcat.png" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title text-center">Apache Tomcat</h5>
                    <p class="card-text text-center">Boton para subir archivos al servidor Apache Tomcat</p>
                </div>
                <div class="d-grid card-footer">
                    <input type="submit" name="tomcat" class="btn btn-primary" value="Apache Tomcat"/>
                </div>
            </div> 

            <div class="card p-3 my-3">
                <img src="img/logoMysql.png" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title text-center">Gestion Base de Datos</h5>
                    <p class="card-text text-center">Boton para gestionar la Base de Datos</p>
                </div>
                <div class="d-grid card-footer">
                    <input type="submit" name="bd" class="btn btn-primary" value="Gestion bases de datos"/>
                </div>
            </div> 
        </form>

        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    </body>
</html>

