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
        <link rel="apple-touch-icon" href="https://getbootstrap.com/docs/5.2/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
        <link rel="icon" href="https://getbootstrap.com/docs/5.2/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
        <link rel="icon" href="https://getbootstrap.com/docs/5.2/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
        <link rel="manifest" href="https://getbootstrap.com/docs/5.2/assets/img/favicons/manifest.json">
        <link rel="mask-icon" href="https://getbootstrap.com/docs/5.2/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
        <link rel="icon" href="https://getbootstrap.com/docs/5.2/assets/img/favicons/favicon.ico">
        <meta name="theme-color" content="#712cf9">

        <link rel="stylesheet" type="text/css" media="all" href="css/index.css" />
    </head>
    <body class="text-center" cz-shortcut-listen="true">
        <main class="form-signin w-100 m-auto">

            <form action="index.jsp" method="post">

                <h1 class="h3 mb-3 fw-normal">Login</h1>

                <div class="form-floating">
                    <input type="text" class="form-control" name="usuario" id="floatingInput" placeholder="name@example.com" required="">
                    <label for="floatingInput">Usuario</label>
                </div>
                <div class="form-floating">
                    <input type="password" class="form-control" name="pass" id="floatingPassword" placeholder="Password" required="">
                    <label for="floatingPassword">Contrase??a</label>
                </div>

                <button class="w-100 btn btn-lg colorBtn" type="submit">Iniciar Sesi??n</button>

            </form>
            <c:if test="${usuCorrecto eq 'no'}">
                <div id="error" class="text-danger fw-bold mt-5">
                    ${errorUsuario}
                </div>
            </c:if>
            <p class="mt-5 mb-3 text-muted">?? IES Martin Rivero 2Daw 2023</p>
        </main>


        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    </body>
</html>
