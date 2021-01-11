# # Count(*)

# SELECT COUNT(*) FROM books;
 
# SELECT COUNT(author_fname) FROM books;
 
# SELECT COUNT(DISTINCT author_fname) FROM books;
 
# SELECT COUNT(DISTINCT author_lname) FROM books;
 
# SELECT COUNT(DISTINCT author_lname, author_fname) FROM books;
 
# SELECT title FROM books WHERE title LIKE '%the%';
 
# SELECT COUNT(*) FROM books WHERE title LIKE '%the%';

# # Group By

# SELECT title, author_lname FROM books;
 
# SELECT title, author_lname FROM books
# GROUP BY author_lname;
 
# SELECT author_lname, COUNT(*) 
# FROM books GROUP BY author_lname;
 
 
# SELECT title, author_fname, author_lname FROM books;
 
# SELECT title, author_fname, author_lname FROM books GROUP BY author_lname;
 
# SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname;
 
# SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname, author_fname;
 
# SELECT released_year FROM books;
 
# SELECT released_year, COUNT(*) FROM books GROUP BY released_year;
 
# SELECT CONCAT('In ', released_year, ' ', COUNT(*), ' book(s) released') AS year FROM books GROUP BY released_year;

# # Min and Max

# SELECT MIN(released_year) 
# FROM books;
 
# SELECT MIN(released_year) FROM books;
 
# SELECT MIN(pages) FROM books;
 
# SELECT MAX(pages) 
# FROM books;
 
# SELECT MAX(released_year) 
# FROM books;
 
# SELECT MAX(pages), title
# FROM books;

# # SUBQUERIES

# SELECT * FROM books 
# WHERE pages = (SELECT Min(pages) 
#                 FROM books); 
 
# SELECT title, pages FROM books 
# WHERE pages = (SELECT Max(pages) 
#                 FROM books); 
 
# SELECT title, pages FROM books 
# WHERE pages = (SELECT Min(pages) 
#                 FROM books); 
 
# SELECT * FROM books 
# ORDER BY pages ASC LIMIT 1;
 
# SELECT title, pages FROM books 
# ORDER BY pages ASC LIMIT 1;
 
# SELECT * FROM books 
# ORDER BY pages DESC LIMIT 1;

# # MIN and MAX with GROUP BY

# SELECT author_fname, 
#        author_lname, 
#        Min(released_year) 
# FROM   books 
# GROUP  BY author_lname, 
#           author_fname;
 
# SELECT
#   author_fname,
#   author_lname,
#   Max(pages)
# FROM books
# GROUP BY author_lname,
#          author_fname;
 
# SELECT
#   CONCAT(author_fname, ' ', author_lname) AS author,
#   MAX(pages) AS 'longest book'
# FROM books
# GROUP BY author_lname,
#          author_fname;
         
# # Sum Function

# SELECT SUM(pages)
# FROM books;
 
# SELECT SUM(released_year) FROM books;
 
# SELECT author_fname,
#        author_lname,
#        Sum(pages)
# FROM books
# GROUP BY
#     author_lname,
#     author_fname;
 
# SELECT author_fname,
#        author_lname,
#        Sum(released_year)
# FROM books
# GROUP BY
#     author_lname,
#     author_fname;
    
# # Average Function

# SELECT AVG(released_year) 
# FROM books;
 
# SELECT AVG(pages) 
# FROM books;
 
# SELECT AVG(stock_quantity) 
# FROM books 
# GROUP BY released_year;
 
# SELECT released_year, AVG(stock_quantity) 
# FROM books 
# GROUP BY released_year;
 
# SELECT author_fname, author_lname, AVG(pages) FROM books
# GROUP BY author_lname, author_fname;

# Aggregate Function Challenge

SELECT COUNT(*) FROM books;

SELECT released_year, COUNT(*) FROM books GROUP BY released_year;

SELECT SUM(stock_quantity) AS 'Total books in stock' from books;

SELECT concat(author_lname,',', author_fname) AS 'Author', AVG(released_year) AS 'Average book release year' FROM books GROUP BY author_lname, author_fname;

SELECT CONCAT(author_fname,' ', author_lname) AS 'Author', pages FROM books WHERE pages=(SELECT MAX(pages) FROM books);

SELECT CONCAT(author_fname,' ', author_lname) AS 'Author', pages FROM books ORDER BY pages DESC LIMIT 1;

SELECT released_year AS 'year', COUNT(*) AS '# of books', AVG(pages) AS 'avg pages' FROM books GROUP BY released_year;