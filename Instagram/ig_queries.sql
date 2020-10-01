-- USE ig_clone; 

-- 1. Finding 5 oldest users
-- SELECT * FROM users ORDER BY created_at LIMIT 5;

-- 2. What day of the week do most users register on?
-- FIND THE DAY OF THE WEEK
-- FIND THE COUNT OF USERS ON THAT DAY
-- SELECT
--     DAYNAME(created_at) AS day,
--     COUNT(*) AS total
-- FROM users 
-- GROUP BY day
-- ORDER BY total DESC
-- LIMIT 2;

-- 3. Find users that have never posted a photo
-- SELECT username, photos.id FROM users
-- LEFT JOIN photos
--     ON users.id = photos.user_id
-- WHERE photos.id IS NULL;

-- 4. Who got the most likes on a single photo
-- SELECT 
--     username, 
--     photos.id, 
--     COUNT(likes.user_id) AS likes
-- FROM users
-- JOIN photos
--     ON users.id = photos.user_id
-- JOIN likes
--     ON photos.id = likes.photo_id
-- GROUP BY photos.id
-- ORDER BY likes DESC
-- LIMIT 1;


-- 5. How many times does the average user post?
-- USE SUBQUERIES
-- SELECT ((SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users)) AS 'AVG POSTS';


-- 6. What are the TOP 5 MOST COMMONLY USED HASHTAGS?
-- SELECT
--     tag_name,
--     COUNT(photo_tags.tag_id) AS 'tag count'
-- FROM tags
-- INNER JOIN photo_tags
--     ON tags.id = photo_tags.tag_id
-- GROUP BY tags.id
-- ORDER BY 2 DESC
-- LIMIT 5;


-- 7. Find users that have liked every single photo on the site
-- SELECT
--     username,
--     image_url,
--     COUNT(likes.user_id)
-- FROM users
-- INNER JOIN photos
--     ON users.id = photos.user_id
-- INNER JOIN likes
--     ON photos.id = likes.photo_id
-- GROUP BY username;

-- HOW MANY PHOTOS ARE THERE?
-- SELECT COUNT(*) FROM photos;

-- HOW MANY PHOTOS HAS EACH USER LIKED?
SELECT
    username,
    COUNT(likes.photo_id) AS total
FROM users
INNER JOIN likes
    ON users.id = likes.user_id
GROUP BY users.id
HAVING total=(SELECT COUNT(*) FROM photos);