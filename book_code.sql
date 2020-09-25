SELECT CONCAT
    (
        SUBSTR(title, 1, 10), 
        '...'
    ) AS 'short title' 
FROM books;