# Create a ig_clone database
CREATE DATABASE ig_clone;
USE ig_clone;


# Users table
CREATE TABLE users(
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

# PHOTOS TABLE
CREATE TABLE photos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

# COMMENTS TABLE
CREATE TABLE comments(
    id INT AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id)
);

# LIKES TABLE
CREATE TABLE likes(
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id,photo_id)
);


# FOLLOWERS TABLE
CREATE TABLE follows(
    follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id,followee_id)
);


# HASHTAGS TABLE 
CREATE TABLE tags(
    id INT AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tags(
    photo_id INT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id,tag_id)
);

 
# Instagram Clone Challenge #1 - list the 5 oldest users

SELECT * FROM users ORDER BY created_at LIMIT 5;

# Instagram Clone Challenge #2 - find out which day of the week do most users register on 

SELECT DAYNAME(created_at) AS 'Day', COUNT(*) AS 'Number of registrations' FROM users GROUP BY DAYNAME(created_at) ORDER BY COUNT(*) DESC;


# Instagram Clone Challenge #3 - inactive users(dont post)

SELECT username
FROM users
LEFT JOIN photos
    ON users.id = photos.user_id
WHERE photos.id IS NULL;

# Instagram Clone Challenge #4 - single most liked photo

SELECT username, photos.id, photos.image_url,  COUNT(*) AS 'Number of likes'
FROM photos
INNER JOIN likes
    ON photos.id = likes.photo_id
INNER JOIN users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY COUNT(*) DESC
LIMIT 1;

# Instagram Clone Challenge #5 - How many times the average user post

SELECT (SELECT Count(*) FROM photos) / (SELECT Count(*) FROM users) AS avg; 
                          
                          
# Instagram Clone Challenge #6 - Top 5 hashtags

SELECT tags.tag_name, 
       Count(*) AS total 
FROM   photo_tags 
       JOIN tags 
         ON photo_tags.tag_id = tags.id 
GROUP  BY tags.id 
ORDER  BY total DESC 
LIMIT  5; 

# Instagram Clone Challenge #7

SELECT username, 
       Count(*) AS num_likes 
FROM   users 
       INNER JOIN likes 
               ON users.id = likes.user_id 
GROUP  BY likes.user_id 
HAVING num_likes = (SELECT Count(*) 
                    FROM   photos); 