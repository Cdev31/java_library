package Services;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author kalet
 */


import Services.ComunDB;
import Services.Books;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookService {
    private List<Books> bookList;

    public BookService() {
        bookList = new ArrayList<Books>();
    }
    
    public void createBook(String title, String description,  int stock, float price, String author) {
    String sql = "INSERT INTO books (title, description, stock, price, author ) VALUES (?, ?, ?, ?, ?)";

    try (Connection connection = ComunDB.obtenerConexion();
         PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

        statement.setString(1, title);
        statement.setString(2, description);
        statement.setInt(3, stock);
        statement.setFloat(4, price);
        statement.setString(5, author);
        
        statement.executeUpdate();

        // Obtener el ID generado automáticamente
        try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
            if (generatedKeys.next()) {
                int generatedId = generatedKeys.getInt(1);
                Books book = new Books(title, description, stock, price, author);
                bookList.add(book);
            } else {
                throw new SQLException("Fallo al obtener el ID generado para el libro.");
            }
        }

    } catch (SQLException ex) {
        ex.printStackTrace();
    }
}
  
  

    public List<Books> getAllBooks() {
        String sql = "SELECT * FROM books";
        List<Books> books= new ArrayList<>();

        try (Connection connection = ComunDB.obtenerConexion();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {

            while (resultSet.next()) {
                Books book = new Books(
                        resultSet.getString("title"),
                        resultSet.getString("description"),
                        resultSet.getInt("stock"),
                        resultSet.getFloat("price"),
                        resultSet.getString("author")
                );
                books.add(book);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return books;
    }
}



