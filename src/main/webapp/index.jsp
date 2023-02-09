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
    </head>
    <body>
        <c:if test="${usuCorrecto eq 'no'}">
            <div id="error">
                ${errorUsuario}
            </div>
        </c:if>
        <h1>Login</h1>
        <form action="index.jsp">
            <label>Usuario: <input type="text" name="usuario" placeholder="Usuario" required="required"/></label>
            <label>Contraseña: <input type="password" name="pass" placeholder="Contraseña" required="required"/></label>
            <input type="submit" value="Iniciar Sesión"/>
        </form>
    </body>
</html>
