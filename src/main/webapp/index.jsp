<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${not empty param.usuario}">
    <jsp:include page="ComprobarUsu"/>

    <c:if test="${usuCorrecto eq 'si'}">
        <c:redirect url="espacios.jsp"/>
    </c:if>
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <!-- Favicons -->
        <link rel="icon" href="img/iessinfondo.png">
        <link rel="stylesheet" href="css/proyectos.css"/>
        <meta name="theme-color" content="#712cf9">

        <link rel="stylesheet" type="text/css" media="all" href="css/index.css" />
    </head>
    <body cz-shortcut-listen="true">
        <header>
            <nav class="navbar bg-body-tertiary">
                <div class="container-fluid text-white">
                    <a id="logo" class="navbar-brand p-0 b-0 text-white text-center d-flex align-items-center" href="http://aplicaciones-martinrivero.ddns.net:8081/proyectos.jsp" aria-label="Ir a inicio"> 
                        <img src="img/project.png" alt="Logo" width="50" height="50" class="d-inline-block align-text-top" title="">
                        <span class="fs-3 ms-3">Proyectos</span>
                    </a>   
                </div>
            </nav>
        </header>
        <main class="form-signin w-100 m-auto text-center">
            <div>
                <form action="index.jsp" method="post">
                    <img class="mb-4" src="img/iessinfondo.png" alt="Logo IES Martin Rivero">
                    <h1 class="h3 mb-3 fw-normal">Login</h1>

                    <div class="form-floating">
                        <input type="text" class="form-control" name="usuario" id="floatingInput" placeholder="name@example.com" required="">
                        <label for="floatingInput">Usuario</label>
                    </div>
                    <div class="form-floating">
                        <input type="password" class="form-control" name="pass" id="floatingPassword" placeholder="Password" required="">
                        <label for="floatingPassword">Contraseña</label>
                    </div>

                    <button class="w-100 btn btn-lg colorBtn text-light" type="submit">Iniciar Sesión</button>

                </form>
                <c:if test="${usuCorrecto eq 'no'}">
                    <div id="error" class="text-danger fw-bold mt-5">
                        ${errorUsuario}
                    </div>
                </c:if>
                <p class="mt-5 mb-3 text-muted">© IES Martin Rivero 2Daw 2023</p>
            </div>
        </main>


        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    </body>
</html>
