<%-- 
    Document   : CreateTodo
    Created on : 14 ago. 2023, 10:47:50
    Author     : kalet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <h1>Agregar Nuevo Libro</h1>
         
    <form action="BookController" method="post">
        Título: <input type="text" name="title"><br>
        Descripción: <input type="text" name="description"><br>
        Stock: <input type="number" name="stock"><br>
        Precio: <input type="number" step="0.01" name="price"><br>
        Autor: <input type="text" name="author"><br>
        <input type="submit" value="Agregar Libro">
    </form>
    
    </body>
</html>
