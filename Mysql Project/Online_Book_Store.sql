CREATE DATABASE onlinebookstore;
use onlinebookstore;

SELECT * FROM books;
SELECT * FROM customers;
SELECT * FROM orders;

-- 1) Retrieve all books from "Fiction" Genre

SELECT * FROM books
WHERE Genre = 'Fiction';

-- 2) Find books published after the year 1950

SELECT Book_ID,Title AS book_names,Author,Genre,Published_Year,Price,Stock FROM books
WHERE Published_Year > 1950;

-- 3) List all the customers from the Canada

SELECT * FROM customers 
WHERE Country = 'Canada';

-- 4) Show orders placed in November 2023

SELECT * From orders
WHERE Order_Date BETWEEN '2023-11-01' AND '2023-11-30';

-- 5) Retrieve the total stock of book available

SELECT SUM(Stock) AS total_stock 
FROM books;

-- 6) Find the details of most expensive book

SELECT * 
FROM books 
ORDER BY Price DESC LIMIT 1;

-- 7) Show all customers who ordered more than 1 quantity of a book

SELECT * FROM orders
WHERE Quantity > 1;

-- 8) Retrieve all orders where the total amount exceeds 20

SELECT * FROM orders
WHERE Total_Amount > 20;

-- 9) List all Genre available in book table

SELECT DISTINCT Genre
FROM books;

-- 10) Find the book with the lowest stock

SELECT *
FROM books
ORDER BY Stock ASC
LIMIT 1;

-- 11) Calculate the total revenue generated from all orders

SELECT SUM(Total_Amount) AS Revenue
FROM orders;

-- Advance Questions :

-- 1) Retrieve the total number of books sold for each genre

SELECT b.Genre, SUM(o.Quantity) AS total_books_sold
FROM orders AS o
JOIN books AS b
ON o.book_id = b.book_id
GROUP by b.Genre;

-- 2) Find the average price of books in the 'Fantasy' Genre

SELECT AVG(Price) AS average_price
FROM books
WHERE Genre = 'Fantasy';

-- 3) List customers who have placed at least 2 orders

SELECT Customer_ID,COUNT(Order_ID) AS order_count
FROM orders
GROUP BY Customer_ID
HAVING COUNT(Order_ID) >= 2;

-- 4) Find the most frequently ordered book

SELECT Book_ID,COUNT(Order_ID) AS order_count
FROM orders
GROUP BY Book_ID
ORDER BY order_count DESC LIMIT 1;

-- 5) Show the top 3 most expensive books of 'Fantasy' genre

SELECT * FROM books 
WHERE Genre = 'Fantasy'
ORDER BY Price DESC
LIMIT 3;

-- 6) Retrieve the total quantity of books sold by each author

SELECT b.author,SUM(o.Quantity) AS total_books_sold
FROM orders AS o
JOIN books AS b
ON o.Book_ID = b.Book_ID
GROUP BY b.Author;

-- 7) List the cities where customer's who spent over 30 are located

SELECT DISTINCT c.city
FROM orders AS o
JOIN customers AS c
ON o.Customer_ID = c.Customer_ID
WHERE o.Total_Amount > 30;

-- 8) Find the customers who spent the most on orders

SELECT c.Customer_ID,c.name,SUM(o.Total_Amount) AS Total_spent
FROM orders AS o
JOIN customers AS c
ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_ID,c.name
ORDER BY total_spent DESC LIMIT 1;

-- 9) Calculate the stock remaining after fulfilling all orders

SELECT b.Book_ID,b.title,b.stock,COALESCE(SUM(o.quantity),0) AS order_quantity,b.stock-COALESCE (SUM(o.quantity),0) AS order_quantity
FROM books AS b
LEFT JOIN orders AS o
ON b.Book_ID = o.Book_ID
GROUP BY b.Book_ID
ORDER BY b.book_ID;



