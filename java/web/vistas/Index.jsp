<%-- 
    Document   : Index
    Created on : 14 ago. 2023, 10:47:27
    Author     : kalet
--%>

<%@page import="java.util.List"%>
<%@page language="java"  contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Services.Books" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            *{
                border: 0;
                margin: 0;
                box-sizing: border-box;
            }
            body{
                display: grid;
                grid-template-columns: minmax(100px,auto) minmax(100px,auto) minmax(100px,auto) minmax(100px,auto);
                grid-template-rows: repeat(4,minmax(150px, auto));
            }

            h1{
                grid-column: 1 / 5;
                grid-row: 1 / 2;
                font-weight: bold;
                align-self: center;
                justify-self: center;
                border: 1px solid rgb(189, 61, 23);
                padding-top: 20px;
                padding-left: 20px;
            }
        </style>
    </head>
    <body>
        <h1>Book App</h1>

        <table>
        <tr>
            <th>Título</th>
            <th>Descripción</th>
            <th>Stock</th>
            <th>Precio</th>
            <th>Autor</th>
        </tr>
        <% List<Books> books = (List<Books>) request.getAttribute("books");
           for (Books book : books) { %>
            <tr>
                <td><%= book.getBookTitle() %></td>
                <td><%= book.getDescription() %></td>
                <td><%= book.getStock() %></td>
                <td><%= book.getPrice() %></td>
                <td><%= book.getAuthor() %></td>
            </tr>
        <% } %>
    </table>
    <a href="/java/AddBookForm">Agregar Nuevo Libro</a>
    </body>
</html>
