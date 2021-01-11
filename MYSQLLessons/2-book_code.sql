# SELECT 
#     CONCAT
#     (
#             SUBSTRING(title,1,10),
#             '...'
#     ) AS 'Short Title' 
#  FROM books;

# SELECT
#     SUBSTRING(REPLACE(title, 'e', '3'), 1, 10) AS 'weird string'
# FROM books;

# SELECT REVERSE(author_fname) FROM books;

# SELECT CONCAT(author_fname, REVERSE(author_fname)) FROM books;

# SELECT CHAR_LENGTH('Hello World');
 
# SELECT author_lname, CHAR_LENGTH(author_lname) AS 'length' FROM books;
 
# SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') FROM books;



# SELECT UPPER('Hello World');
 
# SELECT LOWER('Hello World');
 
# SELECT UPPER(title) FROM books;
 
# SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(title)) FROM books;
 
# SELECT CONCAT('MY FAVORITE BOOK IS ', LOWER(title)) FROM books;


# String function challenge code
SELECT REVERSE
    (
        UPPER('Why does my cat look at me with such hatred?')
    ) AS 'Reverse Uppercase';

SELECT
    REPLACE
    (
    CONCAT('I', ' ', 'like', ' ', 'cats'),
    ' ',
    '-'
    ) AS 'replace';
    
SELECT 
    REPLACE
    (
        title,
        ' ',
        '->'
    ) AS 'title' 
FROM books;

SELECT 
    author_lname AS 'forwards',
    REVERSE
    (
        author_lname    
    ) AS 'backwards'
FROM books;

SELECT
    UPPER
    (
        CONCAT
        (
            author_fname,
            ' ',
            author_lname
        )
    ) AS 'full name in caps'
FROM books;

SELECT
    CONCAT
    (
        title,
        ' was released in ',
        released_year
    ) AS 'blurb'
FROM books;

SELECT
    title,
    CHAR_LENGTH(title) AS 'character count'
FROM books;

SELECT 
    CONCAT(SUBSTRING(title,1,10),'...') AS 'short title',
    CONCAT(author_lname,',',author_fname) AS 'author',
    CONCAT(stock_quantity,' in stock') AS 'quantity'
FROM books;




