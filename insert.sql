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

-- **************************************************
-- SECTION 11: THE POWER OF LOGICAL OPERATORS START
-- **************************************************

-- Evaluate the Following...
-- SELECT 10 != 10; // 0
-- SELECT 15 > 14 && 99 - 5 <= 94; // 1
-- SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10; // 1

-- Select all Books Written Before 1980 (non inclusive)
-- SELECT * FROM books WHERE released_year < 1980;

-- Select All Books Written By Eggers Or Chabon
-- SELECT * FROM books WHERE author_lname IN ('Eggers', 'Chabon');

-- Select All Books Written By Lahiri, Published after 2000
-- SELECT * FROM books 
--     WHERE 
--         author_lname = 'Lahiri' && 
--         released_year > 2000;

-- Select All Books with page counts between 100 and 200
-- SELECT * FROM books WHERE pages BETWEEN 100 AND 200;

-- Select all books where author_lname starts with a 'C' or an 'S'
-- SELECT * FROM books 
--     WHERE 
--         author_lname LIKE 'C%' OR 
--         author_lname LIKE 'S%';
-- OR USE
-- SELECT * FROM books 
--     WHERE 
--         SUBSTR(author_lname, 1, 1) = 'C%' OR 
--         SUBSTR(author_lname, 1, 1) = 'S%';
-- OR USE
-- SELECT * FROM books 
--     WHERE 
--         SUBSTR(author_lname, 1, 1) IN ('C', 'S');

-- If title contains 'stories' => Short Stories
-- Just Kids and A Heartbreaking Work => Memoir
-- Everything Else => Novel

-- SELECT title, author_lname,
--     CASE
--         WHEN title LIKE '%stories%' THEN 'Short Stories'
--         WHEN title LIKE '%Just Kids%' OR title LIKE 'A Hearbreaking Work%' THEN 'Memoir'
--         ELSE 'Novel'
--     END AS TYPE
-- FROM books;


-- BONUS: Show how many books author has written
-- SELECT author_lname,
--     CASE
--         WHEN COUNT(*) = 1 THEN CONCAT(COUNT(*), ' book')
--         ELSE CONCAT(COUNT(*), ' books')
--     END AS COUNT
-- FROM books GROUP BY author_lname, author_fname;

-- **************************************************
-- SECTION 11: THE POWER OF LOGICAL OPERATORS END
-- **************************************************


-- **************************************************
-- SECTION 12: ONE TO MANY START
-- **************************************************

CREATE TABLE

-- **************************************************
-- SECTION 12: ONE TO MANY END
-- **************************************************