CREATE DATABASE bookDB;

use bookDB;

CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    stock INT NOT NULL,
    price FLOAT NOT NULL,
    author VARCHAR(255) NOT NULL
);
