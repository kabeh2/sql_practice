-- INSERT INTO cats(name, age)
-- VALUES ('Charlie', 17),
--        ('Connie', 10);

-- *************************************************
-- SECTION 8: REFINING OUR SELECTIONS START
-- *************************************************

-- SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;

-- SELECT 
--     CONCAT(title, ' - ', released_year) AS summary 
-- FROM books
--     ORDER BY released_year DESC LIMIT 3;

-- SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';

-- SELECT title, released_year, stock_quantity FROM books ORDER BY stock_quantity, title LIMIT 3;

-- SELECT title, author_lname FROM books ORDER BY author_lname, title;

-- SELECT 
--     UPPER(
--         CONCAT(
--             'My Favourite Author is ', 
--             author_fname, 
--             ' ', 
--             author_lname, 
--             '!'
--             )
--         ) AS yell 
-- FROM books ORDER BY author_lname, author_fname;

-- *************************************************
-- SECTION 8: REFINING OUR SELECTIONS END
-- *************************************************

-- **************************************************
-- SECTION 9: THE MAGIC OF AGGREGATE FUNCTIONS START
-- **************************************************

-- Print the number of books in the database
-- SELECT COUNT(*) FROM books;

-- Print out how many books were released in each year
-- SELECT released_year, COUNT(*) FROM books GROUP BY released_year;

-- Print out the total number of books in stock
-- SELECT SUM(stock_quantity) FROM books;

-- Find the average released_year for each author
-- SELECT 
--     CONCAT(
--         author_fname, 
--         ' ', 
--         author_lname
--     ) AS author,
--     AVG(released_year)
-- FROM books GROUP BY author_lname, author_fname;

-- Find the full name of the author who wrote the longest book
-- SELECT 
--     CONCAT(
--         author_fname, 
--         ' ', 
--         author_lname
--     ) AS author, 
--     pages 
-- FROM books WHERE pages=(SELECT MAX(pages) FROM books);

-- Find the number of books and average number of pages for each year
-- SELECT 
--     released_year AS year, 
--     COUNT(*) AS '# books',
--     AVG(pages) AS 'avg pages'
-- FROM books GROUP BY released_year;

-- **************************************************
-- SECTION 9: THE MAGIC OF AGGREGATE FUNCTIONS END
-- **************************************************

-- **************************************************
-- SECTION 10: REVISITING DATA TYPES START
-- **************************************************
-- What's a good use case for CHAR?
-- Yes/No = y/n or Sex questions M/F

-- Fill in the Blanks
-- CREATE TABLE inventory (
--     item_name VARCHAR(200),
--     price DECIMAL(8,2),
--     quantity INT
-- )

-- What's the difference between DATETIME and TIMESTAMP?
-- TIMESTAMP is restricted to date and time range and is smaller size in memory
-- Used primarily for metadata

-- Print out the current time
-- SELECT CURTIME();

-- Print out the Current Date (but not time)
-- SELECT CURDATE();

-- Print out the Current Day of the Week (the number)
-- SELECT DAYOFWEEK(NOW());

-- Print out the current Day of the Week (The Day Name);
-- SELECT DAYNAME(NOW());

-- Print out the current day and time using this format: mm/dd/yyyy
-- SELECT DATE_FORMAT(NOW(), '%m/%d/%Y');

-- Print out the current day and time using this format: January 2nd at 3:15
-- SELECT DATE_FORMAT(NOW(), '%M %D at %l:%i');

-- Create a Tweets table that stores:
--     - The tweet content
--     - A Username
--     - Time it was created

-- CREATE TABLE tweets(
--     tweet_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
--     content VARCHAR(500) NOT NULL,
--     username VARCHAR(20),
--     created_at TIMESTAMP DEFAULT NOW()
--     );
-- **************************************************
-- SECTION 10: REVISITING DATA TYPES END
-- **************************************************