-- 1. Finding 5 oldet users
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
SELECT 
    username, 
    photos.id, 
    COUNT(likes.user_id) AS likes
FROM users
JOIN photos
    ON users.id = photos.user_id
JOIN likes
    ON photos.id = likes.photo_id
GROUP BY photos.id
ORDER BY likes DESC
LIMIT 1;